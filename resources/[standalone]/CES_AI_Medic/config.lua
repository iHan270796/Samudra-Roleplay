Config = {}

-- Models
Config.MedicModel = 's_m_m_paramedic_01' -- Fallback: 's_m_m_doctor_01'
Config.AmbulanceModel = 'ambulancecak'

-- Behavior
Config.ReviveDelay = 10000 -- Time for medic to "treat" player (ms)
Config.Fee = 25000 -- Cost of EMS service
Config.MaxEMSOnline = 0 -- Max online EMS before AI medic is disabled

-- Hospital locations (ensure these match your map)
Config.Hospitals = {
    city = vector3(-465.61, -1017.07, 24.29),
    sandy = vector3(1828.52, 3673.22, 34.28),
    paleto = vector3(-247.76, 6331.23, 32.43),
    -- Fallback hospital if none are valid
    default = vector3(293.0, -582.0, 43.0)
}