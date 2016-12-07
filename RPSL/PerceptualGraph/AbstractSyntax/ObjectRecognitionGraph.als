
module PerceptualGraph/AbstractSyntax/ObjectRecognitionGraph

open PerceptualGraph/AbstractSyntax/AbstractPerceptualGraph
open PerceptualGraph/AbstractSyntax/libs/Concepts

one sig ObjRecogGraph extends PerceptualGraph{}{
        components = Classifier
}

one sig  inCloudORG extends Input {}{
        type=xyzRGB
}

one sig inBoundingBoxORG extends Input {}{
        type=BoundingBox
}

one sig  outObjectORG extends Output {}{
        type=Object
}


one sig Classifier extends ProcessingComponent {}{
  input = inBoundingBoxORG + inCloudORG
  output = outObjectORG
}