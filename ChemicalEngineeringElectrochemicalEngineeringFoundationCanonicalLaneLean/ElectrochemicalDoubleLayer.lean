import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean

structure ElectrochemicalDoubleLayerPackage where
  electrodePotential : ℝ
  solutionConcentration : ℝ
  temperature : ℝ
  faradayConstant : ℝ
  gasConstant : ℝ
  debyeLength : ℝ
  capacitance : ℝ
  doubleLayerFormed : Prop
  temperaturePositive : temperature > 0
  concentrationNonnegative : solutionConcentration ≥ 0

structure ElectrochemicalDoubleLayerEvidence (E : ElectrochemicalDoubleLayerPackage) where
  doubleLayerFormedClosed : E.doubleLayerFormed
  debyeLengthFormula : E.debyeLength = Real.sqrt ((E.gasConstant * E.temperature) / (2 * E.faradayConstant^2 * E.solutionConcentration))
  capacitanceFormula : E.capacitance = 1 / E.debyeLength

def ElectrochemicalDoubleLayerClosed (E : ElectrochemicalDoubleLayerPackage) : Prop :=
  E.doubleLayerFormed ∧ (E.debyeLength = Real.sqrt ((E.gasConstant * E.temperature) / (2 * E.faradayConstant^2 * E.solutionConcentration))) ∧ (E.capacitance = 1 / E.debyeLength)

theorem electrochemical_double_layer_closed_from_evidence (E : ElectrochemicalDoubleLayerPackage) (Ev : ElectrochemicalDoubleLayerEvidence E) : ElectrochemicalDoubleLayerClosed E := by
  exact And.intro Ev.doubleLayerFormedClosed (And.intro Ev.debyeLengthFormula Ev.capacitanceFormula)

end ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean
end HautevilleHouse