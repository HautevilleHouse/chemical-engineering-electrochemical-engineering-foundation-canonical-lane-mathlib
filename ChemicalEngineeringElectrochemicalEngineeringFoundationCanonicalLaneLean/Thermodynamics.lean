import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean

structure ThermodynamicsPackage where
  gibbsFreeEnergy : Prop
  nernstEquation : Prop
  electrochemicalPotential : Prop
  entropyBalance : Prop
  equilibriumCondition : Prop

structure ThermodynamicsEvidence (T : ThermodynamicsPackage) where
  gibbsFreeEnergyClosed : T.gibbsFreeEnergy
  nernstEquationClosed : T.nernstEquation
  electrochemicalPotentialClosed : T.electrochemicalPotential
  entropyBalanceClosed : T.entropyBalance
  equilibriumConditionClosed : T.equilibriumCondition

def ThermodynamicsClosed (T : ThermodynamicsPackage) : Prop :=
  T.gibbsFreeEnergy ∧ T.nernstEquation ∧ T.electrochemicalPotential ∧ T.entropyBalance ∧ T.equilibriumCondition

theorem thermodynamics_closed_from_evidence (T : ThermodynamicsPackage) (E : ThermodynamicsEvidence T) : ThermodynamicsClosed T := by
  exact And.intro E.gibbsFreeEnergyClosed (And.intro E.nernstEquationClosed (And.intro E.electrochemicalPotentialClosed (And.intro E.entropyBalanceClosed E.equilibriumConditionClosed)))

end ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean
end HautevilleHouse