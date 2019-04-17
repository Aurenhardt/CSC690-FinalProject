//
//  GameScene.swift
//  CSC690 GalagaClone
//
//  Created by Christian Gomez on 4/16/19.
//  Copyright © 2019 Christian Gomez. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let player = SKSpriteNode(imageNamed: "playerShip")
    //let bulletSound = SKAction.playSoundFileNamed(<#T##soundFile: String##String#>, waitForCompletion: <#T##Bool#>) use this when you have a sound effect
    
    //
    
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "background")
        background.size = self.size
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
        
        player.setScale(1)//size of the ship
        player.position = CGPoint(x: self.size.width/2, y: self.size.height/5)
        player.zPosition = 2
        self.addChild(player)//adds the player to the game
    }
    
    
    func fireBullet(){
        let bullet = SKSpriteNode(imageNamed: "bullet")
        bullet.setScale(1)
        bullet.position = player.position
        bullet.zPosition = 1
        self.addChild(bullet)
        
        let moveBullet = SKAction.moveTo(y: self.size.height + bullet.size.height, duration: 1)
        let deleteBullet = SKAction.removeFromParent()
        let bulletSequence = SKAction.sequence([moveBullet,deleteBullet])
        bullet.run(bulletSequence)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        fireBullet()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch: AnyObject in touches{
            
            let pointOfTouch = touch.location(in: self)
            let previousPointOfTouch = touch.previousLocation(in: self)
            
            let amountDragged = pointOfTouch.x - previousPointOfTouch.x
            
            player.position.x = player.position.x + amountDragged
            
        }
    }
    
}

