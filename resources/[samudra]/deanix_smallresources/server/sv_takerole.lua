local allowedRoles = {
    "1420785589552287884", -- admin
    "1033975598177079337", -- helper
    "1033972404868878438", -- high admin
    "1033974634724466779", -- warga
}

local function GetLicense(src)
    for _, v in pairs(GetPlayerIdentifiers(src)) do
        if string.sub(v, 1, 8) == "license:" then
            return v
        end
    end
    return nil
end

AddEventHandler('playerConnecting', function(name, setKickReason, deferrals)
    local src = source
    deferrals.defer()
    deferrals.update("🔍 Mengecek koneksi Discord kamu...")

    -- ambil discord id
    local discordId
    for _, v in pairs(GetPlayerIdentifiers(src)) do
        if string.sub(v, 1, 8) == "discord:" then
            discordId = string.sub(v, 9)
            break
        end
    end

    if not discordId then
        deferrals.done("❌ Kamu harus menyalakan Discord agar bisa join server ini.")
        return
    end

    local license = GetLicense(src)
    if not license then
        deferrals.done("⚠️ Tidak bisa mendeteksi license kamu. Pastikan Steam / Rockstar Launcher aktif.")
        return
    end

    deferrals.update("🔎 Mengecek role Discord kamu...")
    Wait(1500) -- tunggu sedikit biar Badger sempat ambil data

    local userRoles = exports['Badger_Discord_API']:GetDiscordRoles(src)
    if not userRoles or #userRoles == 0 then
        print(("[Discord Whitelist] Player %s (%s) gagal ambil role."):format(name, discordId))
        deferrals.done("❌ Gagal memeriksa role Discord kamu.\nCoba reconnect ke Discord lalu restart FiveM.")
        return
    end

    local hasRole = false
    for _, role in ipairs(userRoles) do
        for _, allowed in ipairs(allowedRoles) do
            if tostring(role) == tostring(allowed) then
                hasRole = true
                break
            end
        end
        if hasRole then break end
    end

    if hasRole then
        deferrals.update("✅ Role kamu valid! Silakan masuk ke kota...")
        Wait(1000)
        deferrals.done()
    else
        deferrals.done("🚫 Kamu tidak memiliki role yang diizinkan untuk masuk ke kota ini.\nHubungi admin untuk mendapatkan akses.")
    end
end)
