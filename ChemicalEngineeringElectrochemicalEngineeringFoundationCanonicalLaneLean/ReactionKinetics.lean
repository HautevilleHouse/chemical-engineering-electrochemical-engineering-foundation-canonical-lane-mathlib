import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean

structure ButlerVolmerPackage where
  exchangeCurrentDensity : Prop
  chargeTransferCoefficient : Prop
  overpotential : Prop
  currentDensity : Prop
  anodicBranch : Prop
  cathodicBranch : Prop

structure ButlerVolmerEvidence (B : ButlerVolmerPackage) where
  exchangeCurrentDensityClosed : B.exchangeCurrentDensity
  chargeTransferCoefficientClosed : B.chargeTransferCoefficient
  overpotentialClosed : B.overpotential
  currentDensityClosed : B.currentDensity
  anodicBranchClosed : B.anodicBranch
  cathodicBranchClosed : B.cathodicBranch

def ButlerVolmerClosed (B : ButlerVolmerPackage) : Prop :=
  B.exchangeCurrentDensity ∧ B.chargeTransferCoefficient ∧
  B.overpotential ∧ B.currentDensity ∧
  B.anodicBranch ∧ B.cathodicBranch

theorem butler_volmer_closed_from_evidence (B : ButlerVolmerPackage)
    (E : ButlerVolmerEvidence B) : ButlerVolmerClosed B := by
  exact And.intro E.exchangeCurrentDensityClosed
    (And.intro E.chargeTransferCoefficientClosed
      (And.intro E.overpotentialClosed
        (And.intro E.currentDensityClosed
          (And.intro E.anodicBranchClosed E.cathodicBranchClosed))))

end ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean
end HautevilleHouse