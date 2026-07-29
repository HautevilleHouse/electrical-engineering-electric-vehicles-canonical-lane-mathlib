import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringElectricVehiclesCanonicalLaneLean

structure VehicleLongitudinalDynamics where
  massKg : Float
  frontalAreaM2 : Float
  dragCoeff : Float
  rollingResistanceCoeff : Float
  wheelRadiusM : Float

structure VehicleLongitudinalDynamicsEvidence (V : VehicleLongitudinalDynamics) where
  massKgClosed : V.massKg > 0
  frontalAreaM2Closed : V.frontalAreaM2 > 0
  dragCoeffClosed : V.dragCoeff > 0
  rollingResistanceCoeffClosed : V.rollingResistanceCoeff > 0
  wheelRadiusMClosed : V.wheelRadiusM > 0

def VehicleLongitudinalDynamicsClosed (V : VehicleLongitudinalDynamics) : Prop :=
  V.massKg > 0 ∧ V.frontalAreaM2 > 0 ∧ V.dragCoeff > 0 ∧
  V.rollingResistanceCoeff > 0 ∧ V.wheelRadiusM > 0

theorem vehicle_longitudinal_dynamics_closed_from_evidence
    (V : VehicleLongitudinalDynamics) (E : VehicleLongitudinalDynamicsEvidence V) :
    VehicleLongitudinalDynamicsClosed V := by
  exact And.intro E.massKgClosed
    (And.intro E.frontalAreaM2Closed
      (And.intro E.dragCoeffClosed
        (And.intro E.rollingResistanceCoeffClosed
          E.wheelRadiusMClosed)))

end ElectricalEngineeringElectricVehiclesCanonicalLaneLean
end HautevilleHouse