import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean

structure ButlerVolmerKineticsPackage where
  exchangeCurrentDensity : ℝ
  anodicTransferCoefficient : ℝ
  cathodicTransferCoefficient : ℝ
  overpotential : ℝ
  faradayConstant : ℝ
  gasConstant : ℝ
  temperature : ℝ
  nElectrons : ℕ
  currentDensity : ℝ
  kineticsSatisfied : Prop
  nElectronsPositive : nElectrons > 0
  temperaturePositive : temperature > 0
  exchangeCurrentPositive : exchangeCurrentDensity > 0

structure ButlerVolmerKineticsEvidence (B : ButlerVolmerKineticsPackage) where
  kineticsSatisfiedClosed : B.kineticsSatisfied
  formulaCorrect : B.currentDensity = B.exchangeCurrentDensity * (Real.exp (B.anodicTransferCoefficient * B.faradayConstant * B.overpotential / (B.gasConstant * B.temperature)) - Real.exp (-(B.cathodicTransferCoefficient * B.faradayConstant * B.overpotential) / (B.gasConstant * B.temperature)))

def ButlerVolmerKineticsClosed (B : ButlerVolmerKineticsPackage) : Prop :=
  B.kineticsSatisfied ∧ (B.currentDensity = B.exchangeCurrentDensity * (Real.exp (B.anodicTransferCoefficient * B.faradayConstant * B.overpotential / (B.gasConstant * B.temperature)) - Real.exp (-(B.cathodicTransferCoefficient * B.faradayConstant * B.overpotential) / (B.gasConstant * B.temperature))))

theorem butler_volmer_kinetics_closed_from_evidence (B : ButlerVolmerKineticsPackage) (E : ButlerVolmerKineticsEvidence B) : ButlerVolmerKineticsClosed B := by
  exact And.intro E.kineticsSatisfiedClosed E.formulaCorrect

end ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean
end HautevilleHouse