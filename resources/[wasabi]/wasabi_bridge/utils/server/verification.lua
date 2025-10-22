if not Config.CheckForUpdates then
  return
end

local expectedResourceName = "wasabi_bridge"
local displayName = "wasabi_bridge"
local currentVersion = GetResourceMetadata(GetCurrentResourceName(), "version")
local githubApiUrl = "https://api.github.com/repos/wasabi-versions/" .. expectedResourceName .. "/releases/latest"

-- Fetch latest version from GitHub API
function FetchLatestVersion()
  local latestVersion = false
  
  PerformHttpRequest(githubApiUrl, function(statusCode, response, headers)
      if statusCode == 200 then
          local data = json.decode(response)
          latestVersion = data.tag_name
      end
  end, "GET")
  
  repeat
      Wait(50)
  until latestVersion
  
  return latestVersion
end

-- Compare versions and print update warning if needed
function CheckVersion(errorCode, data, headers)
  local latestVersion = FetchLatestVersion()
  
  CreateThread(function()
      if currentVersion ~= latestVersion then
          Wait(4500)
          print("^0[^3WARNING^0] " .. displayName .. " is ^1NOT ^0up to date!")
          print("^0[^3WARNING^0] Your Version: ^1" .. currentVersion .. "^0")
          print("^0[^3WARNING^0] Latest Version: ^2" .. latestVersion .. "^0")
          print("^0[^3WARNING^0] ^1Get the latest version from keymaster!^0")
      end
  end)
end

-- Main update checker thread
CreateThread(function()
  local actualResourceName = GetCurrentResourceName()
  
  -- Check if resource folder name is correct
  if actualResourceName ~= expectedResourceName then
      displayName = expectedResourceName .. " (" .. actualResourceName .. ")"
      Wait(4500)
      print("^0[^3WARNING^0] Rename the folder to \"" .. expectedResourceName .. "\", otherwise this resource could experience problems!")
  end
  
  -- Infinite loop - check for updates every hour
  while true do
      PerformHttpRequest(githubApiUrl, CheckVersion, "GET")
      Wait(3600000)
  end
end)