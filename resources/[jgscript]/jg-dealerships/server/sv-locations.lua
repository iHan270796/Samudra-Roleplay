lib.callback.register("jg-dealerships:server:get-locations-data", function(source)
  local identifier = Framework.Server.GetPlayerIdentifier(source)
  local dealershipData = MySQL.query.await("SELECT d.*, e.identifier, e.role FROM dealership_data d LEFT JOIN dealership_employees e ON d.name = e.dealership AND e.identifier = ?", {identifier})
  local locations = {}
  if identifier then
    DebugPrint("Getting dealership data for player " .. identifier, "debug")
  end
  for _, dealership in pairs(dealershipData) do
    local config = Config.DealershipLocations[dealership.name]
    local dealershipType = "-"
    local isActive = false
    if config then
      dealershipType = config.type
      isActive = true
    end
    if dealership.label == "" then
      dealership.label = dealership.name
    end
    locations[#locations + 1] = {
      name = dealership.name,
      type = dealershipType,
      label = dealership.label,
      balance = dealership.balance,
      active = isActive,
      managementAccess = dealership.owner_id == identifier,
      config = config
    }
  end
  return locations
end)
