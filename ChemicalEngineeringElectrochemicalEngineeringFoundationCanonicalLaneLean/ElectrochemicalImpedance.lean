import ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean.AdmissibleClass

/-!
# Electrochemical Impedance Spectroscopy Package
-/

namespace HautevilleHouse
namespace ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean

structure ElectrochemicalImpedancePackage (A : ElectrochemicalAdmissibleClass) where
  frequencyResponse : Prop
  equivalentCircuitModel : Prop
  chargeTransferResistance : Prop
  doubleLayerCapacitance : Prop

structure ElectrochemicalImpedanceEvidence (A : ElectrochemicalAdmissibleClass)
    (E : ElectrochemicalImpedancePackage A) where
  frequencyResponseClosed : E.frequencyResponse
  equivalentCircuitModelClosed : E.equivalentCircuitModel
  chargeTransferResistanceClosed : E.chargeTransferResistance
  doubleLayerCapacitanceClosed : E.doubleLayerCapacitance

def ElectrochemicalImpedanceClosed (A : ElectrochemicalAdmissibleClass)
    (E : ElectrochemicalImpedancePackage A) : Prop :=
  E.frequencyResponse ∧ E.equivalentCircuitModel ∧
  E.chargeTransferResistance ∧ E.doubleLayerCapacitance

theorem electrochemical_impedance_closed_from_evidence
    (A : ElectrochemicalAdmissibleClass) (E : ElectrochemicalImpedancePackage A)
    (Ev : ElectrochemicalImpedanceEvidence A E) : ElectrochemicalImpedanceClosed A E := by
  exact And.intro Ev.frequencyResponseClosed
    (And.intro Ev.equivalentCircuitModelClosed
      (And.intro Ev.chargeTransferResistanceClosed Ev.doubleLayerCapacitanceClosed))

end ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean
end HautevilleHouse
