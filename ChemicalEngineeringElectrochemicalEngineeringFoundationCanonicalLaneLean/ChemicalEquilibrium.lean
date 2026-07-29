import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean

structure ChemicalEquilibriumPackage where
  massActionLaw : Prop
  equilibriumComposition : Prop
  leChatelierPrinciple : Prop
  equilibriumConstantExpression : Prop
  temperatureDependence : Prop

structure ChemicalEquilibriumEvidence (E : ChemicalEquilibriumPackage) where
  massActionLawClosed : E.massActionLaw
  equilibriumCompositionClosed : E.equilibriumComposition
  leChatelierPrincipleClosed : E.leChatelierPrinciple
  equilibriumConstantExpressionClosed : E.equilibriumConstantExpression
  temperatureDependenceClosed : E.temperatureDependence

def ChemicalEquilibriumClosed (E : ChemicalEquilibriumPackage) : Prop :=
  E.massActionLaw ∧ E.equilibriumComposition ∧
  E.leChatelierPrinciple ∧ E.equilibriumConstantExpression ∧ E.temperatureDependence

theorem chemical_equilibrium_closed_from_evidence (E : ChemicalEquilibriumPackage)
    (Ev : ChemicalEquilibriumEvidence E) : ChemicalEquilibriumClosed E := by
  exact And.intro Ev.massActionLawClosed
    (And.intro Ev.equilibriumCompositionClosed
      (And.intro Ev.leChatelierPrincipleClosed
        (And.intro Ev.equilibriumConstantExpressionClosed
          Ev.temperatureDependenceClosed)))

end ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean
end HautevilleHouse