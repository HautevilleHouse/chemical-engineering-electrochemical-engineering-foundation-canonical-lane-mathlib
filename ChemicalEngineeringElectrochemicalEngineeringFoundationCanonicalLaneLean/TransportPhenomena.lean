import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean

structure TransportPhenomenaPackage where
  migration : Prop
  diffusion : Prop
  convection : Prop
  nernstPlanckEquation : Prop
  currentDensityDistribution : Prop

structure TransportPhenomenaEvidence (T : TransportPhenomenaPackage) where
  migrationClosed : T.migration
  diffusionClosed : T.diffusion
  convectionClosed : T.convection
  nernstPlanckEquationClosed : T.nernstPlanckEquation
  currentDensityDistributionClosed : T.currentDensityDistribution

def TransportPhenomenaClosed (T : TransportPhenomenaPackage) : Prop :=
  T.migration ∧ T.diffusion ∧ T.convection ∧ T.nernstPlanckEquation ∧ T.currentDensityDistribution

theorem transport_phenomena_closed_from_evidence (T : TransportPhenomenaPackage) (E : TransportPhenomenaEvidence T) : TransportPhenomenaClosed T := by
  exact And.intro E.migrationClosed (And.intro E.diffusionClosed (And.intro E.convectionClosed (And.intro E.nernstPlanckEquationClosed E.currentDensityDistributionClosed)))

end ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean
end HautevilleHouse