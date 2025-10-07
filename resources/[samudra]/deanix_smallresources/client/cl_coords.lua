--  FormatLokasi = function(coord)
--     if coord == nil then
--         return "unknown"
--     end
--     return tonumber(string.format("%.2f", coord))
-- end
-- AddEventHandler('oWW:njajaltok', function(infone)
--     local coords = infone.coords
--     local format = 'vec3('..FormatLokasi(coords.x)..', '..FormatLokasi(coords.y)..', '..FormatLokasi(coords.z)..')'
--     print(format)
--     lib.setClipboard(format)
-- end)
-- local options = {
--     {
--         name = 'karepmuWes',
--         event = 'oWW:njajaltok',
--         icon = 'fa-solid fa-code-compare',
--         label = 'Ambil Coords',
--     },
-- }
-- exports.ox_target:addGlobalObject(options)
FormatLokasi = function(coord)
    if coord == nil then
        return "unknown"
    end
    return tonumber(string.format("%.2f", coord))
end

AddEventHandler('oWW:njajaltok', function(infone)
    local entity = infone.entity
    if not entity or not DoesEntityExist(entity) then
        return lib.notify({
            title = 'Gagal',
            description = 'Tidak ada entity yang valid!',
            type = 'error'
        })
    end

    local coords = GetEntityCoords(entity)
    local model = GetEntityModel(entity)
    local formatCoords = 'vec3('..FormatLokasi(coords.x)..', '..FormatLokasi(coords.y)..', '..FormatLokasi(coords.z)..')'
    local formatHash = '['..model..']'
    local combined = formatHash..' = { coords = '..formatCoords..' }'

    print('Copied:', combined)
    lib.setClipboard(combined)

    lib.notify({
        title = 'Copied!',
        description = 'Hash & coords sudah disalin ke clipboard.',
        type = 'success'
    })
end)

local options = {
    {
        name = 'karepmuWes',
        event = 'oWW:njajaltok',
        icon = 'fa-solid fa-code-compare',
        label = 'Ambil Coords & Hash',
        groups = 'realestate',
    },
}
exports.ox_target:addGlobalObject(options)
