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
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
        let gameBy = SKLabelNode(fontNamed: "Russian Dollmaker")
        gameBy.text = "Aurenhardt's"
        gameBy.fontSize = 80
        gameBy.fontColor = SKColor.white
        gameBy.position = CGPoint(x: self.size.width/2, y: self.size.height*0.78)
        gameBy.zPosition = 1
        self.addChild(gameBy)
        
        let gameName1 = SKLabelNode(fontNamed: "Russian")
        gameName1.text = "COSMONAUT"
        gameName1.fontSize = 130
        gameName1.fontColor = SKColor.white
        gameName1.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.7)
        gameName1.zPosition = 1
        self.addChild(gameName1)
        
        let gameName2 = SKLabelNode(fontNamed: "Russian")
        gameName2.text = "Special thanks to:\nMatt Heaney Apps"
        gameName2.fontSize = 30
        gameName2.fontColor = SKColor.white
        gameName2.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.65)
        gameName2.zPosition = 1
        self.addChild(gameName2)
        
        let startGame = SKLabelNode(fontNamed: "Russian")
        startGame.text = "Start Game"
        startGame.fontSize = 100
        startGame.fontColor = SKColor.white
        startGame.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.4)
        startGame.zPosition = 1
        startGame.name = "startButton"
        self.addChild(startGame)
        
        let editShipLabel = SKLabelNode(fontNamed: "Russian")
        editShipLabel.text = "Edit Ship"
        editShipLabel.fontSize = 40
        editShipLabel.fontColor = SKColor.white
        editShipLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.right
        editShipLabel.position = CGPoint(x: self.size.width*0.80,y: self.size.height*0.9)
        editShipLabel.zPosition = 100
        editShipLabel.name = "editButton"
        self.addChild(editShipLabel)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches{
            let pointOfTouch = touch.location(in: self)
            let nodeITapped = atPoint(pointOfTouch)
            
            if nodeITapped.name == "startButton"{
                let sceneToMoveTo = GameScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo,transition: myTransition)
                
            }
            
            if nodeITapped.name == "editButton"{
                let sceneToMoveTo = EditShipScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo,transition: myTransition)
                
            }
            
        }
    }
    
}
