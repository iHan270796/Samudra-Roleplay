local Config = require 'c_asuransi'

local function hapus()
    TriggerClientEvent('c_asuransi:startCountdown', -1, 60)
    Wait(60000)
    TriggerClientEvent('c_asuransi:done', -1)
end

lib.cron.new('*/' .. Config.cooldown .. ' * * * *', function()
    hapus()
end)