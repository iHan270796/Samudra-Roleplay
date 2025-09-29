return {
    framework = "qb", -- Framework for player stats: "none", "esx", "qb", "ox", "custom".
    speedUnit = "kmh", -- Speed unit: "mph" or "kph".

    useBuiltInSeatbeltLogic = false, -- Enable custom seatbelt logic (true/false).
    ejectMinSpeed = 20.0, -- Using built-in seatbelt logic: Minimum speed to eject when not wearing a seatbelt (in speedUnit).

    minimapAlways = true, -- Always show minimap (true) or only in vehicles (false).
    compassAlways = false, -- Always show compass (true) or only in vehicles (false).
    compassLocation = "top", -- Compass position: "top", "bottom", "hidden".

    useSkewedStyle = true, -- Enable skewed style for HUD (true/false).
    skewAmount = 20, -- Amount of skew to apply (recommended 10-20).
}