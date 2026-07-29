import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringElectricVehiclesCanonicalLaneLean

structure BatteryThermalManagement where
  coolingType : String
  coolantFlowRate : Float
  ambientTemp : Float
  targetTempRange : Float × Float

structure BatteryThermalManagementEvidence (T : BatteryThermalManagement) where
  coolingTypeClosed : T.coolingType ∈ {"Passive", "Active Air", "Active Liquid", "Refrigerant"}
  coolantFlowRateClosed : T.coolantFlowRate ≥ 0
  ambientTempClosed : T.ambientTemp > -40 ∧ T.ambientTemp < 60
  targetTempRangeClosed : T.targetTempRange.1 < T.targetTempRange.2

def BatteryThermalManagementClosed (T : BatteryThermalManagement) : Prop :=
  T.coolingType ∈ {"Passive", "Active Air", "Active Liquid", "Refrigerant"} ∧
  T.coolantFlowRate ≥ 0 ∧ T.ambientTemp > -40 ∧ T.ambientTemp < 60 ∧
  T.targetTempRange.1 < T.targetTempRange.2

theorem battery_thermal_management_closed_from_evidence
    (T : BatteryThermalManagement) (E : BatteryThermalManagementEvidence T) :
    BatteryThermalManagementClosed T := by
  exact And.intro E.coolingTypeClosed
    (And.intro E.coolantFlowRateClosed
      (And.intro E.ambientTempClosed.1
        (And.intro E.ambientTempClosed.2
          E.targetTempRangeClosed)))

end ElectricalEngineeringElectricVehiclesCanonicalLaneLean
end HautevilleHouse