//
//  EnemySpawner.swift
//  Cosmonaut
//
//  Created by Christian Gomez on 5/4/19.
//  Copyright © 2019 Christian Gomez. All rights reserved.
//

import Foundation
import SpriteKit

class EnemySpawner{
    
    init() {
    }
    
    func random() -> CGFloat{
        return CGFloat(Float(arc4random())/0xFFFFFFFF)
    }
    
    func random(min:CGFloat,max: CGFloat) -> CGFloat{
        return random() * (max - min) + min
    }
    
    func getStartPoint(screenHeight: CGFloat, minX: CGFloat, maxX:CGFloat)->CGPoint{
        let randomXStart = random(min:minX, max:maxX)
        let startPoint = CGPoint(x: randomXStart, y: screenHeight * 1.2)
        return startPoint
    }
    
    func getEndPoint(screenHeight: CGFloat, minX: CGFloat, maxX:CGFloat)->CGPoint{
        let randomXEnd = random(min:minX, max:maxX)
        let endPoint = CGPoint(x:randomXEnd, y:-screenHeight * 0.2)
        return endPoint
    }
    
    
    
}
