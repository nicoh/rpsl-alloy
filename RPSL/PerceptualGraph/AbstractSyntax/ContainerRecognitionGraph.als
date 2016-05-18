module PerceptualGraph/AbstractSyntax/ContainerRecognitionGraph

open PerceptualGraph/AbstractSyntax/AbstractPerceptualGraph



one sig RedRecogGraph extends PerceptualGraph{}{
        components = RedContainRecog  + Kinect
        connections = outCloud ->inCloud
        compGraph = Kinect ->RedContainRecog 
}

one sig  inCloud extends Input {}{
        type=xyzRGB
}
one sig  outContainer extends Output {}{
        type=Container
}
one sig  outCloud extends Output {}{
        type=xyzRGB
}


one sig  xyzRGB extends Concept{}{
}

one sig  Container extends Concept{}{
}

one  sig Kinect  extends SensorComponent{}{
  input = none
  output = outCloud
 }

one sig RedContainRecog extends ProcessingComponent {}{
  input = inCloud
  output = outContainer
}