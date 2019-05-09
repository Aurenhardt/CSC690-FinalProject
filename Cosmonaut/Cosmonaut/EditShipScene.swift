//
//  EditShipScene.swift
//  Cosmonaut
//
//  Created by Christian Gomez on 5/4/19.
//  Copyright © 2019 Christian Gomez. All rights reserved.
//

import UIKit
import SpriteKit

class EditShipScene: SKScene {
    var userSelection: Int = 0
    var highScore:Int = defaults.integer(forKey: "highScoreSaved")
    let audioLabel = SKLabelNode(text: "")
    let selectSound = SKAction.playSoundFileNamed("Beep8.wav", waitForCompletion: false)
    
   
    let defaultShip = SKSpriteNode(imageNamed:"playerShip")
    let broadsiderShip = SKSpriteNode(imageNamed:"BroadsiderPlayerShip")
    let quickshotShip = SKSpriteNode(imageNamed:"QuickshotPlayerShip")
    let SDWPlayerShip = SKSpriteNode(imageNamed:"SDWPlayerShip")
   
    
    let scaleUp = SKAction.scale(to: 1.20, duration: 0.5)
    let scaleDown = SKAction.scale(to: 1, duration: 0.5)
    var scaleSequence:SKAction = SKAction.sequence([])
    
    override func didMove(to view: SKView) {
        
        self.addChild(audioLabel)
        
        self.scaleSequence = SKAction.repeatForever(SKAction.sequence([self.scaleUp, self.scaleDown]))
        
        
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
        let returnLabel = SKLabelNode(fontNamed: "Russian")
        returnLabel.text = "Return"
        returnLabel.fontSize = 40
        returnLabel.fontColor = SKColor.white
        //editShip.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        returnLabel.zPosition = 1
        returnLabel.position = CGPoint(x: self.size.width*0.28, y: self.size.height*0.9)
        returnLabel.name = "returnButton"
        self.addChild(returnLabel)
        returnLabel.run(scaleSequence)
        
        let defaultShipLabelTitle = SKLabelNode(fontNamed: "Russian Dollmaker")
        defaultShipLabelTitle.text = "Old Faithful:"
        defaultShipLabelTitle.fontSize = 100
        defaultShipLabelTitle.fontColor = SKColor.white
        defaultShipLabelTitle.zPosition = 1
        defaultShipLabelTitle.position = CGPoint(x: self.size.width*0.60, y: self.size.height*0.85)
        defaultShipLabelTitle.name = "defaultShipLabel"
        self.addChild(defaultShipLabelTitle)
        
        let BroadsiderPlayerShipLabelTitle = SKLabelNode(fontNamed: "Russian Dollmaker")
        BroadsiderPlayerShipLabelTitle.text = "Broadsider:"
        BroadsiderPlayerShipLabelTitle.fontSize = 100
        BroadsiderPlayerShipLabelTitle.fontColor = SKColor.white
        BroadsiderPlayerShipLabelTitle.zPosition = 1
        BroadsiderPlayerShipLabelTitle.position = CGPoint(x: self.size.width*0.60, y: self.size.height*0.65)
        BroadsiderPlayerShipLabelTitle.name = "BroadsiderPlayerShipLabel"
        self.addChild(BroadsiderPlayerShipLabelTitle)
        
        let QuickshotPlayerShipLabelTitle = SKLabelNode(fontNamed: "Russian Dollmaker")
        QuickshotPlayerShipLabelTitle.text = "Quickshot"
        QuickshotPlayerShipLabelTitle.fontSize = 100
        QuickshotPlayerShipLabelTitle.fontColor = SKColor.white
        QuickshotPlayerShipLabelTitle.zPosition = 1
        QuickshotPlayerShipLabelTitle.position = CGPoint(x: self.size.width*0.60, y: self.size.height*0.45)
        QuickshotPlayerShipLabelTitle.name = "defaultShipLabel"
        self.addChild(QuickshotPlayerShipLabelTitle)
        
        let SDWPlayerShipLabelTitle = SKLabelNode(fontNamed: "Russian Dollmaker")
        SDWPlayerShipLabelTitle.text = "SDW M-06:"
        SDWPlayerShipLabelTitle.fontSize = 100
        SDWPlayerShipLabelTitle.fontColor = SKColor.white
        SDWPlayerShipLabelTitle.zPosition = 1
        SDWPlayerShipLabelTitle.position = CGPoint(x: self.size.width*0.60, y: self.size.height*0.25)
        SDWPlayerShipLabelTitle.name = "defaultShipLabel"
        self.addChild(SDWPlayerShipLabelTitle)
        
        //MARK: Ship Descriptions
        
        let defaultShipLabel = SKLabelNode(fontNamed: "Russian")
        defaultShipLabel.text = "Good Ol'Default Ship."
        defaultShipLabel.fontSize = 40
        defaultShipLabel.fontColor = SKColor.white
        defaultShipLabel.zPosition = 1
        defaultShipLabel.position = CGPoint(x: self.size.width*0.60, y: self.size.height*0.8)
        defaultShipLabel.name = "defaultShipLabel"
        self.addChild(defaultShipLabel)
        
        let BroadsiderPlayerShipLabel = SKLabelNode(fontNamed: "Russian")
        BroadsiderPlayerShipLabel.text = "If you miss, it's your fault."
        BroadsiderPlayerShipLabel.fontSize = 30
        BroadsiderPlayerShipLabel.fontColor = SKColor.white
        BroadsiderPlayerShipLabel.zPosition = 1
        BroadsiderPlayerShipLabel.position = CGPoint(x: self.size.width*0.60, y: self.size.height*0.6)
        BroadsiderPlayerShipLabel.name = "BroadsiderPlayerShipLabel"
        self.addChild(BroadsiderPlayerShipLabel)
        
        let QuickshotPlayerShipLabel = SKLabelNode(fontNamed: "Russian")
        QuickshotPlayerShipLabel.text = "Quickest shot in Andromeda."
        QuickshotPlayerShipLabel.fontSize = 30
        QuickshotPlayerShipLabel.fontColor = SKColor.white
        QuickshotPlayerShipLabel.zPosition = 1
        QuickshotPlayerShipLabel.position = CGPoint(x: self.size.width*0.60, y: self.size.height*0.4)
        QuickshotPlayerShipLabel.name = "QuickshotPlayerShipLabel"
        self.addChild(QuickshotPlayerShipLabel)
        
        let SDWPlayerShipLabel = SKLabelNode(fontNamed: "Russian")
        SDWPlayerShipLabel.text = "Probably Illegal. Probably..."
        SDWPlayerShipLabel.fontSize = 30
        SDWPlayerShipLabel.fontColor = SKColor.white
        SDWPlayerShipLabel.zPosition = 1
        SDWPlayerShipLabel.position = CGPoint(x: self.size.width*0.60, y: self.size.height*0.2)
        SDWPlayerShipLabel.name = "SDWPlayerShipLabel"
        self.addChild(SDWPlayerShipLabel)
        
        
        if highScore >= 0 && highScore < 10{
            
            
            defaultShip.setScale(1)
            defaultShip.zPosition = 2
            defaultShip.position = CGPoint(x: self.size.width*0.28, y: self.size.height*0.8)
            defaultShip.name = "defaultShip"
            self.addChild(defaultShip)
            
            let broadsiderShip = SKSpriteNode(imageNamed:"10pts lock")
            broadsiderShip.setScale(0.5)
            broadsiderShip.zPosition = 2
            broadsiderShip.position = CGPoint(x: self.size.width*0.28, y: self.size.height*0.65)
            broadsiderShip.name = "broadsiderShipLock"
            self.addChild(broadsiderShip)
            
            let quickshotShip = SKSpriteNode(imageNamed:"20pts lock")
            quickshotShip.setScale(0.5)
            quickshotShip.zPosition = 2
            quickshotShip.position = CGPoint(x: self.size.width*0.28, y: self.size.height*0.45)
            quickshotShip.name = "quickshotShipLock"
            self.addChild(quickshotShip)
            
            let SDWPlayerShip = SKSpriteNode(imageNamed:"30pts lock")
            SDWPlayerShip.setScale(0.5)
            SDWPlayerShip.zPosition = 2
            SDWPlayerShip.position = CGPoint(x: self.size.width*0.28, y: self.size.height*0.25)
            SDWPlayerShip.name = "SDWPlayerShipLock"
            self.addChild(SDWPlayerShip)
            
        } else if highScore >= 10 && highScore < 20{
            
            
            defaultShip.setScale(1)
            defaultShip.zPosition = 2
            defaultShip.position = CGPoint(x: self.size.width*0.28, y: self.size.height*0.8)
            defaultShip.name = "defaultShip"
            self.addChild(defaultShip)
            defaultShip.run(scaleSequence)
            
            broadsiderShip.setScale(1)
            broadsiderShip.zPosition = 2
            broadsiderShip.position = CGPoint(x: self.size.width*0.28, y: self.size.height*0.6)
            broadsiderShip.name = "broadsiderShip"
            self.addChild(broadsiderShip)
            broadsiderShip.run(scaleSequence)
            
            let quickshotShip = SKSpriteNode(imageNamed:"20pts lock")
            quickshotShip.setScale(0.5)
            quickshotShip.zPosition = 2
            quickshotShip.position = CGPoint(x: self.size.width*0.28, y: self.size.height*0.45)
            quickshotShip.name = "quickshotShipLock"
            self.addChild(quickshotShip)
            
            let SDWPlayerShip = SKSpriteNode(imageNamed:"30pts lock")
            SDWPlayerShip.setScale(0.5)
            SDWPlayerShip.zPosition = 2
            SDWPlayerShip.position = CGPoint(x: self.size.width*0.28, y: self.size.height*0.25)
            SDWPlayerShip.name = "SDWPlayerShipLock"
            self.addChild(SDWPlayerShip)
            
        } else if highScore >= 20 && highScore < 30{
            
            defaultShip.setScale(1)
            defaultShip.zPosition = 2
            defaultShip.position = CGPoint(x: self.size.width*0.28, y: self.size.height*0.8)
            defaultShip.name = "defaultShip"
            self.addChild(defaultShip)
            defaultShip.run(scaleSequence)
            
            broadsiderShip.setScale(1)
            broadsiderShip.zPosition = 2
            broadsiderShip.position = CGPoint(x: self.size.width*0.28, y: self.size.height*0.6)
            broadsiderShip.name = "broadsiderShip"
            self.addChild(broadsiderShip)
            broadsiderShip.run(scaleSequence)
            
            quickshotShip.setScale(1)
            quickshotShip.zPosition = 2
            quickshotShip.position = CGPoint(x: self.size.width*0.28, y: self.size.height*0.4)
            quickshotShip.name = "quickshotShip"
            self.addChild(quickshotShip)
            quickshotShip.run(scaleSequence)
            
            let SDWPlayerShip = SKSpriteNode(imageNamed:"30pts lock")
            SDWPlayerShip.setScale(0.5)
            SDWPlayerShip.zPosition = 2
            SDWPlayerShip.position = CGPoint(x: self.size.width*0.28, y: self.size.height*0.25)
            SDWPlayerShip.name = "SDWPlayerShipLock"
            self.addChild(SDWPlayerShip)
            
        } else if highScore >= 30{
            
          
            defaultShip.setScale(1)
            defaultShip.zPosition = 2
            defaultShip.position = CGPoint(x: self.size.width*0.28, y: self.size.height*0.8)
            defaultShip.name = "defaultShip"
            self.addChild(defaultShip)
            defaultShip.run(scaleSequence)
          
            broadsiderShip.setScale(1)
            broadsiderShip.zPosition = 2
            broadsiderShip.position = CGPoint(x: self.size.width*0.28, y: self.size.height*0.6)
            broadsiderShip.name = "broadsiderShip"
            self.addChild(broadsiderShip)
            broadsiderShip.run(scaleSequence)
           
            quickshotShip.setScale(1)
            quickshotShip.zPosition = 2
            quickshotShip.position = CGPoint(x: self.size.width*0.28, y: self.size.height*0.4)
            quickshotShip.name = "quickshotShip"
            self.addChild(quickshotShip)
            quickshotShip.run(scaleSequence)
            
            SDWPlayerShip.setScale(1)
            SDWPlayerShip.zPosition = 2
            SDWPlayerShip.position = CGPoint(x: self.size.width*0.28, y: self.size.height*0.2)
            SDWPlayerShip.name = "SDWPlayerShip"
            self.addChild(SDWPlayerShip)
            SDWPlayerShip.run(scaleSequence)
            
        } else {
            defaultShip.setScale(1)
            defaultShip.zPosition = 2
            defaultShip.position = CGPoint(x: self.size.width*0.28, y: self.size.height*0.8)
            defaultShip.name = "defaultShip"
            self.addChild(defaultShip)
            defaultShip.run(scaleSequence)
            
            let broadsiderShip = SKSpriteNode(imageNamed:"10pts lock")
            broadsiderShip.setScale(1)
            broadsiderShip.zPosition = 2
            broadsiderShip.position = CGPoint(x: self.size.width*0.28, y: self.size.height*0.6)
            broadsiderShip.name = "broadsiderShipLock"
            self.addChild(broadsiderShip)
            
            let quickshotShip = SKSpriteNode(imageNamed:"20pts lock")
            quickshotShip.setScale(1)
            quickshotShip.zPosition = 2
            quickshotShip.position = CGPoint(x: self.size.width*0.28, y: self.size.height*0.4)
            quickshotShip.name = "quickshotShipLock"
            self.addChild(quickshotShip)
            
            let SDWPlayerShip = SKSpriteNode(imageNamed:"30pts lock")
            SDWPlayerShip.setScale(1)
            SDWPlayerShip.zPosition = 2
            SDWPlayerShip.position = CGPoint(x: self.size.width*0.28, y: self.size.height*0.2)
            SDWPlayerShip.name = "SDWPlayerShipLock"
            self.addChild(SDWPlayerShip)
            
        }
        
        
        
        
       
        
       
        
        
    }
 
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches{
            let pointOfTouch = touch.location(in: self)
            let nodeITapped = atPoint(pointOfTouch)
            
            if nodeITapped.name == "returnButton"{
                self.audioLabel.run(selectSound)
                let sceneToMoveTo = MainMenuScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view?.presentScene(sceneToMoveTo,transition: myTransition)
                
            }
            if nodeITapped.name == "defaultShip" {
                self.audioLabel.run(selectSound)
                let sceneToMoveTo = MainMenuScene(size: self.size)
                userSelection = 0
                defaults.set(userSelection, forKey: "userShipType")
                print(defaults.integer(forKey: "userShipType"))
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view?.presentScene(sceneToMoveTo,transition: myTransition)
            }
            
            if nodeITapped.name == "broadsiderShip" {
                self.audioLabel.run(selectSound)
                let sceneToMoveTo = MainMenuScene(size: self.size)
                userSelection = 1
                defaults.set(userSelection, forKey: "userShipType")
                print(defaults.integer(forKey: "userShipType"))
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view?.presentScene(sceneToMoveTo,transition: myTransition)
            }
            
            if nodeITapped.name == "quickshotShip" {
                self.audioLabel.run(selectSound)
                let sceneToMoveTo = MainMenuScene(size: self.size)
                userSelection = 2
                defaults.set(userSelection, forKey: "userShipType")
                print(defaults.integer(forKey: "userShipType"))
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view?.presentScene(sceneToMoveTo,transition: myTransition)
            }
            
            if nodeITapped.name == "SDWPlayerShip"{
                self.audioLabel.run(selectSound)
                let sceneToMoveTo = MainMenuScene(size: self.size)
                userSelection = 3
                defaults.set(userSelection, forKey: "userShipType")
                print(defaults.integer(forKey: "userShipType"))
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view?.presentScene(sceneToMoveTo,transition: myTransition)
            }
            
            
            
            
        }
    }
}
