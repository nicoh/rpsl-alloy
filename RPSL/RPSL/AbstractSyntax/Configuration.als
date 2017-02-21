module RPSL/AbstractSyntax/Configuration


open RPSL/AbstractSyntax/ResolutionModel


one sig SuperGraph extends PerceptualGraph{
}{
	
	//no c : components| c.input not in connections[Output] // no components of the supergraph should have its input disconnected 
	components= compGraph[Component] + compGraph.Component  // components of the supergraph should have at least one IO connection 
	this.contains[Configuration.selectedGraph] // the supergraph contains all selected graphs
	components=Configuration.selectedGraph.@components	 // the supergraph's components are limited to those of the selected graphs
}
one sig Configuration{
	selectedFeatures: set Feature,
	selectedGraph: set PerceptualGraph,
}{
	all f:selectedFeatures | one p:PerceptualGraph| f->p in feature2Graph.mapping and p in selectedGraph //each selected feature there should be exactly one  perceptual graph mapped to that feature in the resolution model and selected in this configuration
	
	#selectedGraph = #selectedFeatures // the number of selected graph should correspond to the number of selected features
	no disj x,y:selectedFeatures | x.excluded=y // mutually exclusive features can't be selected at the same time
	selectedFeatures.required in selectedFeatures.~*(spec+contain) // features required by selected features should also be selected or have one of its children features selected.
	selectedFeatures.(contain+spec)=none // we only select leaf features
	
	
	 
}


run {  some  c:SuperGraph.components| c.input not in SuperGraph.connections[Output]}  for 10 but 5 Int

