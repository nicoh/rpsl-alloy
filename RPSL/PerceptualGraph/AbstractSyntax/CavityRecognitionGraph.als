module PerceptualGraph/AbstractSyntax/CavityRecognitionGraph

open PerceptualGraph/AbstractSyntax/AbstractPerceptualGraph
open PerceptualGraph/AbstractSyntax/libs/Concepts

one sig CavityRecognitionGraph extends PerceptualGraph{}{
        components = CavityRecog
}

one sig  inCloudCR extends Input {}{
        type=xyzRGB
}

one sig  inPlaneCR extends Input {}{
        type=Plane
}

one sig  outCavityCR extends Output {}{
        type=Cavity
}



one sig CavityRecog extends ProcessingComponent {}{
  input = inCloudCR + inPlaneCR
  output = outCavityCR
}
