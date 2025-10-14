# Advanced Scoreboard System

A comprehensive, multi-framework scoreboard system for FiveM with advanced features including robbery availability tracking, player visibility controls, and customizable layouts.

## ✨ Features

### 🎯 Core Features
- **Multi-Framework Support**: Works with QBCore, ESX, and standalone servers
- **Real-time Updates**: Live player data with configurable refresh rates
- **Responsive Design**: Modern, mobile-friendly interface
- **Performance Optimized**: Cached data and efficient rendering

### 🚨 Robbery Availability System
- **Dynamic Police Requirements**: Configure minimum police needed for each robbery type
- **Real-time Status**: Shows available/unavailable robberies based on police presence
- **Visual Indicators**: Color-coded availability status
- **Customizable Types**: Add/remove robbery types as needed

### 👥 Player Visibility Controls
- **Hide Players**: Option to hide all players or specific jobs
- **Name Protection**: Hide player names (show as "Player #ID")
- **Offline Filtering**: Hide players with 0 ping
- **Job Filtering**: Show/hide specific jobs

### 🎨 Layout Options
- **Grid Layouts**: 2x2, 3x3, 4x4, or auto-fit
- **Player List Styles**: List, grid, or compact view
- **Size Options**: Small, medium, large, or fullscreen
- **Responsive Design**: Adapts to different screen sizes

### 🔐 Security Features
- **Rate Limiting**: Prevents spam requests
- **Input Validation**: XSS protection and data sanitization
- **SQL Injection Protection**: Parameterized queries
- **Access Control**: Configurable permissions

## 🚀 Installation

1. **Download** the resource to your `resources` folder
2. **Rename** the folder to `Scoreboard`
3. **Add** to your `server.cfg`:
   ```
   ensure Scoreboard
   ```
4. **Configure** the `config.lua` file
5. **Restart** your server

## ⚙️ Configuration

### Basic Settings
```lua
Config.Framework = 'auto' -- 'auto', 'qb-core', 'esx', 'standalone'
Config.MaxPlayers = 128
Config.RefreshTime = 5000 -- Refresh every 5 seconds
Config.Debug = false -- Enable debug output
Config.Keybind = 'F2' -- Key to open/close scoreboard
```

### Robbery Types
```lua
Config.RobberyTypes = {
    ['car'] = {
        label = 'Car Theft',
        icon = 'fas fa-car',
        color = '#FF6B6B',
        minPolice = 6 -- Minimum police required
    },
    ['bank'] = {
        label = 'Bank Heist',
        icon = 'fas fa-university',
        color = '#45B7D1',
        minPolice = 8
    }
    -- Add more robbery types...
}
```

### Player Visibility
```lua
Config.PlayerVisibility = {
    hidePlayers = false,
    hidePlayerNames = false,
    hideOfflinePlayers = true,
    showOnlyPolice = false,
    hideSpecificJobs = {'unemployed'},
    allowPlayerHideToggle = true, -- Allow players to hide their own info
    showHideButton = true -- Show/hide the "Hide My Info" button
}
```

### Layout Configuration
```lua
Config.Layout = {
    gridLayout = 'auto', -- 'auto', '2x2', '3x3', '4x4'
    playerListLayout = 'list', -- 'list', 'grid', 'compact'
    scoreboardSize = 'large', -- 'small', 'medium', 'large', 'fullscreen'
    responsive = true
}
```

### New Configuration Options (v2.1.0)

#### Configurable Keybind
```lua
Config.Keybind = 'F2' -- Change the scoreboard opening key
-- Examples:
Config.Keybind = 'TAB'   -- Use Tab key
Config.Keybind = 'F10'   -- Use F10 key
Config.Keybind = 'LSHIFT' -- Use Left Shift key
```

#### Hide Button Control
```lua
Config.PlayerVisibility = {
    -- ... other options ...
    showHideButton = false -- Hide the "Hide My Info" button completely
}
```

## 🎮 Usage

### Opening the Scoreboard
- **Default Key**: F2 (configurable via `Config.Keybind`)
- **Command**: `/scoreboard_toggle`
- **Available Keys**: F1-F12, TAB, ENTER, ESC, SPACE, SHIFT, CTRL, ALT, NUMPAD keys

### Features Available
- **Search Players**: Use the search bar to find specific players
- **View Job Statistics**: See active jobs and player counts
- **Check Robbery Availability**: Monitor which robberies are available
- **Player Information**: View player details, playtime, and ping

## 🔧 Discord Integration

### Setup
1. **Create** a Discord bot and get the token
2. **Add** the bot to your Discord server
3. **Configure** in `server.cfg`:
   ```
   set scoreboard_discord_token "YOUR_BOT_TOKEN"
   set scoreboard_discord_guild "YOUR_GUILD_ID"
   set scoreboard_discord_roles "ROLE_ID:ROLE_NAME:COLOR,ROLE_ID2:ROLE_NAME2:COLOR2"
   ```

### Features
- **Avatar Display**: Shows Discord avatars in player list
- **Role Integration**: Displays Discord roles as rank badges
- **Real-time Updates**: Cached Discord data for performance

## 📱 Responsive Design

The scoreboard automatically adapts to different screen sizes:
- **Desktop**: Full layout with all features
- **Tablet**: Optimized grid layout
- **Mobile**: Compact view with essential information

## 🛡️ Security

### Built-in Protections
- **Rate Limiting**: Prevents abuse of scoreboard requests
- **Input Validation**: Sanitizes all user inputs
- **XSS Protection**: Prevents malicious script injection
- **SQL Injection Protection**: Uses parameterized queries

### Best Practices
- Keep `Config.Debug = false` in production
- Regularly update the resource
- Monitor server logs for any issues

## 🔄 Framework Compatibility

### QBCore
- Full support for player data, jobs, and gangs
- Automatic detection when `qb-core` is present

### ESX
- Compatible with ESX and ESX Legacy
- Supports player data and job information

### Standalone
- Works without any framework
- Basic player information display

## 📊 Performance

### Optimizations
- **Cached Data**: Reduces database queries
- **Efficient Rendering**: Smooth animations and updates
- **Memory Management**: Automatic cleanup of unused data
- **Throttled Updates**: Prevents excessive server requests

### Recommended Settings
- **Refresh Time**: 5000ms (5 seconds) for optimal performance
- **Cache Time**: 300000ms (5 minutes) for Discord data
- **Max Players**: Set according to your server capacity

## 🐛 Troubleshooting

### Common Issues
1. **Players not showing**: Check framework detection and job configuration
2. **Robbery types not appearing**: Verify police count and robbery configuration
3. **Discord integration not working**: Check bot token and guild ID
4. **Performance issues**: Adjust refresh time and cache settings

### Debug Mode
Enable debug mode in `config.lua`:
```lua
Config.Debug = true
```
This will provide detailed logging for troubleshooting.

## 📝 Changelog

### Version 2.1.0 - Recent Updates
- **🎮 Configurable Keybind**: Added `Config.Keybind` option to change the scoreboard opening key
  - Default: F2
  - Supports all FiveM key names (F1-F12, TAB, ENTER, etc.)
  - Automatic fallback to F2 if invalid key is configured
- **👁️ Hide Button Control**: Added `Config.PlayerVisibility.showHideButton` option
  - Enable/disable the "Hide My Info" button in the header
  - Default: true (button visible)
  - Set to false to hide the button completely
- **🎯 Improved Button Positioning**: Moved "Hide My Info" button to header section
  - Now positioned next to player count and server time
  - Better integration with header layout
  - Compact styling for header placement
- **⚙️ Enhanced Configuration**: Updated configuration options with better documentation
  - Added comprehensive keybind documentation
  - Improved config comments and examples
  - Better validation and error handling

### Version 2.0.0
- Added robbery availability system
- Implemented player visibility controls
- Added layout configuration options
- Enhanced security features
- Improved performance and caching
- Added Discord integration
- Responsive design improvements

## 🤝 Support

For support and updates:
- Check the configuration examples
- Review the troubleshooting section
- Enable debug mode for detailed logging

## 📄 License

This resource is provided as-is for FiveM servers. Please respect the terms of use and do not redistribute without permission.

---

**Made with ❤️ for the FiveM community**