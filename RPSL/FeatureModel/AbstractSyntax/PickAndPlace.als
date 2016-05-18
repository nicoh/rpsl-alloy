module FeatureModel/AbstractSyntax/PickAndPlace

open FeatureModel/AbstractSyntax/AbstractFeatureTree

one sig FTree extends FeatureTree{}{
   root = Application
}

one sig Application extends Feature{}{
        spec= none
        contain=ObRecognition + ObDetection + ServiceArea + CavRecognition + ContRecognition
        excluded=none
        required=none
}


one sig ObRecognition extends Feature{}{
        spec= none
        contain=none
        excluded=none
        required=none
}

one sig ObDetection extends Feature{}{
        spec= none
        contain=none
        excluded=none
        required=none
}

one sig ServiceArea extends Feature{}{
        spec= none
        contain=none
        excluded=none
        required=none
}
one sig CavRecognition extends Feature{}{
        spec= none
        contain=none
        excluded=none
        required=none
}
one sig ContRecognition extends Feature{}{
        spec= none
        contain=none
        excluded=none
        required=none
}


