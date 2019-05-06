//
//  LabelManager.swift
//  Cosmonaut
//
//  Created by Christian Gomez on 5/4/19.
//  Copyright © 2019 Christian Gomez. All rights reserved.
//

import Foundation
import SpriteKit

class LabelManager{
    
    var scoreLabel: SKLabelNode
    var livesLabel: SKLabelNode
    var tapToStartLabel: SKLabelNode
    
    
    init() {
        
        scoreLabel = SKLabelNode(fontNamed: "Russian Dollmaker")
        livesLabel = SKLabelNode(fontNamed: "Russian Dollmaker")
        tapToStartLabel = SKLabelNode(fontNamed: "Russian Dollmaker")
        
        scoreLabel.text = "Score: 0"
        scoreLabel.fontSize = 70
        scoreLabel.fontColor = SKColor.white
        scoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        //scoreLabel.position = CGPoint(x: self.size.width*0.21,y: self.size.height*0.9)
        scoreLabel.zPosition = 100
        
        livesLabel.text = "Lives: 3"
        livesLabel.fontSize = 70
        livesLabel.fontColor = SKColor.white
        livesLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.right
        //livesLabel.position = CGPoint(x: self.size.width*0.80,y: self.size.height*0.9)
        livesLabel.zPosition = 100
        
        tapToStartLabel.text = "Tap To Begin"
        tapToStartLabel.fontSize = 100
        tapToStartLabel.fontColor = SKColor.white
        tapToStartLabel.zPosition = 1
        tapToStartLabel.alpha = 0
        
    }
    
    func updateScore(){
        self.scoreLabel.text = "Score: \(gameScore)"
    }
    
    func setHeightWidth(screenHeight:CGFloat,screenWidth:CGFloat){
        scoreLabel.position = CGPoint(x: screenWidth*0.21,y: screenHeight + scoreLabel.frame.size.height)
        livesLabel.position = CGPoint(x: screenWidth*0.80,y: screenHeight + livesLabel.frame.size.height)
        tapToStartLabel.position = CGPoint(x: screenWidth/2, y: screenHeight/2)

        
    }
    
    func getScoreLabel() -> SKLabelNode {
        return self.scoreLabel
    }
    
    func getLivesLabel() -> SKLabelNode{
        return self.livesLabel
    }
    
    func getTapToStartLabel() -> SKLabelNode{
        return self.tapToStartLabel
    }
    
    
}
