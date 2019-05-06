//
//  EnemyShip.swift
//  Cosmonaut
//
//  Created by Christian Gomez on 5/4/19.
//  Copyright © 2019 Christian Gomez. All rights reserved.
//

import Foundation
import SpriteKit

class EnemyShip{
    
    var enemy:SKSpriteNode
    var dx: CGFloat
    var dy: CGFloat
    
    init(startPoint:CGPoint, endPoint:CGPoint) {
        
        self.enemy = SKSpriteNode(imageNamed: "enemyShip")
        enemy.name = "Enemy" //reference name
        enemy.setScale(1)
        enemy.zPosition = 2
        enemy.physicsBody = SKPhysicsBody(rectangleOf: enemy.size)
        enemy.physicsBody!.affectedByGravity = false
        
        enemy.physicsBody!.affectedByGravity = false
        enemy.physicsBody!.categoryBitMask = PhysicsCategories.Enemy
        enemy.physicsBody!.collisionBitMask = PhysicsCategories.None
        enemy.physicsBody!.contactTestBitMask = PhysicsCategories.Player | PhysicsCategories.Bullet
        
        dx = endPoint.x - startPoint.x
        dy = endPoint.y - startPoint.y
        let amountToRotate = atan2(dy,dx)
        
        enemy.zRotation = amountToRotate*2
        
    }
    
    func getShipSprite()->SKSpriteNode{
        return self.enemy
    }
    
    func getPlayerPhysicsBody()->SKPhysicsBody{
        return enemy.physicsBody!//bad optional unwrap
        
    }
    
    
    
    
}
