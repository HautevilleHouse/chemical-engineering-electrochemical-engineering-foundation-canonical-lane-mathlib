import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean

structure MolecularOrbitalPackage where
  huckelApproximation : Prop
  homoEnergy : Prop
  lumoEnergy : Prop
  bandGap : Prop
  overlapIntegral : Prop

structure MolecularOrbitalEvidence (M : MolecularOrbitalPackage) where
  huckelApproximationClosed : M.huckelApproximation
  homoEnergyClosed : M.homoEnergy
  lumoEnergyClosed : M.lumoEnergy
  bandGapClosed : M.bandGap
  overlapIntegralClosed : M.overlapIntegral

def MolecularOrbitalClosed (M : MolecularOrbitalPackage) : Prop :=
  M.huckelApproximation ∧ M.homoEnergy ∧
  M.lumoEnergy ∧ M.bandGap ∧ M.overlapIntegral

theorem molecular_orbital_closed_from_evidence (M : MolecularOrbitalPackage)
    (E : MolecularOrbitalEvidence M) : MolecularOrbitalClosed M := by
  exact And.intro E.huckelApproximationClosed
    (And.intro E.homoEnergyClosed
      (And.intro E.lumoEnergyClosed
        (And.intro E.bandGapClosed E.overlapIntegralClosed)))

end ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean
end HautevilleHouse