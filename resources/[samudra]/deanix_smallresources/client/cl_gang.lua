local Config = require 'c_bossgang'

local QBCore = exports['qb-core']:GetCoreObject()
local PlayerGang = QBCore.Functions.GetPlayerData().gang
local shownGangMenu = false
local DynamicMenuItems = {}

-- UTIL
local function ShowMenu(id, menuItems)
    lib.registerContext({
        id = id,
        title = menuItems.title or '',
        options = menuItems.options or {}
    })
    lib.showContext(id)
end

local function AddGangMenuItem(data, id)
    local menuID = id or (#DynamicMenuItems + 1)
    DynamicMenuItems[menuID] = deepcopy(data)
    return menuID
end

exports('AddGangMenuItem', AddGangMenuItem)

local function RemoveGangMenuItem(id)
    DynamicMenuItems[id] = nil
end

exports('RemoveGangMenuItem', RemoveGangMenuItem)

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        Wait(200)
        PlayerGang = QBCore.Functions.GetPlayerData().gang
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerGang = QBCore.Functions.GetPlayerData().gang
end)

RegisterNetEvent('QBCore:Client:OnGangUpdate', function(InfoGang)
    PlayerGang = InfoGang
end)

RegisterNetEvent('qb-gangmenu:client:Warbobe', function()
    TriggerEvent('qb-clothing:client:openOutfitMenu')
end)

RegisterNetEvent('qb-gangmenu:client:OpenMenu', function()
    if not PlayerGang.name or not PlayerGang.isboss then return end

    local options = {
        {
            title = Lang:t('bodygang.manage'),
            description = Lang:t('bodygang.managed'),
            icon = 'fa-solid fa-list',
            event = 'qb-gangmenu:client:ManageGang',
        },
        {
            title = Lang:t('bodygang.hire'),
            description = Lang:t('bodygang.hired'),
            icon = 'fa-solid fa-hand-holding',
            event = 'qb-gangmenu:client:HireMembers',
        },
        {
            title = Lang:t('bodygang.storage'),
            description = Lang:t('bodygang.storaged'),
            icon = 'fa-solid fa-box-open',
            event = 'qb-gangmenu:client:openStash',
        },
        {
            title = Lang:t('bodygang.outfits'),
            description = Lang:t('bodygang.outfitsd'),
            icon = 'fa-solid fa-shirt',
            event = 'qb-gangmenu:client:Warbobe',
        }
    }

    for _, v in pairs(DynamicMenuItems) do
        options[#options + 1] = {
            title = v.header,
            description = v.txt or '',
            icon = v.icon or 'fa-solid fa-circle',
            event = v.params and v.params.event,
            args = v.params and v.params.args
        }
    end

    options[#options + 1] = {
        title = Lang:t('bodygang.exit'),
        icon = 'fa-solid fa-angle-left',
        event = 'lib:closeContext',
    }

    ShowMenu('gang_menu_main', {
        title = Lang:t('headersgang.bsm') .. string.upper(PlayerGang.label),
        options = options
    })
end)

RegisterNetEvent('qb-gangmenu:client:openStash', function()
    local playerData = QBCore.Functions.GetPlayerData()
    local playerGang = playerData.gang

    if not playerGang or not playerGang.name or not playerGang.isboss then
        QBCore.Functions.Notify("Kamu bukan bos geng!", "error")
        return
    end
    
    local stashName = "gang_boss_" .. playerGang.name
    lib.callback.await('gangmenu:server:registerStash', false, stashName)
    exports.ox_inventory:openInventory('stash', stashName)
end)

RegisterNetEvent('qb-gangmenu:client:ManageGang', function()
    QBCore.Functions.TriggerCallback('qb-gangmenu:server:GetEmployees', function(cb)
        local options = {}

        for _, v in pairs(cb) do
            options[#options + 1] = {
                title = v.name,
                description = v.grade.name,
                icon = 'fa-solid fa-circle-user',
                event = 'qb-gangmenu:client:ManageMember',
                args = {
                    player = v,
                    work = PlayerGang
                }
            }
        end

        options[#options + 1] = {
            title = Lang:t('bodygang.return'),
            icon = 'fa-solid fa-angle-left',
            event = 'qb-gangmenu:client:OpenMenu'
        }

        ShowMenu('gang_menu_manage', {
            title = Lang:t('bodygang.mempl') .. string.upper(PlayerGang.label),
            options = options
        })
    end, PlayerGang.name)
end)

RegisterNetEvent('qb-gangmenu:client:ManageMember', function(data)
    local options = {}

    for k, v in pairs(QBCore.Shared.Gangs[data.work.name].grades) do
        options[#options + 1] = {
            title = v.name,
            description = Lang:t('bodygang.grade') .. k,
            icon = 'fa-solid fa-file-pen',
            serverEvent = 'qb-gangmenu:server:GradeUpdate',
            args = {
                cid = data.player.empSource,
                grade = tonumber(k),
                gradename = v.name
            }
        }
    end

    options[#options + 1] = {
        title = Lang:t('bodygang.fireemp'),
        icon = 'fa-solid fa-user-large-slash',
        serverEvent = 'qb-gangmenu:server:FireMember',
        args = data.player.empSource
    }

    options[#options + 1] = {
        title = Lang:t('bodygang.return'),
        icon = 'fa-solid fa-angle-left',
        event = 'qb-gangmenu:client:ManageGang'
    }

    ShowMenu('gang_menu_manage_member', {
        title = Lang:t('bodygang.mngpl') .. data.player.name .. ' - ' .. string.upper(PlayerGang.label),
        options = options
    })
end)

RegisterNetEvent('qb-gangmenu:client:HireMembers', function()
    QBCore.Functions.TriggerCallback('qb-gangmenu:getplayers', function(players)
        local options = {}

        for _, v in pairs(players) do
            if v and v ~= PlayerId() then
                options[#options + 1] = {
                    title = v.name,
                    description = Lang:t('bodygang.cid') .. v.citizenid .. ' - ID: ' .. v.sourceplayer,
                    icon = 'fa-solid fa-user-check',
                    serverEvent = 'qb-gangmenu:server:HireMember',
                    args = v.sourceplayer
                }
            end
        end

        options[#options + 1] = {
            title = Lang:t('bodygang.return'),
            icon = 'fa-solid fa-angle-left',
            event = 'qb-gangmenu:client:OpenMenu'
        }

        ShowMenu('gang_menu_hire', {
            title = Lang:t('bodygang.hireemp') .. string.upper(PlayerGang.label),
            options = options
        })
    end)
end)

-- MAIN THREAD
CreateThread(function()
    if Config.UseTarget then
        for gang, zones in pairs(Config.GangMenus) do
            for index, coords in ipairs(zones) do
                local zoneName = gang .. '_gangmenu_' .. index
                exports['qb-target']:AddCircleZone(zoneName, coords, 0.5, {
                    name = zoneName,
                    debugPoly = false,
                    useZ = true
                }, {
                    options = {
                        {
                            type = 'client',
                            event = 'qb-gangmenu:client:OpenMenu',
                            icon = 'fas fa-sign-in-alt',
                            label = Lang:t('targetgang.label'),
                            canInteract = function()
                                return gang == PlayerGang.name and PlayerGang.isboss
                            end,
                        },
                    },
                    distance = 2.5
                })
            end
        end
    else
        while true do
            local wait = 2500
            local pos = GetEntityCoords(PlayerPedId())
            local inRangeGang = false
            local nearGangmenu = false
            if PlayerGang then
                wait = 0
                for k, menus in pairs(Config.GangMenus) do
                    for _, coords in ipairs(menus) do
                        if k == PlayerGang.name and PlayerGang.isboss then
                            if #(pos - coords) < 5.0 then
                                inRangeGang = true
                                if #(pos - coords) <= 1.5 then
                                    nearGangmenu = true
                                    if not shownGangMenu then
                                        exports['qb-core']:DrawText(Lang:t('drawtextgang.label'), 'left')
                                        shownGangMenu = true
                                    end

                                    if IsControlJustReleased(0, 38) then
                                        exports['qb-core']:HideText()
                                        TriggerEvent('qb-gangmenu:client:OpenMenu')
                                    end
                                end

                                if not nearGangmenu and shownGangMenu then
                                    lib.hideContext()
                                    shownGangMenu = false
                                end
                            end
                        end
                    end
                end
                if not inRangeGang then
                    Wait(1500)
                    if shownGangMenu then
                        lib.hideContext()
                        shownGangMenu = false
                    end
                end
            end
            Wait(wait)
        end
    end
end)
