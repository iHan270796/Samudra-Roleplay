local warned = {
    hunger20 = false,
    hunger10 = false,
    thirst20 = false,
    thirst10 = false
}

local function showWarning(text, color)
    SendNUIMessage({
        action = "showWarning",
        text = text,
        color = color
    })
end

CreateThread(function()
    while true do
        Wait(5000)

        local playerData = exports.qbx_core:GetPlayerData()
        if not playerData or not playerData.metadata then goto continue end

        local hunger = playerData.metadata.hunger
        local thirst = playerData.metadata.thirst

        -- skip kalau belum ada data valid
        if hunger == nil or thirst == nil then goto continue end

        -- Hunger warnings
        if hunger <= 20 and not warned.hunger20 then
            showWarning("Kamu sedang kelaparan!", "red")
            warned.hunger20 = true
        end
        if hunger <= 10 and not warned.hunger10 then
            showWarning("Kamu sangat lapar, segera makan!", "red")
            warned.hunger10 = true
        end
        if hunger > 20 then
            warned.hunger20 = false
            warned.hunger10 = false
        end

        -- Thirst warnings
        if thirst <= 20 and not warned.thirst20 then
            showWarning("Kamu sangat haus!", "blue")
            warned.thirst20 = true
        end
        if thirst <= 10 and not warned.thirst10 then
            showWarning("Tubuhmu dehidrasi, segera minum!", "blue")
            warned.thirst10 = true
        end
        if thirst > 20 then
            warned.thirst20 = false
            warned.thirst10 = false
        end

        ::continue::
    end
end)