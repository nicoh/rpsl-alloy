module RPSL/AbstractSyntax/ResolutionModel

open FeatureModel/AbstractSyntax/PickAndPlace
open PerceptualGraph/AbstractSyntax/ContainerRecognitionGraph
open PerceptualGraph/AbstractSyntax/CavityRecognitionGraph
open PerceptualGraph/AbstractSyntax/ObjectRecognitionGraph
open PerceptualGraph/AbstractSyntax/ObjectDetectionGraph
open PerceptualGraph/AbstractSyntax/Service1Graph
open PerceptualGraph/AbstractSyntax/Service2Graph
open PerceptualGraph/AbstractSyntax/Service3Graph


 
one sig feature2Graph{
	mapping: Feature ->PerceptualGraph
}{
	mapping = 
		ContRecognition -> RedRecogGraph  + 
		ServiceArea -> Service1Graph + ServiceArea -> Service2Graph + ServiceArea -> Service3Graph + 
		ObRecognition -> ObjRecogGraph + 
		ObDetection -> ObjDetGraph+ 
		CavRecognition -> CavityRecognitionGraph
}

