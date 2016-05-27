module PerceptualGraph/AbstractSyntax/ObjectDetectionGraph

open PerceptualGraph/AbstractSyntax/AbstractPerceptualGraph
open PerceptualGraph/AbstractSyntax/libs/Concepts

one sig ObjDetGraph extends PerceptualGraph{}{
        components = Clustering
} 


one sig  Clustering extends Component {}{
        input=inCloud+inPlane 
        output=outBoundingBox
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


one sig ObjDet extends ProcessingComponent {}{
  input = inCloud + inPlane
  output = outBoundingBox
}