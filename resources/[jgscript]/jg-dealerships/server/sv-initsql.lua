local function splitString(inputStr, delimiter)
  local result = {}
  for str in string.gmatch(inputStr, "([^" .. delimiter .. "]+)") do
    local trimmed = string.gsub(str, "^%s*(.-)%s*$", "%1")
    table.insert(result, trimmed)
  end
  return result
end

function InitSQL()
  if Config.AutoRunSQL then
    local success = pcall(function()
      local sqlFile = (Config.Framework == "QBCore" or Config.Framework == "Qbox") and "run-qb.sql" or "run-esx.sql"
      local file = assert(io.open(GetResourcePath(GetCurrentResourceName()) .. "/install/" .. sqlFile, "rb"))
      local content = file:read("*all")
      file:close()
      local queries = splitString(content, ";")
      MySQL.transaction.await(queries)
    end)
    if not success then
      print("^1[SQL ERROR] There was an error while automatically running the required SQL. Don't worry, you just need to run the SQL file for your framework, found in the 'install' folder manually. If you've already ran the SQL code previously, and this error is annoying you, set Config.AutoRunSQL = false^0")
    end
  end
end
