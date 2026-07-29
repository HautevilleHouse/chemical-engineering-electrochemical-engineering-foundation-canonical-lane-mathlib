import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean

structure DoubleLayerTheoryPackage where
  helmholtzModel : Prop
  gouyChapmanModel : Prop
  sternModel : Prop
  capacitanceRelationship : Prop
  potentialDistribution : Prop

structure DoubleLayerTheoryEvidence (D : DoubleLayerTheoryPackage) where
  helmholtzModelClosed : D.helmholtzModel
  gouyChapmanModelClosed : D.gouyChapmanModel
  sternModelClosed : D.sternModel
  capacitanceRelationshipClosed : D.capacitanceRelationship
  potentialDistributionClosed : D.potentialDistribution

def DoubleLayerTheoryClosed (D : DoubleLayerTheoryPackage) : Prop :=
  D.helmholtzModel ∧ D.gouyChapmanModel ∧
  D.sternModel ∧ D.capacitanceRelationship ∧
  D.potentialDistribution

theorem double_layer_theory_closed_from_evidence (D : DoubleLayerTheoryPackage)
    (Ev : DoubleLayerTheoryEvidence D) : DoubleLayerTheoryClosed D := by
  exact And.intro Ev.helmholtzModelClosed
    (And.intro Ev.gouyChapmanModelClosed
      (And.intro Ev.sternModelClosed
        (And.intro Ev.capacitanceRelationshipClosed
          Ev.potentialDistributionClosed)))

end ChemicalEngineeringElectrochemicalEngineeringFoundationCanonicalLaneLean
end HautevilleHouse