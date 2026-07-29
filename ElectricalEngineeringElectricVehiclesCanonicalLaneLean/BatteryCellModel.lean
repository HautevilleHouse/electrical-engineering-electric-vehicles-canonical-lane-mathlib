import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringElectricVehiclesCanonicalLaneLean

structure BatteryCellModel where
  chemistry : String
  nominalVoltage : Float
  capacityAh : Float
  internalResistance : Float
  soh : Float
  soc : Float
  temperature : Float

structure BatteryCellModelEvidence (B : BatteryCellModel) where
  chemistryClosed : B.chemistry ≠ ""
  nominalVoltageClosed : B.nominalVoltage > 0
  capacityAhClosed : B.capacityAh > 0
  internalResistanceClosed : B.internalResistance > 0
  sohClosed : 0 ≤ B.soh ∧ B.soh ≤ 1
  socClosed : 0 ≤ B.soc ∧ B.soc ≤ 1
  temperatureClosed : B.temperature > -40 ∧ B.temperature < 60

def BatteryCellModelClosed (B : BatteryCellModel) : Prop :=
  B.chemistry ≠ "" ∧ B.nominalVoltage > 0 ∧ B.capacityAh > 0 ∧
  B.internalResistance > 0 ∧ 0 ≤ B.soh ∧ B.soh ≤ 1 ∧
  0 ≤ B.soc ∧ B.soc ≤ 1 ∧ B.temperature > -40 ∧ B.temperature < 60

theorem battery_cell_model_closed_from_evidence (B : BatteryCellModel)
    (E : BatteryCellModelEvidence B) : BatteryCellModelClosed B := by
  exact And.intro E.chemistryClosed
    (And.intro E.nominalVoltageClosed
      (And.intro E.capacityAhClosed
        (And.intro E.internalResistanceClosed
          (And.intro E.sohClosed.1
            (And.intro E.sohClosed.2
              (And.intro E.socClosed.1
                (And.intro E.socClosed.2
                  (And.intro E.temperatureClosed.1
                    E.temperatureClosed.2))))))))

end ElectricalEngineeringElectricVehiclesCanonicalLaneLean
end HautevilleHouse