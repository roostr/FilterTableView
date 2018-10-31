//
//  MineralModel.swift
//  FilterTableViewWithButton
//
//  Created by G R-Titko on 10/30/18.
//  Copyright © 2018 GRT-Programs. All rights reserved.
//

import Foundation

import UIKit
import GameKit

struct MineralModel {
    let mainImage: UIImage
    let mineralType: String
    
    var minerals = [MineralModel]()
    
    init(mainImage: UIImage, mineralType: String) {
        self.mainImage = mainImage
        self.mineralType = mineralType
    }
    
    static func populateMinerals() -> [MineralModel] {
        var mineralCollection = [MineralModel]()
        
        for _ in 0..<10 {
            mineralCollection.append(MineralModel(mainImage: UIImage(named: "ANIMALS")!, mineralType:chooseRandomType()))
        }
        return mineralCollection
    }
    
    static func chooseRandomType() -> String {
        let mineralType = ["animal", "mineral", "thing"]
        var shuffledTypes = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: mineralType) as! [String]
        return shuffledTypes[0]
    }
}
