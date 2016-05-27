

module PerceptualGraph/AbstractSyntax/Service1Graph

open PerceptualGraph/AbstractSyntax/AbstractPerceptualGraph
open PerceptualGraph/AbstractSyntax/libs/Concepts

one sig Service1Graph extends PerceptualGraph{}{
        components = PlaneDetect + Kinect
        connections = outCloud -> inCloud
        compGraph = Kinect -> PlaneDetect 
}

one sig  inCloud extends Input {}{
        type=xyzRGB
}
one sig  outPlane extends Output {}{
        type=Plane
}
one sig  outCloud extends Output {}{
        type=xyzRGB
}


one  sig Kinect  extends SensorComponent{}{
  input = none
  output = outCloud
 }

one sig PlaneDetect extends ProcessingComponent {}{
  input = inCloud
  output = outPlane
}

