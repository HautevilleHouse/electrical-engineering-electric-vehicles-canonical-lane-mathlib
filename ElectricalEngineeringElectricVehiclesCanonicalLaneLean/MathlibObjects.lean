import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringElectricVehiclesCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure ElectricVehicleSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure EVAdmittedObject where
  vehicle : ElectricVehicleSpace
  batteryCapacity : Prop
  powertrainEfficiency : Prop
  chargingCompatible : Prop
  conclusion : batteryCapacity ∧ powertrainEfficiency ∧ chargingCompatible

structure EVEndgameState where
  object : EVAdmittedObject

def EVWitnessClosed (O : EVAdmittedObject) : Prop :=
  O.batteryCapacity ∧ O.powertrainEfficiency ∧ O.chargingCompatible

end ElectricalEngineeringElectricVehiclesCanonicalLaneLean
end HautevilleHouse