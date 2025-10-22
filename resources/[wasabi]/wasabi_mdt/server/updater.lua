if not Config.CheckForUpdates then
  return
end

if not wsb then
  return Error(_L("no_wsb", GetCurrentResourceName()))
end

local expectedResourceName = "wasabi_mdt"
local displayName = "wasabi_mdt"
local currentVersion = GetResourceMetadata(GetCurrentResourceName(), "version")
local githubApiUrl = "https://api.github.com/repos/wasabi-versions/" .. expectedResourceName .. "/releases/latest"
local requiredBridgeVersion = "1.5.6"

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

function CheckVersionAndWarn(statusCode, response, headers)
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

CreateThread(function()
  if GetCurrentResourceName() ~= displayName then
    displayName = displayName .. "(" .. GetCurrentResourceName() .. ")"
    Wait(4500)
    print("^0[^3WARNING^0] Rename the folder to \"" .. expectedResourceName .. "\", otherwise this resource could experience problems!")
  end
  
  local bridgeVersionString = wsb.getVersion()
  local bridgeVersionNumber = tonumber(bridgeVersionString:gsub("%.", ""))
  local requiredVersionNumber = tonumber(requiredBridgeVersion:gsub("%.", ""))
  
  if bridgeVersionNumber and bridgeVersionNumber < requiredVersionNumber then
    print("^0[^3WARNING^0] ^1" .. displayName .. " requires wasabi_bridge version: " .. requiredBridgeVersion .. " or higher!^0")
  end
  
  while true do
    PerformHttpRequest(githubApiUrl, CheckVersionAndWarn, "GET")
    Wait(3600000)
  end
end)