import HautevilleHouse.ElectricalEngineeringElectricVehiclesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringElectricVehiclesCanonicalLaneLean

structure ThermalManagementPackage where
  coolingCapacity : Prop
  temperatureRegulation : Prop
  heatDissipation : Prop
  thermalRunawayPrevention : Prop

structure ThermalManagementEvidence (T : ThermalManagementPackage) where
  coolingCapacityClosed : T.coolingCapacity
  temperatureRegulationClosed : T.temperatureRegulation
  heatDissipationClosed : T.heatDissipation
  thermalRunawayPreventionClosed : T.thermalRunawayPrevention

def ThermalManagementClosed (T : ThermalManagementPackage) : Prop :=
  T.coolingCapacity ∧ T.temperatureRegulation ∧ T.heatDissipation ∧ T.thermalRunawayPrevention

theorem thermal_management_closed_from_evidence (T : ThermalManagementPackage) (E : ThermalManagementEvidence T) : ThermalManagementClosed T := by
  exact And.intro E.coolingCapacityClosed (And.intro E.temperatureRegulationClosed (And.intro E.heatDissipationClosed E.thermalRunawayPreventionClosed))

end ElectricalEngineeringElectricVehiclesCanonicalLaneLean
end HautevilleHouse
