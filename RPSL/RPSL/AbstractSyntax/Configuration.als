module RPSL/AbstractSyntax/Configuration


open RPSL/AbstractSyntax/ResolutionModel


one sig SuperGraph extends PerceptualGraph{
}{
	
	no c : components| c.input not in connections[Output] //or c.output not in connections.Input
	no c:components | c in components and c not in feature2Graph.mapping[Configuration.selectedFeatures].@components 
	
	this.contains[Configuration.selectedGraph]
	components=Configuration.selectedGraph.@components	
}
one sig Configuration{
	selectedFeatures: set Feature,
	selectedGraph: set PerceptualGraph,
	

}{
	all f:selectedFeatures | one p:PerceptualGraph| f->p in feature2Graph.mapping and p in selectedGraph
	
	#selectedGraph = #selectedFeatures
	no disj x,y:selectedFeatures | x.excluded=y and y not in x.~*spec.*spec
	selectedFeatures.required in selectedFeatures.~*(spec+contain)
	selectedFeatures.(contain+spec)=none
	
	
	 
}

fact{
	ObRecognition in Configuration.selectedFeatures and some (SensorComponent & xyzRGB.~type.~output ) & SuperGraph.components
}
run {}  for 5 but 5 Int

