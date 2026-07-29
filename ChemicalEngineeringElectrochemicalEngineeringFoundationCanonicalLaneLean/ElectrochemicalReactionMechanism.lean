import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean

structure ElectrochemicalReactionMechanismPackage where
  stepCount : ℕ
  rateConstants : List ℝ
  adsorptionEnergies : List ℝ
  freeEnergyProfile : List ℝ
  rateDeterminingStep : ℕ
  mechanismValid : Prop
  stepCountPositive : stepCount > 0

structure ElectrochemicalReactionMechanismEvidence (E : ElectrochemicalReactionMechanismPackage) where
  mechanismValidClosed : E.mechanismValid
  freeEnergyProfileLength : List.length E.freeEnergyProfile = E.stepCount
  rateDeterminingStepInBounds : E.rateDeterminingStep < E.stepCount
  freeEnergyDifferencesCorrect : ∀ (i : ℕ), i < E.stepCount - 1 → E.freeEnergyProfile.get? (i+1) = (E.freeEnergyProfile.get? i).map (λ x => x + E.adsorptionEnergies.get? i)

def ElectrochemicalReactionMechanismClosed (E : ElectrochemicalReactionMechanismPackage) : Prop :=
  E.mechanismValid ∧ (List.length E.freeEnergyProfile = E.stepCount) ∧ (E.rateDeterminingStep < E.stepCount) ∧ (∀ (i : ℕ), i < E.stepCount - 1 → E.freeEnergyProfile.get? (i+1) = (E.freeEnergyProfile.get? i).map (λ x => x + E.adsorptionEnergies.get? i))

theorem electrochemical_reaction_mechanism_closed_from_evidence (E : ElectrochemicalReactionMechanismPackage) (Ev : ElectrochemicalReactionMechanismEvidence E) : ElectrochemicalReactionMechanismClosed E := by
  exact And.intro Ev.mechanismValidClosed (And.intro Ev.freeEnergyProfileLength (And.intro Ev.rateDeterminingStepInBounds Ev.freeEnergyDifferencesCorrect))

end ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean
end HautevilleHouse