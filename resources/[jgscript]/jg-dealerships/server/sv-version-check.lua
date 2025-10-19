local resourceName = "jg-dealerships"
local versionUrl = "https://raw.githubusercontent.com/jgscripts/versions/main/" .. resourceName .. ".txt"

local function isUpdateAvailable(currentVersion, latestVersion)
  local current = {}
  for part in string.gmatch(currentVersion, "[^.]+") do
    table.insert(current, tonumber(part))
  end
  local latest = {}
  for part in string.gmatch(latestVersion, "[^.]+") do
    table.insert(latest, tonumber(part))
  end
  for i = 1, math.max(#current, #latest), 1 do
    local currentPart = current[i] or 0
    local latestPart = latest[i] or 0
    if currentPart < latestPart then
      return true
    end
  end
  return false
end

PerformHttpRequest(versionUrl, function(statusCode, responseData, headers)
  if statusCode ~= 200 then
    return print("^1Unable to perform update check")
  end
  local currentVersion = GetResourceMetadata(GetCurrentResourceName(), "version", 0)
  if not currentVersion then
    return
  end
  if currentVersion == "dev" then
    return print("^3Using dev version")
  end
  local latestVersion = responseData:match("^[^\n]+")
  if not latestVersion then
    return
  end
  if isUpdateAvailable(currentVersion:sub(2), latestVersion:sub(2)) then
    print("^3Update available for " .. resourceName .. "! (current: ^1" .. currentVersion .. "^3, latest: ^2" .. latestVersion .. "^3)")
    print("^3Release notes: discord.gg/jgscripts")
  end
end, "GET")

local function checkArtifactVersion()
  local fxVersion = GetConvar("version", "unknown")
  local artifactVersion = string.match(fxVersion, "v%d+%.%d+%.%d+%.(%d+)")
  PerformHttpRequest("https://artifacts.jgscripts.com/check?artifact=" .. artifactVersion, function(statusCode, responseData, headers, errorData)
    if statusCode ~= 200 or errorData then
      return print("^1Could not check artifact version^0")
    end
    if not responseData then
      return
    end
    local data = json.decode(responseData)
    if data.status == "BROKEN" then
      print("^1WARNING: The current FXServer version you are using (artifacts version) has known issues. Please update to the latest stable artifacts: https://artifacts.jgscripts.com^0")
      print("^0Artifact version:^3", artifactVersion, "\n^0Known issues:^3", data.reason, "^0")
    end
  end, "GET")
end

CreateThread(function()
  checkArtifactVersion()
end)
