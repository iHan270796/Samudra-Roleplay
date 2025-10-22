-- Generate a unique identifier for a target
function GenerateTargetIdentifier(targetType, targetName, customIdentifier)
  -- Initialize targetType table if it doesn't exist
  if not ActiveTargets[targetType] then
      ActiveTargets[targetType] = {}
  end
  
  -- Initialize targetName table if it doesn't exist
  if not ActiveTargets[targetType][targetName] then
      ActiveTargets[targetType][targetName] = {}
  end
  
  -- If a custom identifier is provided, use it
  if customIdentifier then
      return customIdentifier
  end
  
  -- Check if any targets exist for this targetName
  local hasExistingTargets = next(ActiveTargets[targetType][targetName])
  
  if not hasExistingTargets then
      -- First target: return "targetName_1"
      return targetName .. "_1"
  else
      -- Multiple targets: return "targetName_N" where N is count + 1
      local targetCount = #ActiveTargets[targetType][targetName]
      return targetName .. "_" .. (targetCount + 1)
  end
end

-- Save target options to the ActiveTargets table
function SaveTargetOptions(targetType, targetName, identifier, options, data)
  -- Initialize targetType table if it doesn't exist
  if not ActiveTargets[targetType] then
      ActiveTargets[targetType] = {}
  end
  
  -- Initialize targetName table if it doesn't exist
  if not ActiveTargets[targetType][targetName] then
      ActiveTargets[targetType][targetName] = {}
  end
  
  -- Add new target entry
  local targetIndex = #ActiveTargets[targetType][targetName] + 1
  ActiveTargets[targetType][targetName][targetIndex] = {
      identifier = identifier,
      options = options
  }
  
  -- Special handling for model targets with model data
  if targetType == "model" and data and data.models then
      ActiveTargets[targetType][targetName][targetIndex].model = data.models
  end
end

-- Remove a target from ActiveTargets by its identifier
function RemoveActiveTarget(targetType, targetName, identifier)
  -- Check if targetType exists
  if not ActiveTargets[targetType] then
      return
  end
  
  -- Check if targetName exists
  if not ActiveTargets[targetType][targetName] then
      return
  end
  
  -- Find and remove the target with matching identifier
  for index = 1, #ActiveTargets[targetType][targetName], 1 do
      local target = ActiveTargets[targetType][targetName][index]
      if target.identifier == identifier then
          table.remove(ActiveTargets[targetType][targetName], index)
          break
      end
  end
end

-- Convert shop data based on inventory system
function ConvertShopData(shopData, inventorySystem)
  -- Use WSB inventory system if not specified
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

-- Format menu data for ox_lib menu system
function FormatDataForOxLibMenu(menuData)
  local formattedOptions = {}
  
  for optionIndex = 1, #menuData.options, 1 do
      local option = menuData.options[optionIndex]
      
      formattedOptions[#formattedOptions + 1] = {
          icon = option.icon or false,
          label = option.title,
          description = option.description or false,
          args = {
              event = option.event,
              args = option.args or false
          }
      }
  end
  
  return formattedOptions
end