-- Export bridge object for other resources
exports("GetBridgeObject", function()
  return WSB
end)

-- Get bridge version from resource metadata (with dots removed)
function WSB.getVersion()
  local version = GetResourceMetadata(GetCurrentResourceName(), "version", 0)
  version = version:gsub("%.", "")
  return version
end

-- Trim whitespace from start and end of string
function WSB.trim(text)
  if text then
      return string.gsub(text, "^%s*(.-)%s*$", "%1")
  else
      return nil
  end
end

-- Convert shop data based on inventory system
function ConvertShopData(shopData, inventorySystem)
  if not inventorySystem then
      inventorySystem = WSB.inventorySystem
  end
  
  -- Handle codem-inventory format (simple array)
  if inventorySystem == "codem-inventory" then
      local items = {}
      for _, item in ipairs(shopData.inventory) do
          items[#items + 1] = {
              name = item.name,
              price = item.price
          }
      end
      return items
  end
  
  -- Handle other inventory systems (complex format)
  local slotCounter = 0
  local shopStructure = {
      label = shopData.name,
      items = {}
  }
  
  for _, item in ipairs(shopData.inventory) do
      shopStructure.items[#shopStructure.items + 1] = {
          name = item.name,
          price = item.price,
          slot = slotCounter + 1,
          amount = 500,
          info = {}
      }
      slotCounter = slotCounter + 1
  end
  
  return shopStructure
end

-- Register debug print event
RegisterNetEvent("wasabi_bridge:debugPrint", print)