local client = client
local bridge = require("game.bridge")
local logger = require("modules.utility.shared.logger")

-- Interface should be available globally from the interface module

-- Rotate character callback
Interface:on("callback::function::character::rotate", function(data, cb)
    local ped = PlayerPedId()
    local delta = data.deltaX
    local heading = GetEntityHeading(ped)
    local newHeading = heading + (delta * 0.2)
    SetEntityHeading(ped, newHeading)
    cb(200)
end)

-- Get locales callback
Interface:on("callback::function::locales::get", function(_, cb)
    local locale = GetConvar("illenium-appearance:locale", "en")
    cb(Locales[locale].UI)
end)

-- Set camera callback
Interface:on("callback::function::camera::set", function(data, cb)
    cb(1)
    client.setCamera(data)
end)

-- Change model callback
Interface:on("callback::function::model::change", function(model, cb)
    local ped = client.setPlayerModel(model)
    SetEntityHeading(cache.ped, client.getHeading())
    SetEntityInvincible(ped, true)
    TaskStandStill(ped, -1)

    cb({
        new_character_appearance = client.getPedAppearance(ped),
        new_game_appearance_data = bridge:getAppearanceSettings()
    })
end)

-- Change component callback
Interface:on("callback::function::component::change", function(component, cb)
    client.setPedComponent(cache.ped, component)
    bridge:onComponentChange(component)

    cb(bridge:getComponentSettings(cache.ped, component.component_id))
end)

-- Change prop callback
Interface:on("callback::function::prop::change", function(prop, cb)
    client.setPedProp(cache.ped, prop)
    bridge:onPropChange(prop)

    cb(bridge:getPropSettings(cache.ped, prop.prop_id))
end)

-- Change head blend callback
Interface:on("callback::function::head_blend::change", function(data, cb)
    cb(1)
    client.setPedHeadBlend(cache.ped, data)
end)

-- Change face feature callback
Interface:on("callback::function::face_feature::change", function(data, cb)
    cb(1)
    client.setPedFaceFeatures(cache.ped, data)
end)

-- Change head overlay callback
Interface:on("callback::function::head_overlay::change", function(data, cb)
    cb(200)
    client.setPedHeadOverlays(cache.ped, data)
end)

-- Change hair callback
Interface:on("callback::function::hair::change", function(data, cb)
    client.setPedHair(cache.ped, data)
    cb(bridge:getHairSettings(cache.ped))
end)

-- Change eye color callback
Interface:on("callback::function::eye_color::change", function(data, cb)
    cb(1)
    client.setPedEyeColor(cache.ped, data)
end)

-- Apply tattoo callback
Interface:on("callback::function::tattoo::apply", function(data, cb)
    local success = not Config.ChargePerTattoo or lib.callback.await("illenium-appearance:server:payForTattoo", false, data.tattoo)

    if success then
        client.addPedTattoo(cache.ped, data.updatedTattoos or data)
    end

    cb(success)
end)

-- Preview tattoo callback
Interface:on("callback::function::tattoo::preview", function(data, cb)
    client.setPreviewTattoo(cache.ped, data.data, data.tattoo)
    cb(200)
end)

-- Set tattoo opacity callback
Interface:on("callback::function::tattoo::opacity::set", function(data, cb)
    cb(1)
    client.addPedTattoo(cache.ped, data.updatedTattoos or data)
end)

-- Delete tattoo callback
Interface:on("callback::function::tattoo::delete", function(data, cb)
    cb(1)
    client.removePedTattoo(cache.ped, data)
end)

-- Wear clothes callback
Interface:on("callback::function::wear_clothes", function(data, cb)
    cb(1)
    client.wearClothes(data.data, data.key)
end)

-- Remove clothes callback
Interface:on("callback::function::remove_clothes", function(data, cb)
    cb(1)
    client.removeClothes(data)
end)

-- Save callback
Interface:on("callback::function::save", function(data, cb)
    cb(1)
    client.wearClothes(data, "head")
    client.wearClothes(data, "body")
    client.wearClothes(data, "bottom")
    client.exitPlayerCustomization(data)
end)

-- Exit customization callback
Interface:on("callback::function::exit", function(_, cb)
    cb(1)
    client.exitPlayerCustomization()
end)
