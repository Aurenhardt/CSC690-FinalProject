//
//  GameViewController.swift
//  Cosmonaut
//
//  Created by Christian Gomez on 4/26/19.
//  Copyright © 2019 Christian Gomez. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import AVFoundation

class GameViewController: UIViewController {

    var backingAudio = AVAudioPlayer()
    
    override func viewDidLoad() {
        
        guard let filePath = Bundle.main.path(forResource: "Ouroboros", ofType: "mp3") else{
            return
        }
        let audioURL = URL(fileURLWithPath: filePath)
        
        do { backingAudio = try AVAudioPlayer(contentsOf: audioURL)}
        catch{ return print("Error Cannot find Audio File")}
        
        backingAudio.numberOfLoops = -1
        backingAudio.play()
        
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if var scene = SKScene(fileNamed: "GameScene") {
                scene = MainMenuScene(size: CGSize(width:1536,height:2048))
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
