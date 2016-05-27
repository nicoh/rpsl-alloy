module PerceptualGraph/AbstractSyntax/ObjectDetectionGraph

open PerceptualGraph/AbstractSyntax/AbstractPerceptualGraph

one sig ObjDetGraph extends PerceptualGraph{}{
        components = Clustering
}

one sig  inCloud extends Input {}{
        type=xyzRGB
}

one sig  inPlane extends Input {}{
        type=Plane
}

one sig  outBoundingBox extends Output {}{
        type=BoundingBox
}

one sig  xyzRGB extends Concept{}{
}

one sig  BoundingBox extends Concept{}{
}

one sig  Plane extends Concept{}{
}

one sig ObjDet extends ProcessingComponent {}{
  input = inCloud + inPlane
  output = outBoundingBox
}