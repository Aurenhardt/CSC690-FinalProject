//
//  LabelManager.swift
//  Cosmonaut
//
//  Created by Christian Gomez on 5/4/19.
//  Copyright © 2019 Christian Gomez. All rights reserved.
//

import Foundation
import SpriteKit

class LabelManager{
    
    //MARK: In Game Scene Labels.
    var scoreLabel: SKLabelNode
    var livesLabel: SKLabelNode
    var tapToStartLabel: SKLabelNode
    
    //MARK: Edit Ship Scene Labels
    let returnLabel = SKLabelNode(fontNamed: "Russian")
    
    let defaultShipLabelTitle = SKLabelNode(fontNamed: "Russian Dollmaker")
    let BroadsiderPlayerShipLabelTitle = SKLabelNode(fontNamed: "Russian Dollmaker")
    let QuickshotPlayerShipLabelTitle = SKLabelNode(fontNamed: "Russian Dollmaker")
    let SDWPlayerShipLabelTitle = SKLabelNode(fontNamed: "Russian Dollmaker")

    let defaultShipLabel = SKLabelNode(fontNamed: "Russian")
    let BroadsiderPlayerShipLabel = SKLabelNode(fontNamed: "Russian")
    let QuickshotPlayerShipLabel = SKLabelNode(fontNamed: "Russian")
    let SDWPlayerShipLabel = SKLabelNode(fontNamed: "Russian")

    //MARK: Main Menu Scene Labels
    let gameBy = SKLabelNode(fontNamed: "Russian Dollmaker")
    let gameName1 = SKLabelNode(fontNamed: "Russian")
    let gameName2 = SKLabelNode(fontNamed: "Russian")
    let startGame = SKLabelNode(fontNamed: "Russian Dollmaker")
    let editShipLabel = SKLabelNode(fontNamed: "Russian Dollmaker")
    let creditsLabel = SKLabelNode(fontNamed: "Russian Dollmaker")
    
    //MARK: Game Over Scene Labels
    let restartLabel = SKLabelNode(fontNamed: "Russian Dollmaker")
    let mainMenuLabel = SKLabelNode(fontNamed: "Russian Dollmaker")
    let gameOverLabel = SKLabelNode(fontNamed: "Russian Dollmaker")
    let scoreLabelGameOver = SKLabelNode(fontNamed: "Russian Dollmaker")
    let highScoreLabel = SKLabelNode(fontNamed: "Russian Dollmaker")
    
    
    init() {
        
        //MARK: In Game Scene Labels
        scoreLabel = SKLabelNode(fontNamed: "Russian Dollmaker")
        livesLabel = SKLabelNode(fontNamed: "Russian Dollmaker")
        tapToStartLabel = SKLabelNode(fontNamed: "Russian Dollmaker")
        
        scoreLabel.text = "Score: 0"
        scoreLabel.fontSize = 70
        scoreLabel.fontColor = SKColor.white
        scoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        scoreLabel.zPosition = 100
        
        livesLabel.text = "Lives: 3"
        livesLabel.fontSize = 70
        livesLabel.fontColor = SKColor.white
        livesLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.right
        livesLabel.zPosition = 100
        
        tapToStartLabel.text = "Tap To Begin"
        tapToStartLabel.fontSize = 100
        tapToStartLabel.fontColor = SKColor.white
        tapToStartLabel.zPosition = 1
        tapToStartLabel.alpha = 0
        
        // MARK: GameOver Scene Labels
        gameOverLabel.text = "Game Over"
        gameOverLabel.fontSize = 190
        gameOverLabel.fontColor = SKColor.white
        
        scoreLabelGameOver.text = "Score: \(gameScore)"
        scoreLabelGameOver.fontSize = 125
        scoreLabelGameOver.fontColor = SKColor.white
        
        highScoreLabel.fontSize = 125
        highScoreLabel.fontColor = SKColor.white
        
        restartLabel.text = "Restart"
        restartLabel.fontSize = 90
        restartLabel.fontColor = SKColor.white
        restartLabel.zPosition = 1
        
        mainMenuLabel.text = "Main Menu"
        mainMenuLabel.fontSize = 90
        mainMenuLabel.fontColor = SKColor.white
        
        
        // MARK: MainMenu Scene Labels
        gameBy.text = "Aurenhardt's"
        gameBy.fontSize = 80
        gameBy.fontColor = SKColor.white
        
        gameName1.text = "COSMONAUT"
        gameName1.fontSize = 130
        gameName1.fontColor = SKColor.white
        
        gameName2.text = "Special thanks to:\nMatt Heaney Apps"
        gameName2.fontSize = 30
        gameName2.fontColor = SKColor.white
        
        startGame.text = "Start Game"
        startGame.fontSize = 90
        startGame.fontColor = SKColor.white
        
        editShipLabel.text = "Edit Ship"
        editShipLabel.fontSize = 80
        editShipLabel.fontColor = SKColor.white
        editShipLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.right
        
        creditsLabel.text = "Credits"
        creditsLabel.fontSize = 80
        creditsLabel.fontColor = SKColor.white
        creditsLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        
        // MARK: Edit Ship Scene Labels and Ship Titles
        
        returnLabel.text = "Return"
        returnLabel.fontSize = 40
        returnLabel.fontColor = SKColor.white
        returnLabel.zPosition = 1
        
        defaultShipLabelTitle.text = "Old Faithful:"
        defaultShipLabelTitle.fontSize = 100
        defaultShipLabelTitle.fontColor = SKColor.white
        defaultShipLabelTitle.zPosition = 1
        
        BroadsiderPlayerShipLabelTitle.text = "Broadsider:"
        BroadsiderPlayerShipLabelTitle.fontSize = 100
        BroadsiderPlayerShipLabelTitle.fontColor = SKColor.white
        BroadsiderPlayerShipLabelTitle.zPosition = 1
        
        QuickshotPlayerShipLabelTitle.text = "Quickshot"
        QuickshotPlayerShipLabelTitle.fontSize = 100
        QuickshotPlayerShipLabelTitle.fontColor = SKColor.white
        QuickshotPlayerShipLabelTitle.zPosition = 1
        
        SDWPlayerShipLabelTitle.text = "SDW M-06:"
        SDWPlayerShipLabelTitle.fontSize = 100
        SDWPlayerShipLabelTitle.fontColor = SKColor.white
        SDWPlayerShipLabelTitle.zPosition = 1
        
        //MARK: Ship Descriptions
        
        defaultShipLabel.text = "Good Ol'Default Ship."
        defaultShipLabel.fontSize = 40
        defaultShipLabel.fontColor = SKColor.white
        defaultShipLabel.zPosition = 1
        
        BroadsiderPlayerShipLabel.text = "If you miss, it's your fault."
        BroadsiderPlayerShipLabel.fontSize = 30
        BroadsiderPlayerShipLabel.fontColor = SKColor.white
        BroadsiderPlayerShipLabel.zPosition = 1
        
        QuickshotPlayerShipLabel.text = "Quickest shot in Andromeda."
        QuickshotPlayerShipLabel.fontSize = 30
        QuickshotPlayerShipLabel.fontColor = SKColor.white
        QuickshotPlayerShipLabel.zPosition = 1
        
        SDWPlayerShipLabel.text = "Probably Illegal. Probably..."
        SDWPlayerShipLabel.fontSize = 30
        SDWPlayerShipLabel.fontColor = SKColor.white
        SDWPlayerShipLabel.zPosition = 1
        
    }
    
    func updateScore(){
        self.scoreLabel.text = "Score: \(gameScore)"
    }
    
    func setHeightWidth(screenHeight:CGFloat,screenWidth:CGFloat){
        scoreLabel.position = CGPoint(x: screenWidth*0.21,y: screenHeight + scoreLabel.frame.size.height)
        livesLabel.position = CGPoint(x: screenWidth*0.80,y: screenHeight + livesLabel.frame.size.height)
        tapToStartLabel.position = CGPoint(x: screenWidth/2, y: screenHeight/2)
    }
    
    func getScoreLabel() -> SKLabelNode {
        return self.scoreLabel
    }
    
    func getLivesLabel() -> SKLabelNode{
        return self.livesLabel
    }
    
    func getTapToStartLabel() -> SKLabelNode{
        return self.tapToStartLabel
    }
    
    //MARK: Edit Scene Label Getters
    
    func getReturnLabel() -> SKLabelNode{
        return self.returnLabel
    }
    
    func getDefaultShipTitle() -> SKLabelNode {
        return self.defaultShipLabelTitle
    }
    
    func getBroadsiderShipTitle() -> SKLabelNode{
        return self.BroadsiderPlayerShipLabelTitle
    }
    
    func getQuickShotShipTitle() -> SKLabelNode{
        return self.QuickshotPlayerShipLabelTitle
    }
    
    func getSDWShipTitle() -> SKLabelNode{
        return self.SDWPlayerShipLabelTitle
    }
    
    func getDefaultShipDesc() -> SKLabelNode {
        return self.defaultShipLabel
    }
    
    func getBroadsiderShipDesc() -> SKLabelNode{
        return self.BroadsiderPlayerShipLabel
    }
    
    func getQuickShotShipDesc() -> SKLabelNode{
        return self.QuickshotPlayerShipLabel
    }
    
    func getSDWShipDesc() -> SKLabelNode{
        return self.SDWPlayerShipLabel
    }
    
    //MARK: MainMenu Scene Labels
    
    func getGameBy() -> SKLabelNode{
        return self.gameBy
    }
     
    func getGameName1() -> SKLabelNode{
        return self.gameName1
    }
     
    func getGameName2() -> SKLabelNode{
        return self.gameName2
    }
     
    func getStartGame() -> SKLabelNode{
        return self.startGame
    }
     
    func getEditShipLabel() -> SKLabelNode{
        return self.editShipLabel
    }
    
    func getCreditsLabel() -> SKLabelNode{
        return self.creditsLabel
    }
     
    //MARK: GameOver Scene Labels
    func getRestartLabel() -> SKLabelNode{
        return self.restartLabel
    }
    
    func getMainMenuLabel() -> SKLabelNode{
        return self.mainMenuLabel
    }
    
    func getGameOverLabel() -> SKLabelNode{
        return self.gameOverLabel
    }
    
    func getScoreLabelGameOver() -> SKLabelNode{
        return self.scoreLabelGameOver
    }
    
    func getHighScoreLabel() -> SKLabelNode{
        return self.highScoreLabel
    }
    
}
