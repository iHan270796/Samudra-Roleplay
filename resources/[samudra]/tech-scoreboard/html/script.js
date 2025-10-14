let currentPlayers = [];
let filteredPlayers = [];
let jobStats = {};
let jobConfigs = {};
let robberyAvailability = {};
let layoutConfig = {};
let visibilityConfig = {};
let robberySettings = {};
let lastUpdateTime = 0;
let updateInProgress = false;
let playerHidden = false;
let playerId = null;

// Initialize scoreboard
document.addEventListener('DOMContentLoaded', function() {
    updateTime();
    setInterval(updateTime, 1000);
    
    // Search functionality with debouncing
    const searchInput = document.getElementById('searchInput');
    let searchTimeout;
    searchInput.addEventListener('input', function() {
        clearTimeout(searchTimeout);
        searchTimeout = setTimeout(() => {
            filterPlayers(this.value);
        }, 300); // Debounce search for 300ms
    });
    
    // Hide button functionality
    const hideToggleBtn = document.getElementById('hideToggle');
    hideToggleBtn.addEventListener('click', function() {
        togglePlayerVisibility();
    });
});

// Listen for NUI messages
window.addEventListener('message', function(event) {
    const data = event.data;
    
    switch(data.action) {
        case 'openScoreboard':
            openScoreboard(data);
            break;
        case 'closeScoreboard':
            closeScoreboard();
            break;
        case 'updateData':
            updateScoreboardData(data);
            break;
    }
});

// Open scoreboard
function openScoreboard(data) {
    const scoreboard = document.getElementById('scoreboard');
    scoreboard.classList.remove('hidden');
    
    // Update server info
    document.querySelector('.server-name').textContent = data.serverInfo.name;
    document.querySelector('.server-description').textContent = data.serverInfo.description;
    
    // Store player ID for hide functionality
    if (data.playerId) {
        playerId = data.playerId;
    }
    
    // Show/hide the Hide My Info button based on configuration
    const visibilityControls = document.querySelector('.visibility-controls-header');
    if (visibilityControls) {
        if (data.showHideButton === false) {
            visibilityControls.style.display = 'none';
        } else {
            visibilityControls.style.display = 'flex';
        }
    }
}

// Close scoreboard
function closeScoreboard() {
    const scoreboard = document.getElementById('scoreboard');
    scoreboard.classList.add('hidden');
    
    // Send close callback to Lua
    fetch(`https://${GetParentResourceName()}/closeScoreboard`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({})
    });
}

// Update scoreboard data with performance optimizations
function updateScoreboardData(data) {
    // Prevent multiple simultaneous updates
    if (updateInProgress) return;
    updateInProgress = true;
    
    
    // Check if data is newer
    if (data.serverStats.lastUpdate && data.serverStats.lastUpdate <= lastUpdateTime) {
        updateInProgress = false;
        return;
    }
    
    lastUpdateTime = data.serverStats.lastUpdate || Date.now();
    
    // Update data with smooth transitions
    const oldPlayers = currentPlayers;
    const oldJobStats = jobStats;
    
    currentPlayers = data.players;
    jobStats = data.jobStats;
    jobConfigs = data.jobConfigs || {};
    robberyAvailability = data.robberyAvailability || {};
    layoutConfig = data.layoutConfig || {};
    visibilityConfig = data.visibilityConfig || {};
    robberySettings = data.robberySettings || {};
    
    // Show/hide visibility controls based on configuration
    const visibilityControls = document.querySelector('.visibility-controls');
    if (visibilityControls) {
        visibilityControls.style.display = visibilityConfig.allowPlayerHideToggle ? 'flex' : 'none';
    }
    
    // Apply layout configuration
    applyLayoutConfiguration();
    
    // Update UI with smooth transitions
    updatePlayerCount(data.serverStats);
    updateJobStatsWithAnimation(oldJobStats);
    updateRobberyAvailability();
    filterPlayers(document.getElementById('searchInput').value);
    
    updateInProgress = false;
}

// Update player count
function updatePlayerCount(serverStats) {
    document.getElementById('playerCount').textContent = 
        `${serverStats.playersOnline}/${serverStats.maxPlayers}`;
    
    // Update police count badge
    const policeCountElement = document.getElementById('policeCount');
    if (policeCountElement && serverStats.policeOnline !== undefined) {
        policeCountElement.textContent = `${serverStats.policeOnline} Police Online`;
    }
}

// Update job statistics
function updateJobStats() {
    const jobStatsContainer = document.querySelector('.job-stats');
    
    // Clear existing job cards
    jobStatsContainer.innerHTML = '';
    
    // Create job cards dynamically based on active jobs
    for (const [jobName, count] of Object.entries(jobStats)) {
        if (count > 0) {
            const jobCard = createJobCard(jobName, count);
            jobStatsContainer.appendChild(jobCard);
        }
    }
}

// Create job card element
function createJobCard(jobName, count) {
    const jobCard = document.createElement('div');
    jobCard.className = `job-stat ${jobName}`;
    
    const jobConfig = jobConfigs[jobName] || getDefaultJobConfig(jobName);
    const icon = `fas fa-${jobConfig.icon}`;
    const label = jobConfig.label;
    
    jobCard.innerHTML = `
        <i class="${icon}"></i>
        <div class="job-info">
            <span class="job-count">${count}</span>
            <span class="job-label">${label}</span>
        </div>
    `;
    
    // Apply custom styling if available
    if (jobConfig && jobConfig.color) {
        jobCard.style.borderColor = jobConfig.color;
        jobCard.querySelector('i').style.color = jobConfig.color;
    }
    
    return jobCard;
}

// Get default job configuration for jobs not in server config
function getDefaultJobConfig(jobName) {
    const defaultConfigs = {
        'police': { label: 'Police', color: '#3B82F6', icon: 'shield-alt' },
        'ambulance': { label: 'Medical', color: '#EF4444', icon: 'heart' },
        'mechanic': { label: 'Mechanic', color: '#F59E0B', icon: 'wrench' },
        'sheriff': { label: 'Sheriff', color: '#10B981', icon: 'shield-alt' },
        'lawyer': { label: 'Lawyer', color: '#8B5CF6', icon: 'briefcase' },
        'realestate': { label: 'Real Estate', color: '#EC4899', icon: 'home' },
        'mechanic1': { label: 'Mechanic 2', color: '#8B5CF6', icon: 'wrench' },
        'unemployed': { label: 'Unemployed', color: '#6B7280', icon: 'user' }
    };
    
    return defaultConfigs[jobName] || { 
        label: jobName.charAt(0).toUpperCase() + jobName.slice(1), 
        color: '#6B7280', 
        icon: 'user' 
    };
}

// Filter players
function filterPlayers(searchTerm) {
    const term = searchTerm.toLowerCase();
    
    filteredPlayers = currentPlayers.filter(player => 
        player.name.toLowerCase().includes(term) ||
        player.job.toLowerCase().includes(term) ||
        player.jobLabel.toLowerCase().includes(term)
    );
    
    updatePlayersList();
    document.getElementById('filteredCount').textContent = filteredPlayers.length;
}

// Update players list
function updatePlayersList() {
    const playersList = document.getElementById('playersList');
    playersList.innerHTML = '';
    
    if (filteredPlayers.length === 0) {
        playersList.innerHTML = `
            <div style="text-align: center; padding: 40px; color: #a0a0a0;">
                <i class="fas fa-users" style="font-size: 48px; margin-bottom: 15px; opacity: 0.5;"></i>
                <p>No players found</p>
            </div>
        `;
        return;
    }
    
    filteredPlayers.forEach(player => {
        const playerElement = createPlayerElement(player);
        playersList.appendChild(playerElement);
    });
}

// Toggle player visibility
function togglePlayerVisibility() {
    playerHidden = !playerHidden;
    const hideToggleBtn = document.getElementById('hideToggle');
    const icon = hideToggleBtn.querySelector('i');
    const span = hideToggleBtn.querySelector('span');
    
    if (playerHidden) {
        hideToggleBtn.classList.add('active');
        icon.className = 'fas fa-eye-slash';
        span.textContent = 'Show My Info';
    } else {
        hideToggleBtn.classList.remove('active');
        icon.className = 'fas fa-eye';
        span.textContent = 'Hide My Info';
    }
    
    // Send toggle request to server
    fetch(`https://${GetParentResourceName()}/toggleVisibility`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            hidden: playerHidden
        })
    });
    
    // Refresh the player list to reflect changes
    updatePlayersList();
}

// Create player element
function createPlayerElement(player) {
    const playerDiv = document.createElement('div');
    playerDiv.className = 'player-item';
    
    const jobColor = getJobColor(player.job);
    const pingClass = getPingClass(player.ping);
    
    // Check if this player is hidden
    const isHidden = player.hidden || false;
    
    // Discord avatar or default
    let avatarContent;
    const jobConfig = jobConfigs[player.job] || getDefaultJobConfig(player.job);
    const jobIcon = `fas fa-${jobConfig.icon}`;
    
    if (player.discord && player.discord.avatar && !isHidden) {
        avatarContent = `<img src="${player.discord.avatar}" alt="Avatar" class="discord-avatar" onerror="this.onerror=null;this.style.display='none';this.parentNode.innerHTML='<i class=\'${jobIcon}\'></i>';">`;
    } else {
        avatarContent = `<i class="${jobIcon}"></i>`;
    }
    
    // Discord name or character name
    let displayName;
    if (isHidden) {
        displayName = 'Hidden Player';
    } else {
        displayName = player.discord && player.discord.nickname ? 
            player.discord.nickname : 
            (player.discord && player.discord.username ? player.discord.username : player.name);
    }
    
    // Rank badge - show in front of name (only if not hidden)
    const rankBadge = (player.rank && !isHidden) ? `<span class="rank-badge" style="background: ${player.rankColor || '#444'}; color: white; padding: 2px 6px; border-radius: 3px; font-size: 10px; font-weight: bold; margin-right: 5px;">${player.rank}</span>` : '';
    
    // Job label (hidden if player is hidden)
    const jobLabel = isHidden ? 'Hidden' : player.jobLabel;
    
    playerDiv.innerHTML = `
        <div class="player-main-info">
            <div class="player-avatar" style="background: ${jobColor}; color: #000;">
                ${avatarContent}
            </div>
            <div class="player-details">
                <h3>${rankBadge} ${displayName}</h3>
                <div class="player-job">
                    <span class="job-badge" style="background: ${jobColor}; color: #000;">
                        ${jobLabel}
                    </span>
                    ${(player.discord && !isHidden) ? `<span class="discord-indicator"><i class="fab fa-discord"></i></span>` : ''}
                </div>
                <div style="font-size: 12px; color: #a0a0a0;">
                    ID: ${player.id}
                </div>
            </div>
        </div>
        <div class="player-stats">
            <div class="stat-group">
                <div class="label">Playtime</div>
                <div class="value">${formatPlaytime(player.playtime)}</div>
            </div>
            <div class="stat-group">
                <div class="label">Ping</div>
                <div class="value ${pingClass}">${player.ping}ms</div>
            </div>
        </div>
    `;
    
    return playerDiv;
}

// Utility functions
function getJobColor(job) {
    const jobConfig = jobConfigs[job] || getDefaultJobConfig(job);
    return jobConfig.color;
}



function getPingClass(ping) {
    if (ping < 50) return 'ping-good';
    if (ping < 100) return 'ping-medium';
    return 'ping-bad';
}

function formatPlaytime(minutes) {
    if (minutes == null || isNaN(minutes)) return "0h 0m";
    const hours = Math.floor(minutes / 60);
    const mins = minutes % 60;
    return `${hours}h ${mins}m`;
}

function formatMoney(amount) {
    return amount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

function updateTime() {
    const now = new Date();
    const timeString = now.toLocaleTimeString('en-US', { 
        hour12: false,
        hour: '2-digit',
        minute: '2-digit',
        second: '2-digit'
    });
    const timeElement = document.getElementById('serverTime');
    if (timeElement) {
        timeElement.textContent = timeString;
    }
}

// ESC key to close
document.addEventListener('keydown', function(event) {
    if (event.key === 'Escape') {
        closeScoreboard();
    }
});

// Prevent right-click context menu
document.addEventListener('contextmenu', function(event) {
    event.preventDefault();
});

// Update job statistics with smooth animations
function updateJobStatsWithAnimation(oldJobStats) {
    const jobStatsContainer = document.querySelector('.job-stats');
    
    // Get current job cards
    const currentJobCards = {};
    jobStatsContainer.querySelectorAll('.job-stat').forEach(card => {
        const jobName = card.className.match(/job-stat\s+(\w+)/)?.[1];
        if (jobName) {
            currentJobCards[jobName] = card;
        }
    });
    
    // Update existing cards and create new ones
    for (const [jobName, count] of Object.entries(jobStats)) {
        if (count > 0) {
            const existingCard = currentJobCards[jobName];
            
            if (existingCard) {
                // Update existing card with animation
                const countElement = existingCard.querySelector('.job-count');
                const oldCount = parseInt(countElement.textContent) || 0;
                
                if (oldCount !== count) {
                    // Animate count change
                    animateCountChange(countElement, oldCount, count);
                }
                
                // Remove from current cards to avoid deletion
                delete currentJobCards[jobName];
            } else {
                // Create new card with fade-in animation
                const jobCard = createJobCard(jobName, count);
                jobCard.style.opacity = '0';
                jobCard.style.transform = 'translateY(20px)';
                jobStatsContainer.appendChild(jobCard);
                
                // Animate in
                setTimeout(() => {
                    jobCard.style.transition = 'all 0.3s ease';
                    jobCard.style.opacity = '1';
                    jobCard.style.transform = 'translateY(0)';
                }, 50);
            }
        }
    }
    
    // Remove cards for jobs that no longer have players
    for (const [jobName, card] of Object.entries(currentJobCards)) {
        card.style.transition = 'all 0.3s ease';
        card.style.opacity = '0';
        card.style.transform = 'translateY(-20px)';
        
        setTimeout(() => {
            if (card.parentNode) {
                card.parentNode.removeChild(card);
            }
        }, 300);
    }
}

// Animate count changes
function animateCountChange(element, oldValue, newValue) {
    const duration = 500;
    const startTime = Date.now();
    
    function animate() {
        const elapsed = Date.now() - startTime;
        const progress = Math.min(elapsed / duration, 1);
        
        // Easing function for smooth animation
        const easeOut = 1 - Math.pow(1 - progress, 3);
        const currentValue = Math.round(oldValue + (newValue - oldValue) * easeOut);
        
        element.textContent = currentValue;
        
        if (progress < 1) {
            requestAnimationFrame(animate);
        }
    }
    
    animate();
}

// Update robbery availability
function updateRobberyAvailability() {
    const robberyGrid = document.getElementById('robberyGrid');
    if (!robberyGrid) return;
    
    robberyGrid.innerHTML = '';
    
    if (Object.keys(robberyAvailability).length === 0) {
        return;
    }
    
    let availableRobberies = 0;
    let totalRobberies = 0;
    
    for (const [robberyType, robberyData] of Object.entries(robberyAvailability)) {
        totalRobberies++;
        
        // Only show available robberies if configured to hide unavailable ones
        if (!robberyData.available && !robberySettings.showUnavailableRobberies) {
            continue;
        }
        
        if (robberyData.available) {
            availableRobberies++;
        }
        
        const robberyItem = document.createElement('div');
        robberyItem.className = `robbery-item ${robberyData.available ? 'available' : 'unavailable'}`;
        
        robberyItem.innerHTML = `
            <i class="${robberyData.icon}"></i>
            <div class="robbery-info">
                <h3>${robberyData.label}</h3>
                <p>Requires ${robberyData.policeRequired} police (${robberyData.policeOnline} online)</p>
            </div>
            <div class="robbery-status ${robberyData.available ? 'available' : 'unavailable'}">
                ${robberyData.available ? 'Available' : 'Unavailable'}
            </div>
        `;
        
        robberyGrid.appendChild(robberyItem);
    }
    
    // If no robberies are available, show a message
    if (totalRobberies === 0 || (availableRobberies === 0 && robberySettings.showNoRobberiesMessage)) {
        robberyGrid.innerHTML = `
            <div style="text-align: center; padding: 20px; color: #a0a0a0; grid-column: 1 / -1;">
                <i class="fas fa-shield-alt" style="font-size: 24px; margin-bottom: 10px; color: #6b7280;"></i>
                <p>No robberies available - insufficient police presence</p>
            </div>
        `;
    }
}

// Apply layout configuration
function applyLayoutConfiguration() {
    const scoreboardContainer = document.querySelector('.scoreboard-container');
    const jobStatsContainer = document.querySelector('.job-stats');
    const robberyGrid = document.getElementById('robberyGrid');
    const playersList = document.getElementById('playersList');
    
    if (!scoreboardContainer || !layoutConfig) return;
    
    // Apply scoreboard size
    scoreboardContainer.className = 'scoreboard-container';
    if (layoutConfig.scoreboardSize) {
        scoreboardContainer.classList.add(layoutConfig.scoreboardSize);
    }
    
    // Apply job stats grid layout
    if (jobStatsContainer && layoutConfig.gridLayout) {
        jobStatsContainer.className = 'job-stats';
        if (layoutConfig.gridLayout !== 'auto') {
            jobStatsContainer.classList.add(`grid-${layoutConfig.gridLayout}`);
        }
    }
    
    // Apply robbery grid layout
    if (robberyGrid && layoutConfig.gridLayout) {
        robberyGrid.className = 'robbery-grid';
        if (layoutConfig.gridLayout !== 'auto') {
            robberyGrid.classList.add(`grid-${layoutConfig.gridLayout}`);
        }
    }
    
    // Apply player list layout
    if (playersList && layoutConfig.playerListLayout) {
        playersList.className = 'players-list';
        if (layoutConfig.playerListLayout === 'grid') {
            playersList.classList.add('grid');
            if (layoutConfig.playersPerRow) {
                playersList.style.gridTemplateColumns = `repeat(${layoutConfig.playersPerRow}, 1fr)`;
            }
        } else if (layoutConfig.playerListLayout === 'compact') {
            playersList.classList.add('compact');
        }
    }
    
    // Apply responsive settings
    if (layoutConfig.responsive && window.innerWidth <= 768) {
        if (layoutConfig.mobileLayout === 'compact') {
            playersList.classList.add('compact');
        } else if (layoutConfig.mobileLayout === 'grid') {
            playersList.classList.add('grid');
        }
    }
}