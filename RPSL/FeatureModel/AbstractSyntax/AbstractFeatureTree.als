module FeatureModel/AbstractSyntax/AbstractFeatureTree

//FEATURE TREE

abstract sig FeatureTree{
	root: Feature
}{
	root.~(contain+spec)=none // no incoming edges
}

abstract sig Feature{
	spec: lone Feature,
	contain: set Feature,
	excluded: set Feature, 
	required: set Feature

}{

	some contain implies no spec  
	some spec implies no contain
	let rel= (@spec+@contain){ // rel is the set of all edges composing the feature tree
		this not in this.^rel // prevent loops in the feature tree
		this.~*rel & required.@excluded =none // given a feature f, features required by f can't exclude f and f's parents 
		one (this.*~rel & FeatureTree.root) // there's only one root feature in the parents of a given feature.
		lone (this.~@contain + this.~@spec )// any feature has at most one parent.
		excluded & required = none // a feature can't exclude and require the same feature
		
    	excluded & this.*rel=none // a feature can't exclude itself or its children
    	excluded & this.*~rel=none // a feature can't exclude itself or its parent
    	required & this.*rel=none // a feature can't require itself or its children
    	required & this.*~rel=none // a feature can't require itself or its parent
		no disj f1,f2:FeatureTree | this in f1.root.*rel and ((excluded+required) & f2.root.*rel) !=none // features of one feature tree can't exclude or require features of another feature tree.
		all x: excluded+required | some f:Feature |  some disj f2,f3 :Feature | f2+f3 in f.@contain and (this+x) in (f2+f3).*rel and (this & f2.*rel) +(x & f3.*rel) =none // a feature can require or exclude another one only if both have ancestors which are  (or are themselves) different alternatives of a same containment
		// for a given feature "this", let x be the set of excluded and required feature. We don't want another feature f that is not an ancestor of this but which is an specialisation alternative of an ancestor of this and an ancestor of x.  
		all x:excluded+required | no f:Feature | f not in this.*~rel and  one f.~@spec and f.~@spec in this.*~rel and x in f.*rel // required and excluded features should be in the same specialisation branch.
	} 
}



run{} for 10