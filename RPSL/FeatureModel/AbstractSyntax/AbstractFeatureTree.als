module FeatureModel/AbstractSyntax/AbstractFeatureTree

//FEATURE TREE

abstract sig FeatureTree{
	root: Feature
}{
	root.~(contain+spec)=none
}

abstract sig Feature{
	spec: set Feature,
	contain: set Feature,
	excluded: set Feature, 
	required: set Feature

}{

	no spec or #spec > 1 
	some contain implies no spec 
	some spec implies no contain
	let rel= (@spec+@contain){
		this not in this.^rel
		this.~*rel & required.@excluded =none

	//	//excluded not in this.*rel.@required +this.*~rel.@required
		one (this.*~rel & FeatureTree.root)
		contain & spec =none
		lone (this.~@contain + this.~@spec )
		contain & required = none
		excluded & required = none
		spec & required = none
		contain & excluded =none
		spec & excluded =none
		spec & contain =none
    	excluded & this.*rel=none
    	excluded & this.*~rel=none
    	required & this.*rel=none
    	required & this.*~rel=none
		no disj f1,f2:FeatureTree | this in f1.root.*rel and ((excluded+required) & f2.root.*rel) !=none
		// cannot exclude or require in same containment
		all x: excluded+required | some f:Feature |  some disj f2,f3 :Feature | f2+f3 in f.@contain and (this+x) in (f2+f3).*rel and (this & f2.*rel) +(x & f3.*rel) =none 
		(excluded + required) & this.~@spec.*rel =none
	} 
}



run{} for 10