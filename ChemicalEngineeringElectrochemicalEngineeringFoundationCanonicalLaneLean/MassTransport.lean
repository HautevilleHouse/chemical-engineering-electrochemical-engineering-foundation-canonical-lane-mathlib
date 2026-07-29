import ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean.ElectrodeKinetics

/-!
# Mass Transport Package
-/

namespace HautevilleHouse
namespace ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean

structure MassTransportPackage (A : ElectrochemicalAdmissibleClass)
    (K : ElectrodeKineticsPackage A) where
  diffusionLayer : Prop
  convectionContribution : Prop
  migrationContribution : Prop
  limitingCurrent : Prop

structure MassTransportEvidence (A : ElectrochemicalAdmissibleClass)
    (K : ElectrodeKineticsPackage A) (M : MassTransportPackage A K) where
  diffusionLayerClosed : M.diffusionLayer
  convectionContributionClosed : M.convectionContribution
  migrationContributionClosed : M.migrationContribution
  limitingCurrentClosed : M.limitingCurrent

def MassTransportClosed (A : ElectrochemicalAdmissibleClass)
    (K : ElectrodeKineticsPackage A) (M : MassTransportPackage A K) : Prop :=
  M.diffusionLayer ∧ M.convectionContribution ∧
  M.migrationContribution ∧ M.limitingCurrent

theorem mass_transport_closed_from_evidence
    (A : ElectrochemicalAdmissibleClass) (K : ElectrodeKineticsPackage A)
    (M : MassTransportPackage A K) (E : MassTransportEvidence A K M) :
    MassTransportClosed A K M := by
  exact And.intro E.diffusionLayerClosed
    (And.intro E.convectionContributionClosed
      (And.intro E.migrationContributionClosed E.limitingCurrentClosed))

end ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean
end HautevilleHouse
