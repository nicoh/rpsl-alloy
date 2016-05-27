
module PerceptualGraph/AbstractSyntax/Service2Graph

open PerceptualGraph/AbstractSyntax/AbstractPerceptualGraph

one sig Service3Graph extends PerceptualGraph{}{
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

one sig  xyzRGB extends Concept{}{
}

one sig  Plane extends Concept{}{
}

one  sig Kinect  extends SensorComponent{}{
  input = none
  output = outCloud
 }

one sig PlaneDetect extends ProcessingComponent {}{
  input = inCloud
  output = outPlane
}

