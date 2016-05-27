module PerceptualGraph/AbstractSyntax/ContainerRecognitionGraph

open PerceptualGraph/AbstractSyntax/AbstractPerceptualGraph

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

one sig  xyzRGB extends Concept{}{
}

one sig  Plane extends Concept{}{
}

one sig RedContainRecog extends ProcessingComponent {}{
  input = inCloud + inPlane
  output = outContainer
}