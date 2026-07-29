import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringElectricVehiclesCanonicalLaneLean

structure PowerConverter where
  converterType : String
  inputVoltageRange : Float × Float
  outputVoltageRange : Float × Float
  efficiency : Float
  switchingFrequencyHz : Float

structure PowerConverterEvidence (C : PowerConverter) where
  converterTypeClosed : C.converterType ∈ {"DC-DC", "Inverter", "AC-DC"}
  inputVoltageRangeClosed : C.inputVoltageRange.1 < C.inputVoltageRange.2
  outputVoltageRangeClosed : C.outputVoltageRange.1 < C.outputVoltageRange.2
  efficiencyClosed : 0 ≤ C.efficiency ∧ C.efficiency ≤ 1
  switchingFrequencyHzClosed : C.switchingFrequencyHz > 0

def PowerConverterClosed (C : PowerConverter) : Prop :=
  C.converterType ∈ {"DC-DC", "Inverter", "AC-DC"} ∧
  C.inputVoltageRange.1 < C.inputVoltageRange.2 ∧
  C.outputVoltageRange.1 < C.outputVoltageRange.2 ∧
  0 ≤ C.efficiency ∧ C.efficiency ≤ 1 ∧ C.switchingFrequencyHz > 0

theorem power_converter_closed_from_evidence (C : PowerConverter)
    (E : PowerConverterEvidence C) : PowerConverterClosed C := by
  exact And.intro E.converterTypeClosed
    (And.intro E.inputVoltageRangeClosed
      (And.intro E.outputVoltageRangeClosed
        (And.intro E.efficiencyClosed.1
          (And.intro E.efficiencyClosed.2
            E.switchingFrequencyHzClosed))))

end ElectricalEngineeringElectricVehiclesCanonicalLaneLean
end HautevilleHouse