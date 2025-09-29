 FormatLokasi = function(coord)
    if coord == nil then
        return "unknown"
    end
    return tonumber(string.format("%.2f", coord))
end
AddEventHandler('oWW:njajaltok', function(infone)
    local coords = infone.coords
    local format = 'vec3('..FormatLokasi(coords.x)..', '..FormatLokasi(coords.y)..', '..FormatLokasi(coords.z)..')'
    print(format)
    lib.setClipboard(format)
end)
local options = {
    {
        name = 'karepmuWes',
        event = 'oWW:njajaltok',
        icon = 'fa-solid fa-code-compare',
        label = 'Ambil Coords',
    },
}
exports.ox_target:addGlobalObject(options)