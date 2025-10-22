-- ============================================
-- PS-DISPATCH COMPATIBILITY LAYER
-- Provides standardized dispatch alerts for various crime types
-- ============================================

function CreateDispatchAlert(dispatchType, title, description, priority)
  local location = GetCurrentLocation()
  
  local finalDescription = description or (title .. " reported at " .. location .. ".")
  local finalPriority = priority or 2
  
  CreateDispatch({
      type = dispatchType,
      title = title,
      description = finalDescription,
      location = location,
      coords = location.coords,
      priority = finalPriority
  })
end

-- ============================================
-- DISPATCH HANDLERS TABLE
-- ============================================

local DispatchHandlers = {}

-- Traffic & Vehicle Crimes
function VehicleTheft()
  CreateDispatchAlert("robbery", "Vehicle Theft reported", nil, 3)
end

function SpeedingVehicle()
  CreateDispatchAlert("disturbance", "Speeding reported", nil, 3)
end

function CarJacking()
  CreateDispatchAlert("carjacking", "Carjacking reported", nil, 3)
end

function CarBoosting()
  CreateDispatchAlert("carboosting", "Car Boosting reported", nil, 3)
end

-- Violent Crimes
function Shooting()
  CreateDispatchAlert("assault", "Shooting reported", nil, 3)
end

function VehicleShooting()
  CreateDispatchAlert("assault", "Vehicle Shots reported", nil, 3)
end

function Fight()
  CreateDispatchAlert("assault", "Fight reported", nil, 3)
end

-- Robberies - Priority 4
function StoreRobbery()
  CreateDispatchAlert("robbery", "Store Robbery reported", nil, 4)
end

function FleecaBankRobbery()
  CreateDispatchAlert("robbery", "Fleeca Bank Robbery reported", nil, 4)
end

function PaletoBankRobbery()
  CreateDispatchAlert("robbery", "Paleto Bank Robbery reported", nil, 4)
end

function PacificBankRobbery()
  CreateDispatchAlert("robbery", "Pacific Bank Robbery reported", nil, 5)
end

function VangelicoRobbery()
  CreateDispatchAlert("robbery", "Vangelico Robbery reported", nil, 4)
end

function HouseRobbery()
  CreateDispatchAlert("robbery", "House Robbery reported", nil, 4)
end

function YachtHeist()
  CreateDispatchAlert("robbery", "Yacht Heist reported", nil, 4)
end

function ArtGalleryRobbery()
  CreateDispatchAlert("robbery", "Art Gallery Robbery reported", nil, 4)
end

function HumaneRobbery()
  CreateDispatchAlert("robbery", "Humane Labs Robbery reported", nil, 4)
end

function TrainRobbery()
  CreateDispatchAlert("robbery", "Train Robbery reported", nil, 4)
end

function VanRobbery()
  CreateDispatchAlert("robbery", "Van Robbery reported", nil, 4)
end

function UndergroundRobbery()
  CreateDispatchAlert("robbery", "Underground Robbery reported", nil, 4)
end

function DrugBoatRobbery()
  CreateDispatchAlert("robbery", "Drug Boat Robbery reported", nil, 4)
end

function UnionRobbery()
  CreateDispatchAlert("robbery", "Union Robbery reported", nil, 4)
end

function SignRobbery()
  CreateDispatchAlert("robbery", "Sign Robbery reported", nil, 4)
end

function BobcatSecurityHeist()
  CreateDispatchAlert("robbery", "Bobcat Security Heist reported", nil, 4)
end

function PrisonBreak()
  CreateDispatchAlert("robbery", "Prison Break reported", nil, 4)
end

-- Other Crimes
function Hunting()
  CreateDispatchAlert("disturbance", "Hunting reported", nil, 3)
end

function DrugSale()
  CreateDispatchAlert("drug_sale", "Drug Sale reported", nil, 4)
end

function SuspiciousActivity()
  CreateDispatchAlert("suspicious_activity", "Suspicious Activity reported", nil, 4)
end

function Explosion()
  CreateDispatchAlert("explosion", "Explosion reported", nil, 3)
end

-- Emergency Services - Priority 1
function InjuriedPerson()
  CreateDispatchAlert("civ_down", "Injured Person reported", nil, 1)
end

function DeceasedPerson()
  CreateDispatchAlert("civ_dead", "Deceased Person reported", nil, 1)
end

function OfficerDown()
  CreateDispatchAlert("officer_down", "Officer Down reported", nil, 1)
end

function OfficerBackup()
  CreateDispatchAlert("officer_backup", "Officer Backup reported", nil, 1)
end

function OfficerInDistress()
  CreateDispatchAlert("officer_distress", "Officer In Distress reported", nil, 1)
end

function EmsDown()
  CreateDispatchAlert("ems_down", "EMS Down reported", nil, 1)
end

-- ============================================
-- BUILD DISPATCH HANDLERS TABLE
-- ============================================

DispatchHandlers.VehicleTheft = VehicleTheft
DispatchHandlers.Shooting = Shooting
DispatchHandlers.Hunting = Hunting
DispatchHandlers.VehicleShooting = VehicleShooting
DispatchHandlers.SpeedingVehicle = SpeedingVehicle
DispatchHandlers.Fight = Fight
DispatchHandlers.PrisonBreak = PrisonBreak
DispatchHandlers.StoreRobbery = StoreRobbery
DispatchHandlers.FleecaBankRobbery = FleecaBankRobbery
DispatchHandlers.PaletoBankRobbery = PaletoBankRobbery
DispatchHandlers.PacificBankRobbery = PacificBankRobbery
DispatchHandlers.VangelicoRobbery = VangelicoRobbery
DispatchHandlers.HouseRobbery = HouseRobbery
DispatchHandlers.YachtHeist = YachtHeist
DispatchHandlers.DrugSale = DrugSale
DispatchHandlers.SuspiciousActivity = SuspiciousActivity
DispatchHandlers.CarJacking = CarJacking
DispatchHandlers.CarBoosting = CarBoosting
DispatchHandlers.InjuriedPerson = InjuriedPerson
DispatchHandlers.DeceasedPerson = DeceasedPerson
DispatchHandlers.OfficerDown = OfficerDown
DispatchHandlers.OfficerBackup = OfficerBackup
DispatchHandlers.OfficerInDistress = OfficerInDistress
DispatchHandlers.EmsDown = EmsDown
DispatchHandlers.Explosion = Explosion
DispatchHandlers.ArtGalleryRobbery = ArtGalleryRobbery
DispatchHandlers.HumaneRobbery = HumaneRobbery
DispatchHandlers.TrainRobbery = TrainRobbery
DispatchHandlers.VanRobbery = VanRobbery
DispatchHandlers.UndergroundRobbery = UndergroundRobbery
DispatchHandlers.DrugBoatRobbery = DrugBoatRobbery
DispatchHandlers.UnionRobbery = UnionRobbery
DispatchHandlers.SignRobbery = SignRobbery
DispatchHandlers.BobcatSecurityHeist = BobcatSecurityHeist

-- ============================================
-- REGISTER EXPORTS FOR PS-DISPATCH
-- ============================================

for handlerName, handlerFunction in pairs(DispatchHandlers) do
  ExportHandler("ps-dispatch", handlerName, handlerFunction)
end