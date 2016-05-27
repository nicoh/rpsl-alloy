module PerceptualGraph/AbstractSyntax/CavityRecognitionGraph

open PerceptualGraph/AbstractSyntax/AbstractPerceptualGraph
open PerceptualGraph/AbstractSyntax/libs/Concepts

one sig CavityRecognitionGraph extends PerceptualGraph{}{
        components = CavityRecog
}

one sig  inCloud extends Input {}{
        type=xyzRGB
}

one sig  inPlane extends Input {}{
        type=Plane
}

one sig  outCavity extends Output {}{
        type=Cavity
}
one sig  outCloud extends Output {}{
        type=xyzRGB
}

one sig CavityRecog extends ProcessingComponent {}{
  input = inCloud + inPlane
  output = outCavity
}