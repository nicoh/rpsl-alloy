module FeatureModel/AbstractSyntax/PickAndPlace

open FeatureModel/AbstractSyntax/AbstractFeatureTree

one sig FTree extends FeatureTree{}{
   root = Application
}

one sig Application extends Feature{}{
		contain=ObRecognition + ObDetection + ServiceArea + CavRecognition + ContRecognition
        spec+excluded+required= none
}


one sig ObRecognition extends Feature{}{
 		required=ServiceArea+ObDetection
        spec+contain+excluded= none
}

one sig ObDetection extends Feature{}{
 		required=ServiceArea
        spec+contain+excluded= none
}

one sig ServiceArea extends Feature{}{
        required=none
        spec+contain+excluded= none
}
one sig CavRecognition extends Feature{}{
		required=ServiceArea+ObDetection
        spec+contain+excluded= none
}
one sig ContRecognition extends Feature{}{
		required=ServiceArea+ObDetection
        spec+contain+excluded= none
}


