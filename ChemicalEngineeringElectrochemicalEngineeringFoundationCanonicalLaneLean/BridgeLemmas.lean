import ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean

def bridgeClosed (A : ElectrochemicalAdmissibleClass) : Prop :=
  ElectrochemicalWitnessClosed A.object

theorem bridge_from_admissible_class (A : ElectrochemicalAdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean
end HautevilleHouse
