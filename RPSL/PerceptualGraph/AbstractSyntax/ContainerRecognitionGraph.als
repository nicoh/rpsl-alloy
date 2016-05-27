module PerceptualGraph/AbstractSyntax/ContainerRecognitionGraph

open PerceptualGraph/AbstractSyntax/AbstractPerceptualGraph
open PerceptualGraph/AbstractSyntax/libs/Concepts

one sig RedRecogGraph extends PerceptualGraph{}{
        components = RedContainRecog  
}

one sig  inCloud extends Input {}{
        type=xyzRGB
}

one sig  inPlane extends Input {}{
        type=Plane
}

one sig  outContainer extends Output {}{
        type=Container 
}
one sig  outCloud extends Output {}{
        type=xyzRGB
}

one sig RedContainRecog extends ProcessingComponent {}{
  input = inCloud + inPlane
  output = outContainer
}