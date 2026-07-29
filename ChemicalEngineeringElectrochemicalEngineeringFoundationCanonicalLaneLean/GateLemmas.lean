import ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean

def gateClosed (A : ElectrochemicalAdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : ElectrochemicalAdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean
end HautevilleHouse
