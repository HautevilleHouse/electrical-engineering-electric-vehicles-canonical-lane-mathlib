import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringElectricVehiclesCanonicalLaneLean

structure ElectricMotor where
  type : String                       -- e.g., "PMSM", "Induction"
  maxPower : ℝ
  maxTorque : ℝ
  maxSpeed : ℝ
  efficiencyMap : ℝ → ℝ → ℝ          -- power, speed → efficiency
  thermalLimit : ℝ

def motorValid (m : ElectricMotor) : Prop :=
  m.maxPower > 0 ∧ m.maxTorque > 0 ∧ m.maxSpeed > 0 ∧ m.thermalLimit > 0

structure MotorDrivePackage where
  motor : ElectricMotor
  inverterType : String
  gearRatio : ℝ
  controlAlgorithm : String

def wellFormedDrive (d : MotorDrivePackage) : Prop :=
  motorValid d.motor ∧ d.gearRatio > 0

structure MotorDriveEvidence (D : MotorDrivePackage) where
  motorValid : motorValid D.motor
  gearPositive : D.gearRatio > 0

def MotorDriveClosed (D : MotorDrivePackage) : Prop :=
  motorValid D.motor ∧ D.gearRatio > 0

theorem motor_drive_closed_from_evidence (D : MotorDrivePackage) (E : MotorDriveEvidence D) :
    MotorDriveClosed D := by
  exact And.intro E.motorValid E.gearPositive

end ElectricalEngineeringElectricVehiclesCanonicalLaneLean
end HautevilleHouse