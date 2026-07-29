import ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean.AdmissibleClass

/-!
# Nernst Equation Package
-/

namespace HautevilleHouse
namespace ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean

structure NernstEquationPackage (A : ElectrochemicalAdmissibleClass) where
  equilibriumPotential : Prop
  activityDependence : Prop
  temperatureDependence : Prop
  pHCorrection : Prop

structure NernstEquationEvidence (A : ElectrochemicalAdmissibleClass) (N : NernstEquationPackage A) where
  equilibriumPotentialClosed : N.equilibriumPotential
  activityDependenceClosed : N.activityDependence
  temperatureDependenceClosed : N.temperatureDependence
  pHCorrectionClosed : N.pHCorrection

def NernstEquationClosed (A : ElectrochemicalAdmissibleClass) (N : NernstEquationPackage A) : Prop :=
  N.equilibriumPotential ∧ N.activityDependence ∧
  N.temperatureDependence ∧ N.pHCorrection

theorem nernst_equation_closed_from_evidence
    (A : ElectrochemicalAdmissibleClass) (N : NernstEquationPackage A)
    (E : NernstEquationEvidence A N) : NernstEquationClosed A N := by
  exact And.intro E.equilibriumPotentialClosed
    (And.intro E.activityDependenceClosed
      (And.intro E.temperatureDependenceClosed E.pHCorrectionClosed))

end ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean
end HautevilleHouse
