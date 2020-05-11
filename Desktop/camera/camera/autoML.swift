//
//  autoML.swift
//  camera
//
//  Created by Kenneth Aguilar on 5/10/20.
//  Copyright © 2020 StudentDevs. All rights reserved.
//

import Foundation
import Firebase

class autoML {
    
    var labeler : VisionImageLabeler?
    
    func setupModel(){
        //sets up Remote Model
        let remoteModel = AutoMLRemoteModel(
            name: "Aurebesh"  // The name you assigned in the Firebase console.
        )
        //conditiions to download Model
        let downloadConditions = ModelDownloadConditions(
          allowsCellularAccess: true,
          allowsBackgroundDownloading: true
        )

        let downloadProgress = ModelManager.modelManager().download(
          remoteModel,
          conditions: downloadConditions
        )
        
        
        //sets up Local Model
        guard let manifestPath = Bundle.main.path(
            forResource: "manifest",
            ofType: "json",
            inDirectory: "model"
        ) else { return  }
        
        let localModel = AutoMLLocalModel(manifestPath: manifestPath)
        
        //sets up local based Labeller
//        let options = VisionOnDeviceAutoMLImageLabelerOptions(localModel: localModel)
//        options.confidenceThreshold = 0  // Evaluate your model in the Firebase console
//                                         // to determine an appropriate value.
//        let labeler = Vision.vision().onDeviceAutoMLImageLabeler(options: options)
        
        //sets up labeler depending which model is available
        var options: VisionOnDeviceAutoMLImageLabelerOptions?
        if (ModelManager.modelManager().isModelDownloaded(remoteModel)) {
          options = VisionOnDeviceAutoMLImageLabelerOptions(remoteModel: remoteModel)
        } else {
          options = VisionOnDeviceAutoMLImageLabelerOptions(localModel: localModel)
        }
        options!.confidenceThreshold = 80  // Evaluate your model in the Firebase console
                                         // to determine an appropriate value.
        labeler = Vision.vision().onDeviceAutoMLImageLabeler(options: options!)
    }
    func setImage(uiImage : UIImage)->VisionImage{
        let image = VisionImage(image: uiImage)
        return image
    }
    func runLabeler(image : VisionImage){
        labeler!.process(image) { labels, error in
            guard error == nil, let labels = labels else { return }

            // Task succeeded.
            // ...
            for label in labels {
                let labelText = label.text
                let confidence = label.confidence
            }
            
            
        }
    }
    

    
}
