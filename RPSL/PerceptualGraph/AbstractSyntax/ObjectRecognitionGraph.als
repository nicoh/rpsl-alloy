module PerceptualGraph/AbstractSyntax/ObjectRecognitionGraph

open PerceptualGraph/AbstractSyntax/AbstractPerceptualGraph
open PerceptualGraph/AbstractSyntax/libs/Concepts

one sig ObjRecogGraph extends PerceptualGraph{}{
        components = Classifier
        //connections = outCloud ->inCloud
        //compGraph = Kinect ->RedContainRecog 
}

one sig  inCloud extends Input {}{
        type=xyzRGB
}

one sig inBoundingBox extends Input {}{
        type=BoundingBox
}

one sig  outObject extends Output {}{
        type=Object
}

one sig  outCloud extends Output {}{
        type=xyzRGB
}

one sig Classifier extends ProcessingComponent {}{
  input = inBoundingBox + inCloud
  output = outObject
}