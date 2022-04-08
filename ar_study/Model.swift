//
//  Model.swift
//  ar_study
//
//  Created by Pedro Ganem on 07/04/22.
//

import UIKit
import RealityKit
import Combine

class Model {
    var modelName: String
    var image: UIImage
    var modelEntity: ModelEntity?
    
    private var cancellable: AnyCancellable? = nil
    
    init(modelName: String) {
        self.modelName = modelName
        self.image = UIImage(named: modelName)!
        let filename = modelName + ".usdz"
        self.cancellable = ModelEntity.loadModelAsync(named: filename)
            .sink(receiveCompletion: {loadCompletion in
                // Handle Errors
            },
                  receiveValue:  {modelEntity in
                // Get out modelEntity
                self.modelEntity = modelEntity
                print("DEBUG: successfully loaded modelEntity for modelName: \(self.modelName)")
            })
        
    }
}
