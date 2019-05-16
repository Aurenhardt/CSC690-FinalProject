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
    
    let selectSound = SKAction.playSoundFileNamed("Beep8.wav", waitForCompletion: false)
    
    let labelManager = LabelManager()
    
    var restartLabel = SKLabelNode(fontNamed: "Russian Dollmaker")
    var mainMenuLabel = SKLabelNode(fontNamed: "Russian Dollmaker")
    var gameOverLabel = SKLabelNode(fontNamed: "Russian Dollmaker")
    var scoreLabel = SKLabelNode(fontNamed: "Russian Dollmaker")
    var highScoreLabel = SKLabelNode(fontNamed: "Russian Dollmaker")

    let scaleUp = SKAction.scale(to: 1.20, duration: 0.5)
    let scaleDown = SKAction.scale(to: 1, duration: 0.5)
    var scaleSequence:SKAction = SKAction.sequence([])
    
    override func didMove(to view: SKView) {
        
        self.scaleSequence = SKAction.repeatForever(SKAction.sequence([self.scaleUp, self.scaleDown]))
        
        let background = SKSpriteNode(imageNamed:"background")
        background.position = CGPoint(x:self.size.width/2, y:self.size.height/2)
        self.addChild(background)
        
        restartLabel = self.labelManager.getRestartLabel()
        mainMenuLabel = self.labelManager.getMainMenuLabel()
        gameOverLabel = self.labelManager.getGameOverLabel()
        scoreLabel = self.labelManager.getScoreLabelGameOver()
        highScoreLabel = self.labelManager.getHighScoreLabel()

        gameOverLabel.position = CGPoint(x:self.size.width*0.5, y:self.size.height*0.7)
        gameOverLabel.zPosition = 1
        self.addChild(gameOverLabel)
        gameOverLabel.run(scaleSequence)

        scoreLabel.position = CGPoint(x:self.size.width/2,y:self.size.height*0.5)
        scoreLabel.zPosition = 1
        self.addChild(scoreLabel)
        
        var highScoreNumber = defaults.integer(forKey: "highScoreSaved")
        
        if gameScore>highScoreNumber{
            highScoreNumber = gameScore
            defaults.set(highScoreNumber, forKey: "highScoreSaved")
            print("Yes")
        }
        
        highScoreLabel.text = "High Score: \(highScoreNumber)"
        highScoreLabel.position = CGPoint(x:self.size.width/2,y:self.size.height*0.45)
        highScoreLabel.zPosition = 1
        self.addChild(highScoreLabel)
        
        restartLabel.position = CGPoint(x:self.size.width/2,y:self.size.height*0.30)
        self.addChild(restartLabel)
        restartLabel.run(scaleSequence)
        
        mainMenuLabel.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.2)
        mainMenuLabel.zPosition = 1
        mainMenuLabel.name = "startButton"
        self.addChild(mainMenuLabel)
        mainMenuLabel.run(scaleSequence)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches{
            let pointOfTouch = touch.location(in: self)
            if restartLabel.contains(pointOfTouch){
                self.restartLabel.run(selectSound)
                let sceneToMoveTo = GameScene(size:self.size)
                gameScore = 0
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 1)
                
                self.view?.presentScene(sceneToMoveTo, transition:myTransition)
                
            }
            
            if self.mainMenuLabel.contains(pointOfTouch){
                self.mainMenuLabel.run(selectSound)
                let sceneToMoveTo = MainMenuScene(size: self.size)
                gameScore = 0
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo,transition: myTransition)
                
            }
            
            
        }
    }
    
    
}
