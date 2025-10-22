-- Get bridge version callback
WSB.registerCallback("wasabi_bridge:getVersion", function(source, callback)
  callback(WSB.getVersion())
end)

-- Get player identifier callback
WSB.registerCallback("wasabi_bridge:getIdentifier", function(source, callback, targetSource)
  if not targetSource then
      targetSource = source
  end
  
  callback(WSB.getIdentifier(targetSource))
end)

-- Check if player is boss/manager callback
WSB.registerCallback("wasabi_bridge:isPlayerBoss", function(source, callback)
  callback(WSB.isPlayerBoss(source))
end)