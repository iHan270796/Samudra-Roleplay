-- Get the slot number of an item in player's inventory
function GetItemSlot(source, itemName)
  local player = WSB.getPlayer(source)
  
  if not player then
      return false
  end
  
  local item = nil
  
  -- QBCore framework
  if player.Functions and player.Functions.GetItemByName then
      item = player.Functions.GetItemByName(itemName)
  -- ESX framework
  elseif player.getInventoryItem then
      item = player.getInventoryItem(itemName)
  end
  
  if item and item.slot then
      return item.slot
  end
  
  return false
end

-- Get all slot numbers where an item exists in inventory
function GetSlotsByItem(inventory, itemName)
  local slots = {}
  
  if not inventory then
      return slots
  end
  
  for slotKey, itemData in pairs(inventory) do
      if itemData.name:lower() == itemName:lower() then
          local slotNumber = tonumber(itemData.slot) or tonumber(slotKey)
          slots[#slots + 1] = slotNumber
      end
  end
  
  return slots
end