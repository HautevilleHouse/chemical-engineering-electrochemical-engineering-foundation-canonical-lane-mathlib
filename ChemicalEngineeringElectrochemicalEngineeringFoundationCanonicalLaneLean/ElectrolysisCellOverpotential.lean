import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean

structure ElectrolysisCellOverpotentialPackage where
  anodicOverpotential : ℝ
  cathodicOverpotential : ℝ
  ohmicDrop : ℝ
  totalOverpotential : ℝ
  overpotentialRelationSatisfied : Prop
  resistance : ℝ
  current : ℝ
  resistancePositive : resistance > 0
  currentNonnegative : current ≥ 0

structure ElectrolysisCellOverpotentialEvidence (E : ElectrolysisCellOverpotentialPackage) where
  overpotentialRelationSatisfiedClosed : E.overpotentialRelationSatisfied
  totalOverpotentialFormula : E.totalOverpotential = E.anodicOverpotential + E.cathodicOverpotential + E.ohmicDrop
  ohmicDropFormula : E.ohmicDrop = E.current * E.resistance
  anodicOverpotentialPositive : E.anodicOverpotential > 0
  cathodicOverpotentialPositive : E.cathodicOverpotential > 0

def ElectrolysisCellOverpotentialClosed (E : ElectrolysisCellOverpotentialPackage) : Prop :=
  E.overpotentialRelationSatisfied ∧ (E.totalOverpotential = E.anodicOverpotential + E.cathodicOverpotential + E.ohmicDrop) ∧ (E.ohmicDrop = E.current * E.resistance) ∧ E.anodicOverpotential > 0 ∧ E.cathodicOverpotential > 0

theorem electrolysis_cell_overpotential_closed_from_evidence (E : ElectrolysisCellOverpotentialPackage) (Ev : ElectrolysisCellOverpotentialEvidence E) : ElectrolysisCellOverpotentialClosed E := by
  exact And.intro Ev.overpotentialRelationSatisfiedClosed (And.intro Ev.totalOverpotentialFormula (And.intro Ev.ohmicDropFormula (And.intro Ev.anodicOverpotentialPositive Ev.cathodicOverpotentialPositive)))

end ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean
end HautevilleHouse