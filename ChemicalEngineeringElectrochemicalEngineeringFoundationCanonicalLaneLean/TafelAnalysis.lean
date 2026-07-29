import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean

structure TafelAnalysisPackage where
  tafelEquation : Prop
  exchangeCurrentFromIntercept : Prop
  chargeTransferCoefficientFromSlope : Prop
  multistepMechanism : Prop
  massTransportCorrection : Prop

structure TafelAnalysisEvidence (T : TafelAnalysisPackage) where
  tafelEquationClosed : T.tafelEquation
  exchangeCurrentFromInterceptClosed : T.exchangeCurrentFromIntercept
  chargeTransferCoefficientFromSlopeClosed : T.chargeTransferCoefficientFromSlope
  multistepMechanismClosed : T.multistepMechanism
  massTransportCorrectionClosed : T.massTransportCorrection

def TafelAnalysisClosed (T : TafelAnalysisPackage) : Prop :=
  T.tafelEquation ∧ T.exchangeCurrentFromIntercept ∧
  T.chargeTransferCoefficientFromSlope ∧ T.multistepMechanism ∧
  T.massTransportCorrection

theorem tafel_analysis_closed_from_evidence (T : TafelAnalysisPackage)
    (Ev : TafelAnalysisEvidence T) : TafelAnalysisClosed T := by
  exact And.intro Ev.tafelEquationClosed
    (And.intro Ev.exchangeCurrentFromInterceptClosed
      (And.intro Ev.chargeTransferCoefficientFromSlopeClosed
        (And.intro Ev.multistepMechanismClosed
          Ev.massTransportCorrectionClosed)))

end ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean
end HautevilleHouse