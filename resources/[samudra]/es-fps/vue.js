const app = new Vue({
  el: '#app',
  data: {
    ui: false, // Test için açık
    activeTab: 'graphics',
    
    // Canlı FPS ve Performans Verileri - Gerçek Sistem Bilgileri
    currentFps: 60,
    cpuUsage: 45,
    gpuUsage: 62,
    ramUsage: 38,
    
    // Detaylı Performans Metrikleri
    frameTime: 16.67, // ms
    memoryUsage: 0,   // MB
    performanceHistory: [],
    
    // Oyuncu Profil Bilgileri
    playerProfile: {
      name: "John",
      surname: "Doe", 
      serverId: 1,
      avatar: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/Official_Presidential_Portrait_of_President_Donald_J._Trump_%282025%29.jpg/960px-Official_Presidential_Portrait_of_President_Donald_J._Trump_%282025%29.jpg",
      level: 42,
      playtime: "156h 23m",
      status: "Online"
    },

    // CMD Console Data
    commandInput: '',
    commandHistory: [],
    commandHistoryIndex: -1,
    consoleLogs: [
      {
        timestamp: new Date().toLocaleTimeString(),
        level: 'INFO',
        type: 'info',
        message: 'FiveM Console initialized successfully'
      },
      {
        timestamp: new Date().toLocaleTimeString(),
        level: 'INFO',
        type: 'info',
        message: 'Server: es-fps-optimization | Version: 1.0.0'
      },
      {
        timestamp: new Date().toLocaleTimeString(),
        level: 'SUCCESS',
        type: 'success',
        message: 'All resources loaded successfully'
      }
        ],

    // Resources Monitor Data
    resources: [
      {
        name: 'es-fps',
        status: 'started',
        resmon: 2.5,
        memory: 12.3,
        version: '1.0.0'
      },
      {
        name: 'es-extended',
        status: 'started',
        resmon: 15.2,
        memory: 45.7,
        version: '1.9.4'
      },
      {
        name: 'chat',
        status: 'started',
        resmon: 0.8,
        memory: 3.2,
        version: '1.0.0'
      },
      {
        name: 'spawnmanager',
        status: 'started',
        resmon: 1.2,
        memory: 5.8,
        version: '1.0.0'
      },
      {
        name: 'sessionmanager',
        status: 'started',
        resmon: 3.7,
        memory: 8.9,
        version: '1.0.0'
      },
      {
        name: 'mapmanager',
        status: 'started',
        resmon: 4.1,
        memory: 15.6,
        version: '1.0.0'
      },
      {
        name: 'mysql-async',
        status: 'started',
        resmon: 8.3,
        memory: 22.4,
        version: '3.3.2'
      },
      {
        name: 'example-script',
        status: 'stopped',
        resmon: 0.0,
        memory: 0.0,
        version: '1.0.0'
      }
    ],
    resourceSortBy: 'name',

    // Weather & Time Control Data
    weatherTypes: [
      { type: 'CLEAR', name: 'Clear', icon: 'fas fa-sun' },
      { type: 'CLOUDS', name: 'Cloudy', icon: 'fas fa-cloud' },
      { type: 'RAIN', name: 'Rain', icon: 'fas fa-cloud-rain' },
      { type: 'THUNDER', name: 'Storm', icon: 'fas fa-bolt' },
      { type: 'FOG', name: 'Fog', icon: 'fas fa-smog' },
      { type: 'SNOW', name: 'Snow', icon: 'fas fa-snowflake' }
    ],
    currentWeather: 'CLEAR',
    weatherSyncEnabled: true,
    currentTime: '14:30',
    customHour: 14,

    // Additional Controls Data
    trafficDensity: 50,
    pedDensity: 50,
    windSpeed: 30,
    motionBlurEnabled: false,
    depthOfFieldEnabled: false,
    screenEffectsEnabled: true,

    // Grafik Ayarları (FiveM Native'leri)
    graphicsSettings: {
      drawDistance: {
        label: "Draw Distance",
        description: "Controls how far objects are rendered in the distance",
        value: "Medium",
        options: ["Very Low", "Low", "Medium", "High", "Ultra"],
        impact: "high",
        native: "SetDrawDistance"
      },
      shadowQuality: {
        label: "Shadow Quality",
        description: "Adjusts the quality and detail of shadows cast by objects",
        value: "Low",
        options: ["Off", "Low", "Medium", "High"],
        impact: "high",
        native: "SetDrawShadows"
      },
      reflectionQuality: {
        label: "Reflection Quality",
        description: "Controls the quality of reflections on surfaces like water and glass",
        value: "Off",
        options: ["Off", "Low", "Medium", "High"],
        impact: "medium",
        native: "SetDrawReflections"
      }
    },

    // Gerçek FiveM Performans Ayarları
    performanceSettings: {
      disableVehicleDensity: {
        label: "Vehicle Density",
        description: "Reduces traffic density for better performance",
        enabled: false,
        fpsGain: 15,
        native: "SetVehicleDensityMultiplierThisFrame",
        icon: "fas fa-car"
      },
      disablePedDensity: {
        label: "Pedestrian Density", 
        description: "Reduces NPC population in the world",
        enabled: false,
        fpsGain: 12,
        native: "SetPedDensityMultiplierThisFrame",
        icon: "fas fa-walking"
      },
      disableScenarioPeds: {
        label: "Scenario Peds",
        description: "Disables ambient pedestrian scenarios",
        enabled: false,
        fpsGain: 8,
        native: "SetScenarioPedDensityMultiplierThisFrame",
        icon: "fas fa-users"
      },
      disableDistantLights: {
        label: "Distant Lights",
        description: "Disables far-distance light rendering",
        enabled: false,
        fpsGain: 10,
        native: "SetArtificialLightsState",
        icon: "fas fa-lightbulb"
      },
      disableWind: {
        label: "Wind Effects",
        description: "Disables environmental wind physics",
        enabled: false,
        fpsGain: 3,
        native: "SetWind",
        icon: "fas fa-wind"
      },
      disableParticles: {
        label: "Particle Effects",
        description: "Reduces particle system quality",
        enabled: false,
        fpsGain: 7,
        native: "SetParticleQuality", 
        icon: "fas fa-fire"
      },
      disableReflections: {
        label: "Reflections",
        description: "Disables surface reflections",
        enabled: false,
        fpsGain: 9,
        native: "SetReflectionQuality",
        icon: "fas fa-water"
      },
      disablePostFX: {
        label: "Post-Processing",
        description: "Disables screen-space effects",
        enabled: false,
        fpsGain: 14,
        native: "SetPostFXEnabled",
        icon: "fas fa-magic"
      },
      disableIdleCamera: {
        label: "Idle Camera",
        description: "Prevents idle camera movements",
        enabled: false,
        fpsGain: 5,
        native: "SetIdleCamEnabled",
        icon: "fas fa-video"
      },
      disableAmbientAudio: {
        label: "Ambient Audio",
        description: "Reduces background audio processing",
        enabled: false,
        fpsGain: 4,
        native: "SetAmbientZoneState",
        icon: "fas fa-volume-mute"
      },
      disableTrafficLights: {
        label: "Traffic Lights",
        description: "Disables traffic light processing",
        enabled: false,
        fpsGain: 6,
        native: "SetTrafficLightsState",
        icon: "fas fa-traffic-light"
      },
      disableGarbageTrucks: {
        label: "Garbage Trucks",
        description: "Prevents garbage truck spawning",
        enabled: false,
        fpsGain: 3,
        native: "SetGarbageTrucks",
        icon: "fas fa-truck"
      }
    }
  },

  computed: {
    fpsStatus() {
      if (this.currentFps >= 60) return "Excellent";
      if (this.currentFps >= 45) return "Good";
      if (this.currentFps >= 30) return "Fair";
      return "Poor";
    },
    fpsStatusClass() {
      if (this.currentFps >= 60) return "excellent";
      if (this.currentFps >= 45) return "good";
      if (this.currentFps >= 30) return "medium";
      return "poor";
    },
    fpsCircleOffset() {
      // 188.5 is the circumference of the circle (2 * π * 30) - same as other meters
      const circumference = 188.5;
      const percentage = Math.min(this.currentFps / 120, 1); // Max 120 FPS
      return circumference - (percentage * circumference);
    },

    cpuStatus() {
      if (this.cpuUsage <= 30) return "Excellent";
      if (this.cpuUsage <= 50) return "Good";
      if (this.cpuUsage <= 70) return "Fair";
      return "Critical";
    },
    cpuStatusClass() {
      if (this.cpuUsage <= 30) return "excellent";
      if (this.cpuUsage <= 50) return "good";
      if (this.cpuUsage <= 70) return "medium";
      return "poor";
    },

    gpuStatus() {
      if (this.gpuUsage <= 40) return "Excellent";
      if (this.gpuUsage <= 60) return "Good";
      if (this.gpuUsage <= 80) return "Fair";
      return "Critical";
    },
    gpuStatusClass() {
      if (this.gpuUsage <= 40) return "excellent";
      if (this.gpuUsage <= 60) return "good";
      if (this.gpuUsage <= 80) return "medium";
      return "poor";
    },

    ramStatus() {
      if (this.ramUsage <= 50) return "Excellent";
      if (this.ramUsage <= 70) return "Good";
      if (this.ramUsage <= 85) return "Fair";
      return "Critical";
    },
    ramStatusClass() {
      if (this.ramUsage <= 50) return "excellent";
      if (this.ramUsage <= 70) return "good";
      if (this.ramUsage <= 85) return "medium";
      return "poor";
    },

    // Resources computed properties
    sortedResources() {
      const sorted = [...this.resources];
      if (this.resourceSortBy === 'name') {
        return sorted.sort((a, b) => a.name.localeCompare(b.name));
      } else if (this.resourceSortBy === 'resmon') {
        return sorted.sort((a, b) => b.resmon - a.resmon);
      }
      return sorted;
    },

    runningResourcesCount() {
      return this.resources.filter(r => r.status === 'started').length;
    },

    stoppedResourcesCount() {
      return this.resources.filter(r => r.status === 'stopped').length;
    },

    totalResmon() {
      return this.resources.reduce((total, r) => total + (r.status === 'started' ? r.resmon : 0), 0).toFixed(1);
    },

    totalMemory() {
      return this.resources.reduce((total, r) => total + (r.status === 'started' ? r.memory : 0), 0).toFixed(1);
    },

    // Detaylı Performans Hesaplamaları
    averageFps() {
      if (this.performanceHistory.length === 0) return this.currentFps;
      const avgFps = this.performanceHistory.reduce((sum, entry) => sum + entry.fps, 0) / this.performanceHistory.length;
      return Math.floor(avgFps);
    },

    overallPerformance() {
      const avgFps = this.averageFps;
      const avgCpu = this.performanceHistory.length > 0 
        ? this.performanceHistory.reduce((sum, entry) => sum + entry.cpu, 0) / this.performanceHistory.length 
        : this.cpuUsage;
      const avgGpu = this.performanceHistory.length > 0 
        ? this.performanceHistory.reduce((sum, entry) => sum + entry.gpu, 0) / this.performanceHistory.length 
        : this.gpuUsage;
      
      if (avgFps >= 60 && avgCpu <= 60 && avgGpu <= 60) return "Excellent";
      if (avgFps >= 45 && avgCpu <= 75 && avgGpu <= 75) return "Good";
      if (avgFps >= 30 && avgCpu <= 85 && avgGpu <= 85) return "Fair";
      return "Poor";
    },

    overallPerformanceClass() {
      const performance = this.overallPerformance.toLowerCase();
      if (performance === "excellent") return "excellent";
      if (performance === "good") return "good";
      if (performance === "fair") return "medium";
      return "poor";
    }
  },

  methods: {
    openMenu() {
      this.ui = true;
      this.activeTab = 'graphics';
      
      // Smooth transition effect
      this.$nextTick(() => {
        const panel = document.querySelector('.mmorpg-panel');
        if (panel) {
          panel.style.transform = 'scale(0.8)';
          panel.style.opacity = '0';
          setTimeout(() => {
            panel.style.transition = 'all 0.3s cubic-bezier(0.4, 0, 0.2, 1)';
            panel.style.transform = 'scale(1)';
            panel.style.opacity = '1';
          }, 10);
        }
      });
    },

    closeMenu() {
      // Smooth close animation
      const panel = document.querySelector('.mmorpg-panel');
      if (panel) {
        panel.style.transition = 'all 0.2s cubic-bezier(0.4, 0, 0.2, 1)';
        panel.style.transform = 'scale(0.9)';
        panel.style.opacity = '0';
        
        setTimeout(() => {
          this.ui = false;
          
                     // NUI callback to Lua
           if (typeof fetch !== 'undefined') {
             fetch(`https://${GetParentResourceName()}/Close`, {
               method: 'POST',
               headers: { 'Content-Type': 'application/json' },
               body: JSON.stringify({ reason: 'manual_close' })
             }).catch(() => {});
           }
        }, 200);
      } else {
        this.ui = false;
        
                 // Fallback NUI callback
         if (typeof fetch !== 'undefined') {
           fetch(`https://${GetParentResourceName()}/Close`, {
             method: 'POST',
             headers: { 'Content-Type': 'application/json' },
             body: JSON.stringify({ reason: 'manual_close' })
           }).catch(() => {});
         }
      }
    },

    toggleMenu() {
      if (this.ui) {
        this.closeMenu();
      } else {
        this.openMenu();
      }
    },

    handleEscKey(event) {
      if (this.ui) {
        event.preventDefault();
        event.stopPropagation();
        this.closeMenu();
      }
    },

    setActiveTab(tab) {
      this.activeTab = tab;
    },

    updateGraphicsSetting(key) {
      const setting = this.graphicsSettings[key];
      
      // FiveM native çağrısı
      if (typeof fetch !== 'undefined') {
        fetch(`https://${GetParentResourceName()}/updateGraphics`, {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({
            setting: key,
            value: setting.value,
            native: setting.native
          })
        });
      }
    },

    togglePerformance(key) {
      this.performanceSettings[key].enabled = !this.performanceSettings[key].enabled;
      const setting = this.performanceSettings[key];
      
      // FiveM native çağrısı
      if (typeof fetch !== 'undefined') {
        fetch(`https://${GetParentResourceName()}/togglePerformance`, {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({
            setting: key,
            enabled: setting.enabled,
            native: setting.native
          })
        });
      }
    },

    applyPreset(preset) {
      const presets = {
        low: { 
          drawDistance: "Very Low", 
          shadowQuality: "Off", 
          reflectionQuality: "Off"
        },
        medium: { 
          drawDistance: "Low", 
          shadowQuality: "Low", 
          reflectionQuality: "Off"
        },
        high: { 
          drawDistance: "Medium", 
          shadowQuality: "Low", 
          reflectionQuality: "Low"
        },
        ultra: { 
          drawDistance: "High", 
          shadowQuality: "Medium", 
          reflectionQuality: "Medium"
        }
      };

      Object.keys(presets[preset]).forEach(key => {
        if (this.graphicsSettings[key]) {
          this.graphicsSettings[key].value = presets[preset][key];
          this.updateGraphicsSetting(key);
        }
      });
    },

    optimizePerformance() {
      if (this.currentFps < 30) {
        // Düşük FPS için agresif optimizasyon
        Object.keys(this.performanceSettings).forEach(key => {
          this.performanceSettings[key].enabled = true;
          this.togglePerformance(key);
        });
        this.applyPreset('low');
        
      } else if (this.currentFps < 45) {
        // Orta FPS için orta optimizasyon
        ['disableVehicleDensity', 'disablePedDensity', 'disableIdleCamera'].forEach(key => {
          this.performanceSettings[key].enabled = true;
          this.togglePerformance(key);
        });
        this.applyPreset('medium');
      }
    },

    getImpactText(impact) {
      const impacts = {
        low: "Low",
        medium: "Medium", 
        high: "High"
      };
      return impacts[impact] || "Unknown";
    },

    getCpuStatus(usage) {
      if (usage < 30) return "optimal";
      if (usage < 60) return "normal";
      if (usage < 80) return "high";
      return "critical";
    },

    getGpuStatus(usage) {
      if (usage < 40) return "optimal";
      if (usage < 70) return "normal";
      if (usage < 85) return "high";
      return "critical";
    },

    getRamStatus(usage) {
      if (usage < 50) return "optimal";
      if (usage < 75) return "normal";
      if (usage < 90) return "high";
      return "critical";
    },

    resetToDefaults() {
      // Grafik ayarlarını sıfırla
      this.graphicsSettings.drawDistance.value = "Medium";
      this.graphicsSettings.shadowQuality.value = "Low";
      this.graphicsSettings.reflectionQuality.value = "Low";
      
      // Performans ayarlarını sıfırla
      Object.keys(this.performanceSettings).forEach(key => {
        this.performanceSettings[key].enabled = false;
      });

      // FiveM'e reset komutu gönder
      if (typeof fetch !== 'undefined') {
        fetch(`https://${GetParentResourceName()}/resetSettings`, {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({
            graphics: this.graphicsSettings,
            performance: this.performanceSettings
          })
        }).catch(() => {});
      }
    },

    applySettings() {
      // Ayarları kontrol et
      if (!this.graphicsSettings || !this.performanceSettings) {
        console.error('Settings not properly initialized');
        return;
      }

      // FiveM'e tüm ayarları gönder
      if (typeof fetch !== 'undefined') {
        fetch(`https://${GetParentResourceName()}/applyAllSettings`, {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({
            graphics: this.graphicsSettings || {},
            performance: this.performanceSettings || {},
            world: {},
            effects: {}
          })
        }).then(response => {
          if (response.ok) {
            console.log('Settings applied successfully');
            
            // Apply işlemi başarılı olduktan sonra menu'yu kapat
            setTimeout(() => {
              fetch(`https://${GetParentResourceName()}/Close`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ reason: 'apply_settings' })
              }).catch(() => {});
              
              // UI'ı da kapat
              this.closeMenu();
            }, 10);
          }
        }).catch(error => {
          console.error('Error applying settings:', error);
        });
      }
    },

    cancelSettings() {
      // FiveM'e cancel komutu gönder
      if (typeof fetch !== 'undefined') {
        fetch(`https://${GetParentResourceName()}/cancelSettings`, {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({})
        }).catch(() => {});
      }
      
      this.closeMenu();
    },

    // CMD Console Methods
    executeCommand() {
      if (!this.commandInput.trim()) return;

      const command = this.commandInput.trim();
      this.commandHistory.unshift(command);
      this.commandHistoryIndex = -1;

      // Add command to console
      this.addConsoleLog('COMMAND', 'info', `> ${command}`);

      // Execute command
      this.processCommand(command);

      // Clear input
      this.commandInput = '';
      
      // Auto scroll to bottom
      this.$nextTick(() => {
        const output = this.$refs.consoleOutput;
        if (output) {
          output.scrollTop = output.scrollHeight;
        }
      });
    },

    processCommand(command) {
      const cmd = command.toLowerCase();
      
      // Simulate FiveM command responses
      setTimeout(() => {
        switch(cmd) {
          case 'status':
            this.addConsoleLog('INFO', 'info', 'Server: es-fps-optimization');
            this.addConsoleLog('INFO', 'info', `Players: ${Math.floor(Math.random() * 50) + 10}/64`);
            this.addConsoleLog('INFO', 'info', `Uptime: ${Math.floor(Math.random() * 24)}h ${Math.floor(Math.random() * 60)}m`);
            break;
            
          case 'players':
            this.addConsoleLog('INFO', 'info', '=== Online Players ===');
            for(let i = 1; i <= 5; i++) {
              this.addConsoleLog('INFO', 'info', `[${i}] Player${i} (ID: ${i})`);
            }
            break;
            
          case 'resources':
            this.addConsoleLog('INFO', 'info', '=== Loaded Resources ===');
            ['es-fps', 'es-extended', 'chat', 'spawnmanager', 'sessionmanager'].forEach(res => {
              this.addConsoleLog('SUCCESS', 'success', `[+] ${res} - Running`);
            });
            break;
            
          case 'performance':
            this.addConsoleLog('INFO', 'info', '=== Performance Stats ===');
            this.addConsoleLog('INFO', 'info', `FPS: ${this.currentFps}`);
            this.addConsoleLog('INFO', 'info', `CPU: ${this.cpuUsage}%`);
            this.addConsoleLog('INFO', 'info', `GPU: ${this.gpuUsage}%`);
            this.addConsoleLog('INFO', 'info', `RAM: ${this.ramUsage}%`);
            break;
            

            
          case 'errors':
            this.addConsoleLog('WARNING', 'warning', 'Checking for errors...');
            setTimeout(() => {
              if (Math.random() > 0.5) {
                this.addConsoleLog('SUCCESS', 'success', 'No errors found');
              } else {
                this.addConsoleLog('ERROR', 'error', 'Script error in resource "example"');
                this.addConsoleLog('ERROR', 'error', 'Line 42: undefined variable "test"');
              }
            }, 500);
            break;
            
          case 'clear':
            this.clearConsole();
            return;
            
          case 'help':
            this.addConsoleLog('INFO', 'info', '=== Available Commands ===');
            ['status', 'players', 'resources', 'performance', 'errors', 'clear', 'help'].forEach(cmd => {
              this.addConsoleLog('INFO', 'info', `- ${cmd}`);
            });
            break;
            
          default:
            this.addConsoleLog('ERROR', 'error', `Unknown command: ${command}`);
            this.addConsoleLog('INFO', 'info', 'Type "help" for available commands');
        }
      }, 100);

      // Send to FiveM if available
      if (typeof fetch !== 'undefined') {
        fetch(`https://${GetParentResourceName()}/executeCommand`, {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ command: command })
        }).catch(() => {});
      }
    },

    executeQuickCommand(command) {
      this.commandInput = command;
      this.executeCommand();
    },

    addConsoleLog(level, type, message) {
      this.consoleLogs.push({
        timestamp: new Date().toLocaleTimeString(),
        level: level,
        type: type,
        message: message
      });

      // Keep only last 100 logs
      if (this.consoleLogs.length > 100) {
        this.consoleLogs.shift();
      }

      // Auto scroll to bottom
      this.$nextTick(() => {
        const output = this.$refs.consoleOutput;
        if (output) {
          output.scrollTop = output.scrollHeight;
        }
      });
    },

    clearConsole() {
      this.consoleLogs = [{
        timestamp: new Date().toLocaleTimeString(),
        level: 'INFO',
        type: 'info',
        message: 'Console cleared'
      }];
    },

    copyConsole() {
      const text = this.consoleLogs.map(log => 
        `[${log.timestamp}] ${log.level}: ${log.message}`
      ).join('\n');
      
      if (navigator.clipboard) {
        navigator.clipboard.writeText(text).then(() => {
          this.addConsoleLog('SUCCESS', 'success', 'Console logs copied to clipboard');
        }).catch(() => {
          this.addConsoleLog('ERROR', 'error', 'Failed to copy to clipboard');
        });
      } else {
        // Fallback for older browsers
        const textArea = document.createElement('textarea');
        textArea.value = text;
        document.body.appendChild(textArea);
        textArea.select();
        document.execCommand('copy');
        document.body.removeChild(textArea);
        this.addConsoleLog('SUCCESS', 'success', 'Console logs copied to clipboard');
      }
    },

    exportLogs() {
      const text = this.consoleLogs.map(log => 
        `[${log.timestamp}] ${log.level}: ${log.message}`
      ).join('\n');
      
      const blob = new Blob([text], { type: 'text/plain' });
      const url = window.URL.createObjectURL(blob);
      const a = document.createElement('a');
      a.href = url;
      a.download = `fivem-console-${new Date().toISOString().slice(0, 10)}.txt`;
      document.body.appendChild(a);
      a.click();
      document.body.removeChild(a);
      window.URL.revokeObjectURL(url);
      
      this.addConsoleLog('SUCCESS', 'success', 'Console logs exported successfully');
    },

    previousCommand() {
      if (this.commandHistory.length === 0) return;
      
      this.commandHistoryIndex++;
      if (this.commandHistoryIndex >= this.commandHistory.length) {
        this.commandHistoryIndex = this.commandHistory.length - 1;
      }
      
      this.commandInput = this.commandHistory[this.commandHistoryIndex];
    },

    nextCommand() {
      if (this.commandHistory.length === 0) return;
      
      this.commandHistoryIndex--;
      if (this.commandHistoryIndex < -1) {
        this.commandHistoryIndex = -1;
      }
      
      if (this.commandHistoryIndex === -1) {
        this.commandInput = '';
      } else {
        this.commandInput = this.commandHistory[this.commandHistoryIndex];
      }
    },

    // Resources Monitor Methods
    refreshResources() {
      // Gerçek zamanlı resource verilerini güncelle
      if (typeof fetch !== 'undefined') {
        fetch(`https://${GetParentResourceName()}/getResources`, {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({})
        })
        .then(response => response.json())
        .then(data => {
          if (data.resources) {
            this.resources = data.resources;
          }
        })
        .catch(() => {
          // Simüle edilmiş resource güncelleme
          this.resources.forEach(resource => {
            if (resource.status === 'started') {
              resource.resmon = Math.random() * 20;
              resource.memory = Math.random() * 50 + 5;
            }
          });
        });
      } else {
        // Test için simüle edilmiş güncelleme
        this.resources.forEach(resource => {
          if (resource.status === 'started') {
            resource.resmon = Math.random() * 20;
            resource.memory = Math.random() * 50 + 5;
          }
        });
      }
      
      this.addConsoleLog('SUCCESS', 'success', 'Resource data refreshed');
    },

    sortResourcesBy(type) {
      this.resourceSortBy = type;
    },

    getResmonClass(resmon) {
      if (resmon < 5) return 'low';
      if (resmon < 15) return 'medium';
      return 'high';
    },

    getResmonPercentage(resmon) {
      // 20ms'yi %100 kabul ediyoruz
      return Math.min((resmon / 20) * 100, 100);
    },

    restartResource(resourceName) {
      const resource = this.resources.find(r => r.name === resourceName);
      if (resource && resource.status === 'started') {
        resource.status = 'starting';
        
        this.addConsoleLog('WARNING', 'warning', `Restarting resource: ${resourceName}`);
        
        // Lua'ya restart komutu gönder
        if (typeof fetch !== 'undefined') {
          fetch(`https://${GetParentResourceName()}/restartResource`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ resource: resourceName })
          });
        }
        
        // Simüle edilmiş restart
        setTimeout(() => {
          resource.status = 'started';
          resource.resmon = Math.random() * 10 + 1;
          this.addConsoleLog('SUCCESS', 'success', `Resource restarted: ${resourceName}`);
        }, 2000);
      }
    },

    stopResource(resourceName) {
      const resource = this.resources.find(r => r.name === resourceName);
      if (resource && resource.status === 'started') {
        resource.status = 'stopped';
        resource.resmon = 0;
        resource.memory = 0;
        
        this.addConsoleLog('WARNING', 'warning', `Resource stopped: ${resourceName}`);
        
        // Lua'ya stop komutu gönder
        if (typeof fetch !== 'undefined') {
          fetch(`https://${GetParentResourceName()}/stopResource`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ resource: resourceName })
          });
        }
      }
    },

    startResource(resourceName) {
      const resource = this.resources.find(r => r.name === resourceName);
      if (resource && resource.status === 'stopped') {
        resource.status = 'starting';
        
        this.addConsoleLog('INFO', 'info', `Starting resource: ${resourceName}`);
        
        // Lua'ya start komutu gönder
        if (typeof fetch !== 'undefined') {
          fetch(`https://${GetParentResourceName()}/startResource`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ resource: resourceName })
          });
        }
        
        // Simüle edilmiş start
        setTimeout(() => {
          resource.status = 'started';
          resource.resmon = Math.random() * 10 + 1;
          resource.memory = Math.random() * 30 + 5;
          this.addConsoleLog('SUCCESS', 'success', `Resource started: ${resourceName}`);
        }, 1500);
      }
    },

    // Resource Icon Methods
    getResourceIcon(resourceName) {
      const iconMap = {
        'chat': 'fas fa-comments',
        'es-extended': 'fas fa-cogs',
        'es-fps': 'fas fa-tachometer-alt',
        'spawnmanager': 'fas fa-user-plus',
        'sessionmanager': 'fas fa-user-clock',
        'mapmanager': 'fas fa-map',
        'mysql-async': 'fas fa-database',
        'hardcap': 'fas fa-shield-alt',
        'rconlog': 'fas fa-terminal',
        'playernames': 'fas fa-id-card',
        'baseevents': 'fas fa-broadcast-tower',
        'webpack': 'fas fa-cube',
        'yarn': 'fas fa-package-open',
        'monitor': 'fas fa-desktop',
        'fivem': 'fas fa-gamepad',
        'fivem-map-skater': 'fas fa-map-marked-alt',
        'fivem-map-hipster': 'fas fa-map-pin',
        'loadingscreen': 'fas fa-spinner',
        'scoreboard': 'fas fa-list-ol',
        'example': 'fas fa-file-code',
        'default': 'fas fa-puzzle-piece'
      };

      // Check for specific keywords in resource name
      const name = resourceName.toLowerCase();
      
      if (name.includes('chat') || name.includes('message')) return 'fas fa-comments';
      if (name.includes('car') || name.includes('vehicle') || name.includes('garage')) return 'fas fa-car';
      if (name.includes('job') || name.includes('work')) return 'fas fa-briefcase';
      if (name.includes('bank') || name.includes('money') || name.includes('economy')) return 'fas fa-dollar-sign';
      if (name.includes('house') || name.includes('property') || name.includes('real')) return 'fas fa-home';
      if (name.includes('weapon') || name.includes('gun') || name.includes('shop')) return 'fas fa-shopping-cart';
      if (name.includes('police') || name.includes('cop') || name.includes('law')) return 'fas fa-shield-alt';
      if (name.includes('medical') || name.includes('hospital') || name.includes('ambulance')) return 'fas fa-ambulance';
      if (name.includes('admin') || name.includes('staff')) return 'fas fa-user-shield';
      if (name.includes('menu') || name.includes('ui')) return 'fas fa-bars';
      if (name.includes('hud') || name.includes('interface')) return 'fas fa-desktop';
      if (name.includes('map') || name.includes('location')) return 'fas fa-map';
      if (name.includes('spawn') || name.includes('character')) return 'fas fa-user-plus';
      if (name.includes('inventory') || name.includes('item')) return 'fas fa-boxes';
      if (name.includes('phone') || name.includes('mobile')) return 'fas fa-mobile-alt';
      if (name.includes('radio') || name.includes('voice')) return 'fas fa-microphone';
      if (name.includes('weather') || name.includes('time')) return 'fas fa-cloud-sun';
      if (name.includes('fuel') || name.includes('gas')) return 'fas fa-gas-pump';
      if (name.includes('clothing') || name.includes('outfit')) return 'fas fa-tshirt';
      if (name.includes('tattoo') || name.includes('barber')) return 'fas fa-cut';
      if (name.includes('discord') || name.includes('log')) return 'fab fa-discord';
      if (name.includes('mysql') || name.includes('database') || name.includes('sql')) return 'fas fa-database';
      if (name.includes('loading') || name.includes('screen')) return 'fas fa-spinner';
      if (name.includes('anti') || name.includes('cheat') || name.includes('security')) return 'fas fa-user-secret';
      
      return iconMap[name] || iconMap.default;
    },

    // Weather & Time Control Methods
    setWeather(weatherType) {
      this.currentWeather = weatherType;
      this.addConsoleLog('INFO', 'info', `Weather changed to: ${weatherType}`);
      
      // FiveM'e weather değişikliği gönder
      if (typeof fetch !== 'undefined') {
        fetch(`https://${GetParentResourceName()}/setWeather`, {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ weather: weatherType })
        });
      }
    },

    setTimeOfDay(timeOfDay) {
      const times = {
        morning: { hour: 8, minute: 0 },
        noon: { hour: 12, minute: 0 },
        evening: { hour: 18, minute: 0 },
        night: { hour: 0, minute: 0 }
      };
      
      const time = times[timeOfDay];
      this.customHour = time.hour;
      this.currentTime = `${time.hour.toString().padStart(2, '0')}:${time.minute.toString().padStart(2, '0')}`;
      
      this.addConsoleLog('INFO', 'info', `Time set to: ${this.currentTime} (${timeOfDay})`);
      
      // FiveM'e time değişikliği gönder
      if (typeof fetch !== 'undefined') {
        fetch(`https://${GetParentResourceName()}/setTime`, {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ hour: time.hour, minute: time.minute })
        });
      }
    },

    setCustomTime() {
      this.currentTime = `${this.customHour.toString().padStart(2, '0')}:00`;
      this.addConsoleLog('INFO', 'info', `Custom time set to: ${this.currentTime}`);
      
      // FiveM'e custom time gönder
      if (typeof fetch !== 'undefined') {
        fetch(`https://${GetParentResourceName()}/setTime`, {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
                     body: JSON.stringify({ hour: parseInt(this.customHour), minute: 0 })
         });
       }
     },

     // Additional Controls Methods
     setTrafficDensity() {
       this.addConsoleLog('INFO', 'info', `Traffic density set to: ${this.trafficDensity}%`);
       
       if (typeof fetch !== 'undefined') {
         fetch(`https://${GetParentResourceName()}/setTrafficDensity`, {
           method: 'POST',
           headers: { 'Content-Type': 'application/json' },
           body: JSON.stringify({ density: this.trafficDensity / 100 })
         });
       }
     },

     setPedDensity() {
       this.addConsoleLog('INFO', 'info', `Pedestrian density set to: ${this.pedDensity}%`);
       
       if (typeof fetch !== 'undefined') {
         fetch(`https://${GetParentResourceName()}/setPedDensity`, {
           method: 'POST',
           headers: { 'Content-Type': 'application/json' },
           body: JSON.stringify({ density: this.pedDensity / 100 })
         });
       }
     },

     setWindSpeed() {
       this.addConsoleLog('INFO', 'info', `Wind speed set to: ${this.windSpeed}%`);
       
       if (typeof fetch !== 'undefined') {
         fetch(`https://${GetParentResourceName()}/setWindSpeed`, {
           method: 'POST',
           headers: { 'Content-Type': 'application/json' },
           body: JSON.stringify({ speed: this.windSpeed / 100 })
         });
       }
     },

     toggleMotionBlur() {
       this.motionBlurEnabled = !this.motionBlurEnabled;
       this.addConsoleLog('INFO', 'info', `Motion blur ${this.motionBlurEnabled ? 'enabled' : 'disabled'}`);
       
       if (typeof fetch !== 'undefined') {
         fetch(`https://${GetParentResourceName()}/toggleMotionBlur`, {
           method: 'POST',
           headers: { 'Content-Type': 'application/json' },
           body: JSON.stringify({ enabled: this.motionBlurEnabled })
         });
       }
     },

     toggleDepthOfField() {
       this.depthOfFieldEnabled = !this.depthOfFieldEnabled;
       this.addConsoleLog('INFO', 'info', `Depth of field ${this.depthOfFieldEnabled ? 'enabled' : 'disabled'}`);
       
       if (typeof fetch !== 'undefined') {
         fetch(`https://${GetParentResourceName()}/toggleDepthOfField`, {
           method: 'POST',
           headers: { 'Content-Type': 'application/json' },
           body: JSON.stringify({ enabled: this.depthOfFieldEnabled })
         });
       }
     },

     toggleScreenEffects() {
       this.screenEffectsEnabled = !this.screenEffectsEnabled;
       this.addConsoleLog('INFO', 'info', `Screen effects ${this.screenEffectsEnabled ? 'enabled' : 'disabled'}`);
       
       if (typeof fetch !== 'undefined') {
         fetch(`https://${GetParentResourceName()}/toggleScreenEffects`, {
           method: 'POST',
           headers: { 'Content-Type': 'application/json' },
           body: JSON.stringify({ enabled: this.screenEffectsEnabled })
         });
       }
     }
  },

  mounted() {
    
    // FPS verilerini güncelle
    setInterval(() => {
      this.currentFps = Math.floor(Math.random() * 20) + 50;
      this.cpuUsage = Math.floor(Math.random() * 30) + 30;
      this.gpuUsage = Math.floor(Math.random() * 40) + 40;
      this.ramUsage = Math.floor(Math.random() * 25) + 25;
    }, 2000);

    // Modern FiveM Message Listener
    if (typeof window !== 'undefined') {
      window.addEventListener('message', (event) => {
        const data = event.data;
        
        // Menu açma/kapama komutları
        if (data.type === 'openMenu') {
          this.openMenu();
          
        } else if (data.type === 'closeMenu') {
          this.closeMenu();
          
        } else if (data.type === 'toggleMenu') {
          this.toggleMenu();
          
        // Console logları
        } else if (data.type === 'consoleLog') {
          this.addConsoleLog(data.level, data.logType, data.message);
          
        } else if (data.type === 'commandResponse') {
          this.addConsoleLog(data.level, data.logType, data.message);
          
        // Performans verileri - Gerçek sistem bilgileri
        } else if (data.type === 'updatePerformance') {
          if (data.fps) this.currentFps = data.fps;
          if (data.cpu) this.cpuUsage = data.cpu;
          if (data.gpu) this.gpuUsage = data.gpu;
          if (data.ram) this.ramUsage = data.ram;
          
          // Detaylı metrikleri güncelle
          if (data.frameTime) this.frameTime = data.frameTime;
          
          // Memory usage hesapla (basit tahmin)
          this.memoryUsage = Math.floor((this.ramUsage / 100) * 8192); // 8GB RAM varsayımı
          
          // Performance history güncelle
          this.performanceHistory.push({
            timestamp: Date.now(),
            fps: data.fps,
            cpu: data.cpu,
            gpu: data.gpu,
            ram: data.ram
          });
          
          // Son 20 kayıt tut
          if (this.performanceHistory.length > 20) {
            this.performanceHistory.shift();
          }
        }
             });
     }

    // FiveM benzeri console akışı için simüle edilmiş loglar (geliştirme amaçlı)
    let logCounter = 0;
    setInterval(() => {
      if (this.activeTab === 'cmd' && Math.random() > 0.8) {
        const fivemLogs = [
          { level: 'INFO', type: 'info', message: `[es-fps] Player ${Math.floor(Math.random() * 64) + 1} connected` },
          { level: 'INFO', type: 'info', message: '[es-extended] Database query executed successfully' },
          { level: 'WARNING', type: 'warning', message: '[es-fps] High resource usage detected' },
          { level: 'SUCCESS', type: 'success', message: '[spawnmanager] Player spawned successfully' },
          { level: 'INFO', type: 'info', message: `[chat] Message sent by Player${Math.floor(Math.random() * 20) + 1}` },
          { level: 'ERROR', type: 'error', message: '[script] Attempt to call nil value (field \'GetPlayerPed\')' },
          { level: 'INFO', type: 'info', message: '[sessionmanager] Session data saved' }
        ];
        
        const randomLog = fivemLogs[Math.floor(Math.random() * fivemLogs.length)];
        this.addConsoleLog(randomLog.level, randomLog.type, randomLog.message);
        logCounter++;
      }
    }, 2000);

    // FiveM'den gerçek performans verilerini ve oyuncu bilgilerini al
    if (typeof fetch !== 'undefined') {
      setInterval(() => {
        fetch(`https://${GetParentResourceName()}/getPerformanceData`, {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({})
        })
        .then(response => response.json())
        .then(data => {
          if (data.fps) this.currentFps = data.fps;
          if (data.cpu) this.cpuUsage = data.cpu;
          if (data.gpu) this.gpuUsage = data.gpu;
          if (data.ram) this.ramUsage = data.ram;
          
          // Oyuncu bilgilerini güncelle
          if (data.player) {
            this.playerProfile = { ...this.playerProfile, ...data.player };
          }
        })
        .catch(() => {
          // Hata durumunda simüle edilmiş veriler kullan
        });
      }, 1000);
    }
    
    // ESC tuşu için güvenli listener ekle
    document.addEventListener('keydown', (event) => {
      if ((event.key === 'Escape' || event.keyCode === 27) && this.ui) {
        this.handleEscKey(event);
      }
    });
    
    // Window level ESC listener (backup)
    window.addEventListener('keyup', (event) => {
      if ((event.key === 'Escape' || event.keyCode === 27) && this.ui) {
        this.handleEscKey(event);
      }
    });
  }
});