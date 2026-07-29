import ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean.GateLemmas
import ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean

def ConstrainedElectrochemicalClosure (A : ElectrochemicalAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_electrochemical_endgame (A : ElectrochemicalAdmissibleClass) :
    ConstrainedElectrochemicalClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean
end HautevilleHouse
