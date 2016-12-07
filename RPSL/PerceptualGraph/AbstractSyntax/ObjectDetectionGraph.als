
module PerceptualGraph/AbstractSyntax/ObjectDetectionGraph

open PerceptualGraph/AbstractSyntax/AbstractPerceptualGraph
open PerceptualGraph/AbstractSyntax/libs/Concepts

one sig ObjDetGraph extends PerceptualGraph{}{
        components = ObjDet
 
} 

// This component and ObjDet can't compose alone one graph has they have no compatible ports.
//one sig  Clustering extends Component {}{
//        input=inCloudODG2+inPlaneODG2 
//        output=outBoundingBoxODG2
//}
//
//one sig  inCloudODG2 extends Input {}{
//        type=xyzRGB
//}
//
//one sig  inPlaneODG2 extends Input {}{
//        type=Plane
//}
//
//
//one sig  outBoundingBoxODG2 extends Output {}{
//        type=BoundingBox
//}
//

one sig ObjDet extends ProcessingComponent {}{
  input = inCloudODG + inPlaneODG
  output = outBoundingBoxODG
}


one sig  inCloudODG extends Input {}{
        type=xyzRGB
}

one sig  inPlaneODG extends Input {}{
        type=Plane
}

one sig  outBoundingBoxODG extends Output {}{
        type=BoundingBox
}


