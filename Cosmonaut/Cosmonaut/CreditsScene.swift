//
//  CreditsScene.swift
//  Cosmonaut
//
//  Created by Christian Gomez on 5/10/19.
//  Copyright © 2019 Christian Gomez. All rights reserved.
//

import Foundation
import SpriteKit

class CreditsScene: SKScene {
    
    let selectSound = SKAction.playSoundFileNamed("Beep8.wav", waitForCompletion: false)
    var returnLabel = SKLabelNode(fontNamed: "Russian Dollmaker")
    let labelManager = LabelManager()
    
    let scaleUp = SKAction.scale(to: 1.20, duration: 0.5)
    let scaleDown = SKAction.scale(to: 1, duration: 0.5)
    var scaleSequence:SKAction = SKAction.sequence([])
    
    override func didMove(to view: SKView) {
        
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
        self.scaleSequence = SKAction.repeatForever(SKAction.sequence([self.scaleUp, self.scaleDown]))
        
        returnLabel = labelManager.getReturnLabel()
        returnLabel.position = CGPoint(x: self.size.width*0.72, y: self.size.height*0.9)
        returnLabel.name = "returnButton"
        self.addChild(returnLabel)
        returnLabel.run(scaleSequence)
        
        /*let audioCreditLabel = SKLabelNode(fontNamed: "Russian Dollmaker")
        audioCreditLabel.text = " '8 Bit Explosion Blast Sound Effect 2'" /*by Jesus Lastra from http://audiosoundclips.com/8-bit-explosion-blast-sound-effects-sfx/ Licensed under Create Commons: By Attribution 4.0 International (CC BY 4.0) https://creativecommons.org/licenses/by/4.0/"*/
        
        audioCreditLabel.fontSize = 70
        audioCreditLabel.fontColor = SKColor.white
        audioCreditLabel.zPosition = 1
        audioCreditLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.8)
        self.addChild(audioCreditLabel)
        
        let audioCreditDesc = SKLabelNode(fontNamed: "Russian Dollmaker")
        audioCreditDesc.text = "by Jesus Lastra from http://audiosoundclips.com/8-bit-explosion-blast-sound-effects-sfx/"
        //Licensed under Create Commons: By Attribution 4.0 International (CC BY 4.0) https://creativecommons.org/licenses/by/4.0/
        audioCreditDesc.fontSize = 50
        audioCreditDesc.fontColor = SKColor.white
        audioCreditDesc.zPosition = 1
        audioCreditDesc.position = CGPoint(x: self.size.width/2, y: self.size.height*0.7)
        self.addChild(audioCreditDesc)
        */
        
        /*
         
         ==Audio==
         "8 Bit Explosion Blast Sound Effect 2" by Jesus Lastra from http://audiosoundclips.com/8-bit-explosion-blast-sound-effects-sfx/
         Licensed under Create Commonsx: By Attribution 4.0 International (CC BY 4.0)
         https://creativecommons.org/licenses/by/4.0/
         
         Laser_Shoot7.wav
         
         Beep8.wav
         
         "Ouroboros" by Kevin MacLeod (incompetech.com)
         Licensed under Creative Commons: By Attribution 3.0 License
         http://creativecommons.org/licenses/by/3.0/
         
         ==Fonts==
         "Russian" by Pablo Barrio from https://www.dafont.com/russian-pb.font
         Licensed under Condition of Personal Use?
         
         
         "Russian Dollmaker" by Darrell Flood from https://www.dafont.com/russian-dollmaker.font
         Liscensed under Condition of Personal Use.
         
         ==Art==
         Ships and Backgrounds are mine!
         
         
         
         
         
         */
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches{
            let pointOfTouch = touch.location(in: self)
            let nodeITapped = atPoint(pointOfTouch)
            
            if nodeITapped.name == "returnButton"{
                self.returnLabel.run(selectSound)
                let sceneToMoveTo = MainMenuScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view?.presentScene(sceneToMoveTo,transition: myTransition)
                
            }
           
            
            
            
            
        }
    }
}
