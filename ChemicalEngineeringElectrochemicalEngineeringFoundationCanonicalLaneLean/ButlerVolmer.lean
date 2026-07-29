import ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean.ElectrodeKinetics

/-!
# Butler-Volmer Kinetics Package
-/

namespace HautevilleHouse
namespace ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean

structure ButlerVolmerPackage (A : ElectrochemicalAdmissibleClass)
    (K : ElectrodeKineticsPackage A) where
  anodicBranch : Prop
  cathodicBranch : Prop
  overpotentialRelation : Prop
  symmetryFactor : Prop

structure ButlerVolmerEvidence (A : ElectrochemicalAdmissibleClass)
    (K : ElectrodeKineticsPackage A) (B : ButlerVolmerPackage A K) where
  anodicBranchClosed : B.anodicBranch
  cathodicBranchClosed : B.cathodicBranch
  overpotentialRelationClosed : B.overpotentialRelation
  symmetryFactorClosed : B.symmetryFactor

def ButlerVolmerClosed (A : ElectrochemicalAdmissibleClass)
    (K : ElectrodeKineticsPackage A) (B : ButlerVolmerPackage A K) : Prop :=
  B.anodicBranch ∧ B.cathodicBranch ∧
  B.overpotentialRelation ∧ B.symmetryFactor

theorem butler_volmer_closed_from_evidence
    (A : ElectrochemicalAdmissibleClass) (K : ElectrodeKineticsPackage A)
    (B : ButlerVolmerPackage A K) (E : ButlerVolmerEvidence A K B) :
    ButlerVolmerClosed A K B := by
  exact And.intro E.anodicBranchClosed
    (And.intro E.cathodicBranchClosed
      (And.intro E.overpotentialRelationClosed E.symmetryFactorClosed))

end ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean
end HautevilleHouse
