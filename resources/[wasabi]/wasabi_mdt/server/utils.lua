-- Send formatted embed to Discord webhook
function ToDiscord(title, fields, color)
  if not color then
    color = 10027059
  end
  
  local embeds = {}
  local embed = {}
  embed.color = color
  embed.title = "**" .. title .. "**"
  embed.timestamp = os.date("!%Y-%m-%dT%H:%M:%S")
  embed.fields = fields
  embed.footer = {
    text = "© " .. GetCurrentResourceName() .. " - wasabiscripts.com"
  }
  
  embeds[1] = embed
  
  local payload = {
    username = GetCurrentResourceName(),
    embeds = embeds
  }
  
  PerformHttpRequest(
    Config.DiscordWebhook,
    function(statusCode, response, headers) end,
    "POST",
    json.encode(payload),
    {["Content-Type"] = "application/json"}
  )
end

-- Count elements in a table
function table.count(tbl)
  local count = 0
  for _ in pairs(tbl) do
    count = count + 1
  end
  return count
end

-- Check if table contains a value
function table.contains(tbl, value)
  for _, v in pairs(tbl) do
    if v == value then
      return true
    end
  end
  return false
end