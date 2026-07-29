import ElectricalEngineeringElectricVehiclesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringElectricVehiclesCanonicalLaneLean

structure BatteryPackage where
  capacity : Float
  stateOfCharge : Float
  degradationModel : Prop
  thermalControl : Prop
  safetyLimits : Prop

structure BatteryEvidence (B : BatteryPackage) where
  degradationModelClosed : B.degradationModel
  thermalControlClosed : B.thermalControl
  safetyLimitsClosed : B.safetyLimits

def BatteryClosed (B : BatteryPackage) : Prop :=
  B.degradationModel ∧ B.thermalControl ∧ B.safetyLimits

theorem battery_closed_from_evidence (B : BatteryPackage) (E : BatteryEvidence B) : BatteryClosed B := by
  exact And.intro E.degradationModelClosed (And.intro E.thermalControlClosed E.safetyLimitsClosed)

end ElectricalEngineeringElectricVehiclesCanonicalLaneLean
end HautevilleHouse