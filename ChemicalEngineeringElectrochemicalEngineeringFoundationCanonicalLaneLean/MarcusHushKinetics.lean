import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean

structure MarcusHushKineticsPackage where
  reorganizationEnergy : Prop
  gibbsFreeEnergyActivation : Prop
  rateConstantExpression : Prop
  overpotentialDependence : Prop
  outerSphereMechanism : Prop

structure MarcusHushKineticsEvidence (M : MarcusHushKineticsPackage) where
  reorganizationEnergyClosed : M.reorganizationEnergy
  gibbsFreeEnergyActivationClosed : M.gibbsFreeEnergyActivation
  rateConstantExpressionClosed : M.rateConstantExpression
  overpotentialDependenceClosed : M.overpotentialDependence
  outerSphereMechanismClosed : M.outerSphereMechanism

def MarcusHushKineticsClosed (M : MarcusHushKineticsPackage) : Prop :=
  M.reorganizationEnergy ∧ M.gibbsFreeEnergyActivation ∧
  M.rateConstantExpression ∧ M.overpotentialDependence ∧
  M.outerSphereMechanism

theorem marcus_hush_kinetics_closed_from_evidence (M : MarcusHushKineticsPackage)
    (Ev : MarcusHushKineticsEvidence M) : MarcusHushKineticsClosed M := by
  exact And.intro Ev.reorganizationEnergyClosed
    (And.intro Ev.gibbsFreeEnergyActivationClosed
      (And.intro Ev.rateConstantExpressionClosed
        (And.intro Ev.overpotentialDependenceClosed
          Ev.outerSphereMechanismClosed)))

end ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean
end HautevilleHouse