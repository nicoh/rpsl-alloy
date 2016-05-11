module PerceptualGraph/ConcreteSyntax/LightningVLM


open util/ternary

abstract sig Bool{}
sig True,False extends Bool{}

// all the visible elements of the concrete syntax. 
abstract sig VisualElement{
color : Lightning_Color
}
// Symbols are entities with a given dimension, that may contain other visual elements
abstract sig Symbol extends VisualElement{
composedOf: seq VisualElement,
layout:Layout
//width:Int,
//height:

}




abstract sig Layout{}

one sig VERTICAL_LAYOUT extends Layout{
}

one sig HORIZONTAL_LAYOUT extends Layout{
}
// A shape is a symbol which main caracterisitc is the shape of its border.
abstract sig Shape extends Symbol{

}

// Connectors model connections between visual elements.
sig CONNECTOR extends VisualElement{
source :one VisualElement,
target:one VisualElement,
connectorLabel: seq univ
//width:Int
}{
this not in source +target
#connectorLabel=#(connectorLabel.elems)
}

// List of available images
sig INVISIBLE_CONTAINER extends Shape{
}
sig RECTANGLE extends Shape {
}
sig TRIANGLE extends Shape {
}
sig  ELLIPSE extends Shape {
}

sig  RHOMBUS extends Shape {
}
sig  CYLINDER extends Shape {
}
sig  ACTOR extends Shape {
}
sig  CLOUD extends Shape {
}
sig  HEXAGON extends Shape {
}

sig  DOUBLE_ELLIPSE extends Shape {
}

sig  IMAGE extends Symbol{
url :univ
}

//Texts are parts of visual elements but can't contain any other symbols
sig  TEXT extends VisualElement {
textLabel : seq univ,
isBold : Bool,
isItalic :Bool,
//fontSize:Int
}{
#textLabel=#(textLabel.elems)    
}

fact compositionSanity{
// a symbol can't be composed to one of its container
all s : Symbol | s not in s.^(composedOf.select13)

//a visual element can't compose more than one symbol.
all ve: VisualElement| #(ve.~(composedOf.select13))<2
}


// COLORS
abstract sig Lightning_Color{
}
one sig RED extends Lightning_Color{
}
one sig GREEN extends Lightning_Color{
}
one sig BLUE extends Lightning_Color{
}
one sig ORANGE extends Lightning_Color{
}
one sig YELLOW extends Lightning_Color{
}
one sig PURPLE extends Lightning_Color{
}
one sig BROWN extends Lightning_Color{
}
one sig BLACK extends Lightning_Color{
}
one sig GRAY extends Lightning_Color{
}
one sig WHITE extends Lightning_Color{
}
