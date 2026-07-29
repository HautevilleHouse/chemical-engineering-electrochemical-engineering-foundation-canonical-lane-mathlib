import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean

structure MassTransportDiffusionPackage where
  concentrationGradient : ℝ
  diffusionCoefficient : ℝ
  temperature : ℝ
  faradayConstant : ℝ
  gasConstant : ℝ
  flux : ℝ
  diffusionEquationSatisfied : Prop
  diffusionCoefficientPositive : diffusionCoefficient > 0
  gradientNonzero : concentrationGradient ≠ 0

structure MassTransportDiffusionEvidence (M : MassTransportDiffusionPackage) where
  diffusionEquationSatisfiedClosed : M.diffusionEquationSatisfied
  ficksLaw : M.flux = -M.diffusionCoefficient * M.concentrationGradient
  nernstEinsteinRelation : M.diffusionCoefficient = M.gasConstant * M.temperature / (M.faradayConstant * M.concentrationGradient * M.flux)

def MassTransportDiffusionClosed (M : MassTransportDiffusionPackage) : Prop :=
  M.diffusionEquationSatisfied ∧ (M.flux = -M.diffusionCoefficient * M.concentrationGradient) ∧ (M.diffusionCoefficient = M.gasConstant * M.temperature / (M.faradayConstant * M.concentrationGradient * M.flux))

theorem mass_transport_diffusion_closed_from_evidence (M : MassTransportDiffusionPackage) (E : MassTransportDiffusionEvidence M) : MassTransportDiffusionClosed M := by
  exact And.intro E.diffusionEquationSatisfiedClosed (And.intro E.ficksLaw E.nernstEinsteinRelation)

end ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean
end HautevilleHouse