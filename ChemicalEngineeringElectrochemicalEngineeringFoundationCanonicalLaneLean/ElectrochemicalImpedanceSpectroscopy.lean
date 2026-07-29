import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean

structure ElectrochemicalImpedanceSpectroscopyPackage where
  frequency : ℝ
  resistance : ℝ
  capacitance : ℝ
  impedanceMagnitude : ℝ
  phaseShift : ℝ
  eisModelSatisfied : Prop
  frequencyPositive : frequency > 0
  resistancePositive : resistance > 0
  capacitancePositive : capacitance > 0

structure ElectrochemicalImpedanceSpectroscopyEvidence (E : ElectrochemicalImpedanceSpectroscopyPackage) where
  eisModelSatisfiedClosed : E.eisModelSatisfied
  impedanceMagnitudeFormula : E.impedanceMagnitude = Real.sqrt (E.resistance^2 + (1 / (2 * Real.pi * E.frequency * E.capacitance))^2)
  phaseShiftFormula : E.phaseShift = Real.arctan (-1 / (2 * Real.pi * E.frequency * E.resistance * E.capacitance))

def ElectrochemicalImpedanceSpectroscopyClosed (E : ElectrochemicalImpedanceSpectroscopyPackage) : Prop :=
  E.eisModelSatisfied ∧ (E.impedanceMagnitude = Real.sqrt (E.resistance^2 + (1 / (2 * Real.pi * E.frequency * E.capacitance))^2)) ∧ (E.phaseShift = Real.arctan (-1 / (2 * Real.pi * E.frequency * E.resistance * E.capacitance)))

theorem electrochemical_impedance_spectroscopy_closed_from_evidence (E : ElectrochemicalImpedanceSpectroscopyPackage) (Ev : ElectrochemicalImpedanceSpectroscopyEvidence E) : ElectrochemicalImpedanceSpectroscopyClosed E := by
  exact And.intro Ev.eisModelSatisfiedClosed (And.intro Ev.impedanceMagnitudeFormula Ev.phaseShiftFormula)

end ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean
end HautevilleHouse