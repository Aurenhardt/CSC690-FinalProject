//
//  MainMenuScene.swift
//  Cosmonaut
//
//  Created by Christian Gomez on 5/4/19.
//  Copyright © 2019 Christian Gomez. All rights reserved.
//

import Foundation
import SpriteKit

class MainMenuScene: SKScene{
    
    let labelManager = LabelManager()
    
    let selectSound = SKAction.playSoundFileNamed("Beep8.wav", waitForCompletion: false)
    let background = SKSpriteNode(imageNamed: "background")
    
    //Declared early so that I can access it in functions outside of didMove func
    var gameBy = SKLabelNode(fontNamed: "Russian Dollmaker")
    var gameName1 = SKLabelNode(fontNamed: "Russian")
    var gameName2 = SKLabelNode(fontNamed: "Russian")
    var startGame = SKLabelNode(fontNamed: "Russian Dollmaker")
    var editShipLabel = SKLabelNode(fontNamed: "Russian Dollmaker")
    var creditsLabel = SKLabelNode(fontNamed: "Russian Dollmaker")
    
    let scaleUp = SKAction.scale(to: 1.20, duration: 0.5)
    let scaleDown = SKAction.scale(to: 1, duration: 0.5)
    var scaleSequence:SKAction = SKAction.sequence([])
    
    override func didMove(to view: SKView) {
        
        
        gameBy = self.labelManager.getGameBy()
        gameName1 = self.labelManager.getGameName1()
        gameName2 = self.labelManager.getGameName2()
        startGame = self.labelManager.getStartGame()
        editShipLabel = self.labelManager.getEditShipLabel()
        creditsLabel = self.labelManager.getCreditsLabel()
        
        
        self.scaleSequence = SKAction.repeatForever(SKAction.sequence([self.scaleUp, self.scaleDown]))
        
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
        gameBy.position = CGPoint(x: self.size.width/2, y: self.size.height*0.77)
        gameBy.zPosition = 1
        self.addChild(gameBy)
        
        gameName1.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.69)
        gameName1.zPosition = 1
        self.addChild(gameName1)
        
        gameName2.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.62)
        gameName2.zPosition = 1
        self.addChild(gameName2)
        
        startGame.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.2)
        startGame.zPosition = 1
        startGame.name = "startButton"
        self.addChild(startGame)
        startGame.run(scaleSequence)
        
        editShipLabel.position = CGPoint(x: self.size.width*0.78,y: self.size.height*0.9)
        editShipLabel.zPosition = 100
        editShipLabel.name = "editButton"
        self.addChild(editShipLabel)
        editShipLabel.run(scaleSequence)
        
        creditsLabel.position = CGPoint(x: self.size.width*0.22,y: self.size.height*0.9)
        creditsLabel.zPosition = 100
        creditsLabel.name = "creditsLabel"
        self.addChild(creditsLabel)
        creditsLabel.run(scaleSequence)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches{
            let pointOfTouch = touch.location(in: self)
            let nodeITapped = atPoint(pointOfTouch)
            
            if nodeITapped.name == "startButton"{
                self.startGame.run(selectSound)
                let sceneToMoveTo = GameScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view?.presentScene(sceneToMoveTo,transition: myTransition)
                
            }
            
            if nodeITapped.name == "editButton"{
                self.editShipLabel.run(selectSound)
                let sceneToMoveTo = EditShipScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view?.presentScene(sceneToMoveTo,transition: myTransition)
                
            }
            
            if nodeITapped.name == "creditsLabel"{
                self.creditsLabel.run(selectSound)
                let sceneToMoveTo = CreditsScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view?.presentScene(sceneToMoveTo,transition: myTransition)
                
            }
            
        }
    }
    
}
