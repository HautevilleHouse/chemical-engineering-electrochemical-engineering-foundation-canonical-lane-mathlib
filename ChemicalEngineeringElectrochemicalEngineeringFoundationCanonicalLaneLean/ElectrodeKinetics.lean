import ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean.AdmissibleClass

/-!
# Electrode Kinetics Package
-/

namespace HautevilleHouse
namespace ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean

structure ElectrodeKineticsPackage (A : ElectrochemicalAdmissibleClass) where
  chargeTransferRate : Prop
  butlerVolmerEquation : Prop
  exchangeCurrentDensity : Prop
  massTransportLimitation : Prop

structure ElectrodeKineticsEvidence (A : ElectrochemicalAdmissibleClass) (K : ElectrodeKineticsPackage A) where
  chargeTransferRateClosed : K.chargeTransferRate
  butlerVolmerEquationClosed : K.butlerVolmerEquation
  exchangeCurrentDensityClosed : K.exchangeCurrentDensity
  massTransportLimitationClosed : K.massTransportLimitation

def ElectrodeKineticsClosed (A : ElectrochemicalAdmissibleClass) (K : ElectrodeKineticsPackage A) : Prop :=
  K.chargeTransferRate ∧ K.butlerVolmerEquation ∧
  K.exchangeCurrentDensity ∧ K.massTransportLimitation

theorem electrode_kinetics_closed_from_evidence
    (A : ElectrochemicalAdmissibleClass) (K : ElectrodeKineticsPackage A)
    (E : ElectrodeKineticsEvidence A K) : ElectrodeKineticsClosed A K := by
  exact And.intro E.chargeTransferRateClosed
    (And.intro E.butlerVolmerEquationClosed
      (And.intro E.exchangeCurrentDensityClosed E.massTransportLimitationClosed))

end ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean
end HautevilleHouse
