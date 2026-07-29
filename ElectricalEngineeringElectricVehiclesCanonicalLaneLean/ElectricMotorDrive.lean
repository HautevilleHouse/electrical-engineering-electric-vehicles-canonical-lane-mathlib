import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringElectricVehiclesCanonicalLaneLean

structure ElectricMotorDrive where
  motorType : String
  ratedPowerKW : Float
  maxTorqueNm : Float
  efficiencyMap : Float → Float → Float
  gearRatio : Float

structure ElectricMotorDriveEvidence (M : ElectricMotorDrive) where
  motorTypeClosed : M.motorType ∈ {"PMSM", "IM", "SRM"}
  ratedPowerKWClosed : M.ratedPowerKW > 0
  maxTorqueNmClosed : M.maxTorqueNm > 0
  efficiencyMapClosed : ∀ (ω : Float) (τ : Float), 0 ≤ M.efficiencyMap ω τ ∧ M.efficiencyMap ω τ ≤ 1
  gearRatioClosed : M.gearRatio > 0

def ElectricMotorDriveClosed (M : ElectricMotorDrive) : Prop :=
  M.motorType ∈ {"PMSM", "IM", "SRM"} ∧ M.ratedPowerKW > 0 ∧ M.maxTorqueNm > 0 ∧
  (∀ (ω : Float) (τ : Float), 0 ≤ M.efficiencyMap ω τ ∧ M.efficiencyMap ω τ ≤ 1) ∧
  M.gearRatio > 0

theorem electric_motor_drive_closed_from_evidence (M : ElectricMotorDrive)
    (E : ElectricMotorDriveEvidence M) : ElectricMotorDriveClosed M := by
  exact And.intro E.motorTypeClosed
    (And.intro E.ratedPowerKWClosed
      (And.intro E.maxTorqueNmClosed
        (And.intro E.efficiencyMapClosed E.gearRatioClosed)))

end ElectricalEngineeringElectricVehiclesCanonicalLaneLean
end HautevilleHouse