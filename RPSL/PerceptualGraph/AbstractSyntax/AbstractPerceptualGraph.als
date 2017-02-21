module PerceptualGraph/AbstractSyntax/AbstractPerceptualGraph

// a perceptual graph contains another one if it contains both its components and connections
pred  PerceptualGraph::contains(g: PerceptualGraph){
	g.components in this.components
	g.connections in this.connections
}
// the weight is the sum of its components
fun PerceptualGraph::getWeight():Int{
	sum c:this.components| c.weight
}

abstract sig PerceptualGraph{
	components: set Component,
	connections : set Output -> Input,
	compGraph : set Component -> Component
}{

	 // all Input and output in connections belongs to the components of the graph.
	all port:connections[Output] + connections.Input | port in components.(input+output)
	// connections between input and output only possible if type is the same
	all out : connections.Input | out.type = connections[out].type 

	
	// ensure that compGraph ( a convenience field ) relfects the actual IO connections
	all disj c1,c2 : components| c2 in compGraph[c1] <=> c2 in connections[c1.output].~input 
	
	no c:components| c in c.^compGraph // we don't want loops in our perceptual graph
	
    compGraph[Component]+ compGraph.Component in components // components in compgrah are actual components of the perceptual graph.
	
}



abstract sig Port {
	type:Concept
}

abstract sig Concept{}

abstract sig Input extends Port {}{
	this in Component.input 
}

abstract sig Output extends Port {}{
	this in Component.output 
}

abstract sig Component {
   input: disj set Input,
   output: disj set Output,
   weight: Int
}{
	weight in 1+2+3 
	this in PerceptualGraph.components
}

abstract sig SensorComponent extends Component {}{
 #(input) = 0 and #(output) > 0
 }

abstract sig ProcessingComponent extends Component {}{
  #(input) > 0 and #(output) > 0
}



run{#weight<6} for 5 but 5 Int
