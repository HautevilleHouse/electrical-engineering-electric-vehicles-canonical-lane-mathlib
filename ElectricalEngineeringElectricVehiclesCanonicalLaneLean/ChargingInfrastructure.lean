import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringElectricVehiclesCanonicalLaneLean

structure ChargingStation where
  maxPower : ℝ
  voltage : ℝ
  current : ℝ
  connectorType : String
  protocol : String

def stationValid (s : ChargingStation) : Prop :=
  s.maxPower > 0 ∧ s.voltage > 0 ∧ s.current > 0

structure ChargingProfile where
  targetSOC : ℝ
  maxChargingRate : ℝ
  minChargingRate : ℝ
  temperatureRange : ℝ × ℝ

def profileValid (p : ChargingProfile) : Prop :=
  p.targetSOC ∈ Set.Icc 0 1 ∧ p.maxChargingRate ≥ p.minChargingRate ∧ p.minChargingRate ≥ 0 ∧
  p.temperatureRange.1 < p.temperatureRange.2

structure ChargingInfrastructurePackage where
  station : ChargingStation
  profile : ChargingProfile
  gridConnection : Prop

def wellFormedCharging (C : ChargingInfrastructurePackage) : Prop :=
  stationValid C.station ∧ profileValid C.profile

structure ChargingInfrastructureEvidence (C : ChargingInfrastructurePackage) where
  stationValid : stationValid C.station
  profileValid : profileValid C.profile

def ChargingInfrastructureClosed (C : ChargingInfrastructurePackage) : Prop :=
  stationValid C.station ∧ profileValid C.profile

theorem charging_infrastructure_closed_from_evidence (C : ChargingInfrastructurePackage) (E : ChargingInfrastructureEvidence C) :
    ChargingInfrastructureClosed C := by
  exact And.intro E.stationValid E.profileValid

end ElectricalEngineeringElectricVehiclesCanonicalLaneLean
end HautevilleHouse