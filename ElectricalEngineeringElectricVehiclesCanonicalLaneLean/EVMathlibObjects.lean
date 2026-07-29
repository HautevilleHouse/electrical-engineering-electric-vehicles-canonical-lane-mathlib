import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace ElectricalEngineeringElectricVehiclesCanonicalLaneLean

structure ElectricVehicleSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure ElectricVehicleAdmittedObject where
  space : ElectricVehicleSpace
  batteryParameter : Prop
  motorParameter : Prop
  thermalParameter : Prop
  conclusion : batteryParameter ∧ motorParameter ∧ thermalParameter

def ElectricVehicleWitnessClosed (O : ElectricVehicleAdmittedObject) : Prop :=
  O.batteryParameter ∧ O.motorParameter ∧ O.thermalParameter

end ElectricalEngineeringElectricVehiclesCanonicalLaneLean
end HautevilleHouse
