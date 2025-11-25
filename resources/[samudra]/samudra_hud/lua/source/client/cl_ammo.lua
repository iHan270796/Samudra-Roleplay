local isHudVisible = false
local lastAmmoData = {}

function UpdateAmmo(data)
    SendNUIMessage({
        action = "UpdateAmmo",
        data = data
    })
end

function CheckAmmoType(weapon)
    for i = 1, #Config.AmmoTypes do
        if weapon == GetHashKey(Config.AmmoTypes[i].name) then
            return Config.AmmoTypes[i].ammoType
        end
    end
    return 1
end

local function isMeleeWeapon(weaponName)

    for _, melee in ipairs(Config.MeleeWeapons) do
        if weaponName == melee then
            return true
        end
    end
    return false
end


function GetAmmoData()
    local ped = PlayerPedId()
    if not DoesEntityExist(ped) then return end

    local _, weapon = GetCurrentPedWeapon(ped, true)
    if weapon and weapon ~= `WEAPON_UNARMED` then
        if isMeleeWeapon(weapon) then return end

        local totalAmmo = GetAmmoInPedWeapon(ped, weapon) or 0
        local isReloading = IsPedReloading(ped)

        local inClip = 0
        if not isReloading then
            local success, clipAmmo = GetAmmoInClip(ped, weapon)
            if success then inClip = clipAmmo end
        end

        local available = math.max(0, totalAmmo - inClip)
        local ammoType = CheckAmmoType(weapon)

        -- print("Weapon:", weapon)
        -- print("Total Ammo:", totalAmmo)
        -- print("In Clip:", inClip)
        -- print("Available:", available)
        -- print("Is Reloading:", isReloading)

        return {
            event = "ammoUpdate",
            showing = true,
            ammo = {
                inClip = isReloading and 0 or inClip,
                available = available,
                type = ammoType,
                isReloading = isReloading
            }
        }
    end

    return { event = "ammoUpdate", showing = false }
end


function CheckAmmoUpdates()
    local newAmmoData = GetAmmoData()
    if newAmmoData and newAmmoData.showing ~= isHudVisible or not lastAmmoData or json.encode(newAmmoData) ~= json.encode(lastAmmoData) then
        UpdateAmmo(newAmmoData)
        isHudVisible = newAmmoData.showing
        lastAmmoData = newAmmoData
    end
end

CreateThread(function()
    while true do
        Wait(200)
        CheckAmmoUpdates()
    end
end)

CreateThread(function()
    while Config.HudSettings.WeaponUI.HideDefaultGTAUI do
        Wait(0)
        local ped = PlayerPedId()
        local weapon = GetSelectedPedWeapon(ped)
        if weapon and weapon ~= `WEAPON_UNARMED` and not isMeleeWeapon(weapon) then
            HideHudComponentThisFrame(2)
            HideHudComponentThisFrame(20)
        end

    end
end)