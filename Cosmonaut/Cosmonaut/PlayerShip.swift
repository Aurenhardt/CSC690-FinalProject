//
//  PlayerShip.swift
//  Cosmonaut
//
//  Created by Christian Gomez on 5/3/19.
//  Copyright © 2019 Christian Gomez. All rights reserved.
//

import Foundation
import SpriteKit


class PlayerShip{
    
    var player:SKSpriteNode
    var shipType: Int = 0
    var firingType: Int = 0


    init(shipType: Int) {
        self.shipType = defaults.integer(forKey: "userShipType")
        
        if self.shipType == 0 {
            player = SKSpriteNode(imageNamed: "playerShip")
            player.setScale(1)
            
        }else if self.shipType == 1{
            player = SKSpriteNode(imageNamed: "BroadsiderPlayerShip")
            player.setScale(1.5)
            
        }else if self.shipType == 2{
            player = SKSpriteNode(imageNamed: "QuickshotPlayerShip")
            player.setScale(1.5)
            
        }else if self.shipType == 3{
            player = SKSpriteNode(imageNamed: "SDWPlayerShip")
            player.setScale(2)
            
        }else{
            player = SKSpriteNode(imageNamed: "playerShip")
            player.setScale(1)
        }
        
        
        player.zPosition = 2
        player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
        player.physicsBody?.affectedByGravity = false//bad optional unwrap
        
        player.physicsBody?.categoryBitMask = PhysicsCategories.Player
        player.physicsBody?.collisionBitMask = PhysicsCategories.None
        player.physicsBody?.contactTestBitMask = PhysicsCategories.Enemy
        
    }
    
    func getShipSprite()->SKSpriteNode{
        return self.player
    }
    
    func getPlayerPhysicsBody()->SKPhysicsBody{
        guard let playerBody = player.physicsBody else{
             return SKPhysicsBody(rectangleOf: player.size)
        }
        return playerBody
    }

    
}

