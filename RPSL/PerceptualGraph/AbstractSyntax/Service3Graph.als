

module PerceptualGraph/AbstractSyntax/Service3Graph

open PerceptualGraph/AbstractSyntax/AbstractPerceptualGraph
open PerceptualGraph/AbstractSyntax/libs/Concepts
one sig Service3Graph extends PerceptualGraph{}{
        components = PlaneDetect + Kinect
        connections = outCloudSG3 -> inCloudSG3
        compGraph = Kinect -> PlaneDetect 
}

one sig  inCloudSG3 extends Input {}{
        type=xyzRGB
}
one sig  outPlaneSG3 extends Output {}{
        type=Plane
}
one sig  outCloudSG3 extends Output {}{
        type=xyzRGB
}

one  sig Kinect  extends SensorComponent{}{
  input = none
  output = outCloudSG3
 }

one sig PlaneDetect extends ProcessingComponent {}{
  input = inCloudSG3
  output = outPlaneSG3
}
