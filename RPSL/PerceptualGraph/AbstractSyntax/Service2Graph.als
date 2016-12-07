module PerceptualGraph/AbstractSyntax/Service2Graph

open PerceptualGraph/AbstractSyntax/AbstractPerceptualGraph
open PerceptualGraph/AbstractSyntax/libs/Concepts

one sig Service2Graph extends PerceptualGraph{}{
        components = PlaneDetect + Kinect
        connections = outCloudSG2 -> inCloudSG2
        compGraph = Kinect -> PlaneDetect 
}

one sig  inCloudSG2 extends Input {}{
        type=xyzRGB
}
one sig  outPlaneSG2 extends Output {}{
        type=Plane
}
one sig  outCloudSG2 extends Output {}{
        type=xyzRGB
}


one  sig Kinect  extends SensorComponent{}{
  input = none
  output = outCloudSG2
 }

one sig PlaneDetect extends ProcessingComponent {}{
  input = inCloudSG2
  output = outPlaneSG2
}
