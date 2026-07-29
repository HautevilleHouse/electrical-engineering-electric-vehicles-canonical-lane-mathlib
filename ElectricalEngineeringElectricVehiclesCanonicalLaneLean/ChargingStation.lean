import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringElectricVehiclesCanonicalLaneLean

structure ChargingStation where
  stationType : String
  maxPowerKW : Float
  voltageLvl : Float
  connectorType : String
  gridConnected : Bool

structure ChargingStationEvidence (S : ChargingStation) where
  stationTypeClosed : S.stationType ∈ {"AC", "DC Fast", "Ultrafast"}
  maxPowerKWClosed : S.maxPowerKW > 0
  voltageLvlClosed : S.voltageLvl > 0
  connectorTypeClosed : S.connectorType ∈ {"CCS", "CHAdeMO", "Type2"}
  gridConnectedClosed : S.gridConnected

def ChargingStationClosed (S : ChargingStation) : Prop :=
  S.stationType ∈ {"AC", "DC Fast", "Ultrafast"} ∧ S.maxPowerKW > 0 ∧
  S.voltageLvl > 0 ∧ S.connectorType ∈ {"CCS", "CHAdeMO", "Type2"} ∧
  S.gridConnected

theorem charging_station_closed_from_evidence (S : ChargingStation)
    (E : ChargingStationEvidence S) : ChargingStationClosed S := by
  exact And.intro E.stationTypeClosed
    (And.intro E.maxPowerKWClosed
      (And.intro E.voltageLvlClosed
        (And.intro E.connectorTypeClosed E.gridConnectedClosed)))

end ElectricalEngineeringElectricVehiclesCanonicalLaneLean
end HautevilleHouse