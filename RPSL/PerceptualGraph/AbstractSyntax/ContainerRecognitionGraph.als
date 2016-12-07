
module PerceptualGraph/AbstractSyntax/ContainerRecognitionGraph

open PerceptualGraph/AbstractSyntax/AbstractPerceptualGraph
open PerceptualGraph/AbstractSyntax/libs/Concepts

one sig RedRecogGraph extends PerceptualGraph{}{
        components = RedContainRecog  
}

one sig  inCloudRRG extends Input {}{
        type=xyzRGB
}

one sig  inPlaneRRG extends Input {}{
        type=Plane
}

one sig  outContainerRRG extends Output {}{
        type=Container 
}


one sig RedContainRecog extends ProcessingComponent {}{
  input = inCloudRRG + inPlaneRRG
  output = outContainerRRG
}

run{} for 3