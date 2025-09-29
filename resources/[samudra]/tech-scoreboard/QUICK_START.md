# 🚀 Quick Start Guide

## 5-Minute Setup

### 1. Install Resource
```bash
# Download and place in resources folder
# Add to server.cfg
ensure scoreboard
```

### 2. Basic Configuration
```lua
-- config.lua
Config.ServerInfo = {
    name = 'Your Server Name',
    description = 'Your Server Description'
}
```

### 3. Discord Setup (Optional)
```cfg
# server.cfg
set scoreboard_discord_token "YOUR_BOT_TOKEN"
set scoreboard_discord_guild "YOUR_SERVER_ID"
set scoreboard_discord_roles "ROLE_ID:Role Name:#COLOR"
```

### 4. Test
- Start server
- Open scoreboard with F1
- Check console for framework detection

## ✅ Done!

Your scoreboard is now working with automatic framework detection!

---

## 🔧 Advanced Setup

### Discord Bot Creation
1. Go to [Discord Developer Portal](https://discord.com/developers/applications)
2. Create new application
3. Go to Bot section → Create bot
4. Copy token
5. Invite bot with permissions:
   - Read Messages
   - View Server Members

### Get Discord IDs
1. Enable Developer Mode in Discord
2. Right-click server → Copy Server ID
3. Right-click role → Copy Role ID

### Role Color Examples
- `#FF0000` - Red (Owner)
- `#FF6B00` - Orange (Admin)
- `#FFD700` - Gold (VIP)
- `#00FF00` - Green (Member)

## 🆘 Need Help?

- Enable debug: `Config.Debug = true`
- Check console for errors
- Use commands: `reloaddiscordroles`, `refreshdiscordcache` (console only)
