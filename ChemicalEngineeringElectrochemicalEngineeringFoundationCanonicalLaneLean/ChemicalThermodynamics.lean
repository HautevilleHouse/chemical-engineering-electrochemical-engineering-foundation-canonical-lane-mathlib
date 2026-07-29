import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean

structure ChemicalThermodynamicsPackage where
  gibbsFreeEnergy : Prop
  enthalpy : Prop
  entropy : Prop
  equilibriumConstant : Prop
  reactionQuotient : Prop
  vanHoffEquation : Prop

structure ChemicalThermodynamicsEvidence (T : ChemicalThermodynamicsPackage) where
  gibbsFreeEnergyClosed : T.gibbsFreeEnergy
  enthalpyClosed : T.enthalpy
  entropyClosed : T.entropy
  equilibriumConstantClosed : T.equilibriumConstant
  reactionQuotientClosed : T.reactionQuotient
  vanHoffEquationClosed : T.vanHoffEquation

def ChemicalThermodynamicsClosed (T : ChemicalThermodynamicsPackage) : Prop :=
  T.gibbsFreeEnergy ∧ T.enthalpy ∧ T.entropy ∧
  T.equilibriumConstant ∧ T.reactionQuotient ∧ T.vanHoffEquation

theorem chemical_thermodynamics_closed_from_evidence (T : ChemicalThermodynamicsPackage)
    (E : ChemicalThermodynamicsEvidence T) : ChemicalThermodynamicsClosed T := by
  exact And.intro E.gibbsFreeEnergyClosed
    (And.intro E.enthalpyClosed
      (And.intro E.entropyClosed
        (And.intro E.equilibriumConstantClosed
          (And.intro E.reactionQuotientClosed E.vanHoffEquationClosed))))

end ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean
end HautevilleHouse