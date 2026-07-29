import HautevilleHouse.ElectricalEngineeringElectricVehiclesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringElectricVehiclesCanonicalLaneLean

structure PowertrainPackage where
  motorEfficiency : Prop
  inverterControl : Prop
  regenerativeBraking : Prop
  gearRatio : Prop

structure PowertrainEvidence (P : PowertrainPackage) where
  motorEfficiencyClosed : P.motorEfficiency
  inverterControlClosed : P.inverterControl
  regenerativeBrakingClosed : P.regenerativeBraking
  gearRatioClosed : P.gearRatio

def PowertrainClosed (P : PowertrainPackage) : Prop :=
  P.motorEfficiency ∧ P.inverterControl ∧ P.regenerativeBraking ∧ P.gearRatio

theorem powertrain_closed_from_evidence (P : PowertrainPackage) (E : PowertrainEvidence P) :
    PowertrainClosed P := by
  exact And.intro E.motorEfficiencyClosed (And.intro E.inverterControlClosed (And.intro E.regenerativeBrakingClosed E.gearRatioClosed))

end ElectricalEngineeringElectricVehiclesCanonicalLaneLean
end HautevilleHouse