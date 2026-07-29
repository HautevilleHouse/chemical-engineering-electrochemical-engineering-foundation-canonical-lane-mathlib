import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean

structure ElectrodeKineticsPackage where
  butlerVolmerEquation : Prop
  chargeTransferCoefficient : Prop
  exchangeCurrentDensity : Prop
  overpotentialDefined : Prop
  rateExpression : Prop

structure ElectrodeKineticsEvidence (E : ElectrodeKineticsPackage) where
  butlerVolmerEquationClosed : E.butlerVolmerEquation
  chargeTransferCoefficientClosed : E.chargeTransferCoefficient
  exchangeCurrentDensityClosed : E.exchangeCurrentDensity
  overpotentialDefinedClosed : E.overpotentialDefined
  rateExpressionClosed : E.rateExpression

def ElectrodeKineticsClosed (E : ElectrodeKineticsPackage) : Prop :=
  E.butlerVolmerEquation ∧ E.chargeTransferCoefficient ∧
  E.exchangeCurrentDensity ∧ E.overpotentialDefined ∧ E.rateExpression

theorem electrode_kinetics_closed_from_evidence (E : ElectrodeKineticsPackage)
    (Ev : ElectrodeKineticsEvidence E) : ElectrodeKineticsClosed E := by
  exact And.intro Ev.butlerVolmerEquationClosed
    (And.intro Ev.chargeTransferCoefficientClosed
      (And.intro Ev.exchangeCurrentDensityClosed
        (And.intro Ev.overpotentialDefinedClosed Ev.rateExpressionClosed)))

end ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean
end HautevilleHouse
