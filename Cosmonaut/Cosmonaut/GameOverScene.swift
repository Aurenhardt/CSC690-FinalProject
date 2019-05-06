//
//  GameOverScene.swift
//  Cosmonaut
//
//  Created by Christian Gomez on 5/4/19.
//  Copyright © 2019 Christian Gomez. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class GameOverScene: SKScene {

    let restartLabel = SKLabelNode(fontNamed: "Russian Dollmaker")
    
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed:"background")
        background.position = CGPoint(x:self.size.width/2, y:self.size.height/2)
        self.addChild(background)
        
        let gameOverLabel = SKLabelNode(fontNamed: "Russian Dollmaker")
        gameOverLabel.text = "Game Over"
        gameOverLabel.fontSize = 190
        gameOverLabel.fontColor = SKColor.white
        gameOverLabel.position = CGPoint(x:self.size.width*0.5, y:self.size.height*0.7)
        gameOverLabel.zPosition = 1
        self.addChild(gameOverLabel)
        
        let scoreLabel = SKLabelNode(fontNamed: "Russian Dollmaker")
        scoreLabel.text = "Score: \(gameScore)"
        scoreLabel.fontSize = 125
        scoreLabel.fontColor = SKColor.white
        scoreLabel.position = CGPoint(x:self.size.width/2,y:self.size.height*0.5)
        scoreLabel.zPosition = 1
        self.addChild(scoreLabel)
        
        
        var highScoreNumber = defaults.integer(forKey: "highScoreSaved")
        print(highScoreNumber)
        print(gameScore)
        
        if gameScore>highScoreNumber{
            highScoreNumber = gameScore
            defaults.set(highScoreNumber, forKey: "highScoreSaved")
            print("Yes")
        }
        
        let highScoreLabel = SKLabelNode(fontNamed: "Russian Dollmaker")
        highScoreLabel.text = "High Score: \(highScoreNumber)"
        highScoreLabel.fontSize = 125
        highScoreLabel.fontColor = SKColor.white
        highScoreLabel.position = CGPoint(x:self.size.width/2,y:self.size.height*0.45)
        highScoreLabel.zPosition = 1
        self.addChild(highScoreLabel)
        
        
        restartLabel.text = "Restart"
        restartLabel.fontSize = 90
        restartLabel.fontColor = SKColor.white
        restartLabel.zPosition = 1
        restartLabel.position = CGPoint(x:self.size.width/2,y:self.size.height*0.30)
        self.addChild(restartLabel)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches{
            let pointOfTouch = touch.location(in: self)
            if restartLabel.contains(pointOfTouch){
                let sceneToMoveTo = GameScene(size:self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 1)
                self.view?.presentScene(sceneToMoveTo, transition:myTransition)
                
            }
            
            
        }
    }
    
    
}
