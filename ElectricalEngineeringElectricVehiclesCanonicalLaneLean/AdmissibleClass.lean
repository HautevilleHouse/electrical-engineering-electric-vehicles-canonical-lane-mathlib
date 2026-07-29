import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringElectricVehiclesCanonicalLaneLean

structure ElectricVehicleAdmittedObject where
  vehicleModel : Type
  batteryCapacity : Float
  motorPower : Float
  rangeEstimate : Float
  constraintSatisfied : Prop
  conclusion : constraintSatisfied

structure AdmissibleClass where
  object : ElectricVehicleAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

end ElectricalEngineeringElectricVehiclesCanonicalLaneLean
end HautevilleHouse