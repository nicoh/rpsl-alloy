

module PerceptualGraph/AbstractSyntax/Service1Graph

open PerceptualGraph/AbstractSyntax/AbstractPerceptualGraph
open PerceptualGraph/AbstractSyntax/libs/Concepts

one sig Service1Graph extends PerceptualGraph{}{
        components = PlaneDetect + Kinect
        connections = outCloudSG1 -> inCloudSG1
        compGraph = Kinect -> PlaneDetect 
}

one sig  inCloudSG1 extends Input {}{
        type=xyzRGB
}
one sig  outPlaneSG1 extends Output {}{
        type=Plane
}
one sig  outCloudSG1 extends Output {}{
        type=xyzRGB
}


one  sig Kinect  extends SensorComponent{}{
  input = none
  output = outCloudSG1
 }

one sig PlaneDetect extends ProcessingComponent {}{
  input = inCloudSG1
  output = outPlaneSG1
}
