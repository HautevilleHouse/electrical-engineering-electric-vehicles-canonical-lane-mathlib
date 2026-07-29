import ElectricalEngineeringElectricVehiclesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringElectricVehiclesCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop := A.object.constraintSatisfied

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.conclusion

end ElectricalEngineeringElectricVehiclesCanonicalLaneLean
end HautevilleHouse