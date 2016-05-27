module RPSL/AbstractSyntax/Configuration

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

one sig SuperGraph extends PerceptualGraph{
}{
	all f:Configuration.selectedFeatures | one p:PerceptualGraph| f->p in feature2Graph.mapping and this.contains[p] and p in Configuration.selectedGraph
	no c : components| c.input not in connections[Output] or c.output not in connections.Input
	
}
one sig Configuration{
	selectedFeatures: set Feature,
	selectedGraph: set PerceptualGraph,
	

}{
	#selectedGraph = #selectedFeatures
	no disj x,y:selectedFeatures | x.excluded=y and y not in x.~*spec.*spec
	selectedFeatures.required in selectedFeatures.~*(spec+contain)
	selectedFeatures.(contain+spec)=none
	 
}

run {} for 20

