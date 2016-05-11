module PerceptualGraph/AbstractSyntax/ASM



lone sig PerceptualGraph{
	components: set Component,
	connections : Output -> Input,
	compGraph : Component -> Component
}{
	 // all Input and output in connections belongs to the components of the graph.
	all port:connections[Output] + connections.Input | port in components.(input+output)
	// connections between input and output only possible if type is the same
	all out : connections.Input | out.type = connections[out].type 
 
	compGraph[Component]+compGraph.Component = components
	all c1,c2 : components| c2 in compGraph[c1] <=> c2 in connections[c1.output].~input 
	//acyclic check 
	no c:components| c in c.^compGraph
	
	some c : components | c.*( ~compGraph+ compGraph)=components 
	
}



abstract sig Port {
	type:Concept
}

abstract sig Concept{}

sig Input extends Port {}{
	this in Component.input 
}

sig Output extends Port {}{
	this in Component.output 
}

abstract sig Component {
   input: disj set Input,
   output: disj set Output,
}{
	
	this in PerceptualGraph.components
}

sig SensorComponent extends Component {}{
 #(input) = 0 and #(output) > 0
 }

sig ProcessingComponent extends Component {}{
  #(input) > 0 and #(output) > 0
}




run {some SensorComponent and some ProcessingComponent} for 10