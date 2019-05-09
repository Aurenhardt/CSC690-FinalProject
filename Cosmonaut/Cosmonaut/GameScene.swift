//
//  GameScene.swift
//  Cosmonaut
//
//  Created by Christian Gomez on 4/26/19.
//  Copyright © 2019 Christian Gomez. All rights reserved.
//

import SpriteKit
import GameplayKit

// MARK! Globals
struct PhysicsCategories {
    static let None: UInt32 = 0
    static let Player: UInt32 = 0b1 //1
    static let Bullet: UInt32 = 0b10 //2
    static let Enemy: UInt32 = 0b100 //4
}

enum gameState{
    case preGame //when the game state is before the start of the game
    case inGame //when the game state is during the game
    case afterGame //when the game state is after the game
}

var gameScore: Int = 0

let defaults = UserDefaults()

var selectedShipType:Int = defaults.integer(forKey: "userShipType")



class GameScene: SKScene, SKPhysicsContactDelegate{
    
    var background = SKSpriteNode(imageNamed: "background")
    var player = PlayerShip(shipType: selectedShipType)
    var gameArea = CGRect()
    var currentGameState = gameState.preGame
    var enemySpawner = EnemySpawner()
    var labelManager = LabelManager()
    var levelNumber = 0
    var livesNumber = 3
    var bgNum:Int = 1;
    var isValid = false;
    var backgroundFrames: [SKTexture] = []
    
    let explosionSound = SKAction.playSoundFileNamed("8-Bit-SFX_Explosion_02.mp3", waitForCompletion: false)
    let bulletSound = SKAction.playSoundFileNamed("Laser_Shoot7.wav", waitForCompletion: false)
    let selectSound = SKAction.playSoundFileNamed("Beep8.wav", waitForCompletion: false)
    
    
    let scaleUp = SKAction.scale(to: 1.20, duration: 0.5)
    let scaleDown = SKAction.scale(to: 1, duration: 0.5)
    var scaleSequence:SKAction = SKAction.sequence([])
    
    override func didMove(to view: SKView) {
        
        self.scaleSequence = SKAction.repeatForever(SKAction.sequence([self.scaleUp, self.scaleDown]))
        
        self.physicsWorld.contactDelegate = self
        
        var i = 32
        while(i>1){
            let bgTexture = SKTexture(imageNamed: "background\(i)")
            self.backgroundFrames.append(bgTexture)
            
            i = i - 1
        }
        
        

        self.background.size = self.size
        self.background.name = "Background"
        self.background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        self.background.zPosition = 0
        let animateBackground = SKAction.animate(with: backgroundFrames, timePerFrame: 0.03)
        self.background.run(SKAction.repeatForever(animateBackground))
        self.addChild(self.background)
        
        
        player.getShipSprite().position = CGPoint(x: self.size.width/2, y: 0 - self.size.height)
        self.addChild(player.getShipSprite())
        
        self.labelManager.setHeightWidth(screenHeight: self.size.height, screenWidth: self.size.width)
        
        self.labelManager.getScoreLabel().position = CGPoint(x: self.size.width*0.21,y: self.size.height*0.9)
        self.labelManager.getLivesLabel().position = CGPoint(x: self.size.width*0.80,y: self.size.height*0.9)
        self.labelManager.getTapToStartLabel().position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        self.labelManager.getTapToStartLabel().run(scaleSequence)
        //tapToStartLabel.position = CGPoint(x: screenWidth/2, y: screenHeight/2)
        
        self.addChild(self.labelManager.getScoreLabel())
        self.addChild(self.labelManager.getLivesLabel())
        self.addChild(self.labelManager.getTapToStartLabel())
        
        let fadeInAction = SKAction.fadeIn(withDuration: 0.3)
        self.labelManager.getTapToStartLabel().run(fadeInAction)


        
    }
    
    
    func startGame(){
        
        currentGameState = gameState.inGame

        self.isValid = true;
        
        gameScore = 0
        let fadeOutAction = SKAction.fadeOut(withDuration: 0.5)
        let deleteAction = SKAction.removeFromParent()
        let deleteSequence = SKAction.sequence([selectSound,fadeOutAction,deleteAction])
        labelManager.getTapToStartLabel().run(deleteSequence)
        
        let moveShipOntoScreenAction = SKAction.moveTo(y: self.size.height*0.2, duration: 0.5)
        let startLevelAction = SKAction.run(startNewLevel)
        let startGameSequence = SKAction.sequence([moveShipOntoScreenAction,startLevelAction])
        player.getShipSprite().run(startGameSequence)
        
    }
    
    func loseALife()->Void{
        livesNumber -= 1
        self.labelManager.getLivesLabel().text = "Lives:\(livesNumber)"
        
        let scaleUp = SKAction.scale(to: 1.5, duration: 0.2)
        let scaleDown = SKAction.scale(to: 1, duration: 0.2)
        let scaleLives = SKAction.sequence([scaleUp,scaleDown])
         self.labelManager.getLivesLabel().run(scaleLives)
        
        if livesNumber == 0{
            runGameOver()
            
        }
        
        
    }
    
    func addScore(){
        gameScore += 1
        self.labelManager.getScoreLabel().text = "Score: \(gameScore)"
        

        if gameScore == 10 || gameScore == 25 || gameScore == 50{
            startNewLevel()
        }
        
    }
    
    func runGameOver(){ //generate list of all bullet and enemy objects and freeze them
        currentGameState = gameState.afterGame
        
        self.isValid = false;
        
        self.removeAllActions()
        self.enumerateChildNodes(withName: "Bullet"){
            bullet, stop in
            bullet.removeAllActions()
        }
        
        self.enumerateChildNodes(withName: "Enemy"){
            enemy, stop in
            enemy.removeAllActions()
        }
        
    
        let changeSceneAction = SKAction.run{self.changeScene()}
        let waitToChangeScene = SKAction.wait(forDuration: 1)
        let changeSceneSequence = SKAction.sequence([waitToChangeScene,changeSceneAction])
        self.run(changeSceneSequence)
        
    }
    
    func changeScene(){
        let sceneToMoveTo = GameOverScene(size: self.size)
        sceneToMoveTo.scaleMode = self.scaleMode
        let myTransition = SKTransition.fade(withDuration: 0.5)
        self.view?.presentScene(sceneToMoveTo,transition: myTransition)
    }
    
    // MARK: Init Setup
    override init(size:CGSize){
        
        let maxAspectRatio: CGFloat = 16.0/9.0
        let playableWidth = size.height/maxAspectRatio
        let margin = (size.width-playableWidth)/2
        gameArea = CGRect(x: margin, y: 0, width: playableWidth, height: size.height)
        super.init(size:size)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Game Functions
    
    func startNewLevel(){
        
        self.levelNumber += 1
        
        if self.action(forKey: "spawningEnemies") != nil{
            self.removeAction(forKey: "spawningEnemies")
        }
        
        var levelDuration = TimeInterval()
        
        switch levelNumber{
        case 1: levelDuration = 1.2
        case 2: levelDuration = 1
        case 3: levelDuration = 0.8
        case 4: levelDuration = 0.5
        default:
            levelDuration = 0.5
            print("Cannot find level info")
        }
        
        let spawn = SKAction.run(spawnEnemy)
        let waitToSpawn = SKAction.wait(forDuration: levelDuration)
        let spawnSequence = SKAction.sequence([waitToSpawn,spawn])
        let spawnForever = SKAction.repeatForever(spawnSequence)
        self.run(spawnForever,withKey: "spawningEnemies")
    }

    func spawnExplosion(spawnPosition: CGPoint){
        let explosion = SKSpriteNode(imageNamed: "explosion")
        explosion.position = spawnPosition
        explosion.zPosition = 3
        explosion.setScale(2)
        
        self.addChild(explosion)
        
        let scaleIn = SKAction.scale(to: 1, duration: 0.1)
        let fadeOut = SKAction.fadeOut(withDuration: 0.1)
        let delete = SKAction.removeFromParent()
        
        let explosionSequence = SKAction.sequence([explosionSound,scaleIn, fadeOut, delete])
        explosion.run(explosionSequence)
        
    }
    
    func fireBullet() -> Void {
        var bullet = SKSpriteNode(imageNamed: "Bullet")
        if player.shipType == 0{
            bullet = SKSpriteNode(imageNamed: "Bullet")
        }else if(player.shipType == 1){
            bullet = SKSpriteNode(imageNamed: "BroadsiderBullet")
            bullet.setScale(1.5)
        }else if(player.shipType == 2){
            bullet = SKSpriteNode(imageNamed: "QuickshotBullet")
            bullet.setScale(1)
        }else if(player.shipType == 3){
            bullet = SKSpriteNode(imageNamed: "SDWBullet")
            bullet.setScale(2)
        }else{
            bullet = SKSpriteNode(imageNamed: "Bullet")
            bullet.setScale(1)
        }
        //let bullet = SKSpriteNode(imageNamed: "Bullet")//replace with getBullet.
        
        bullet.position = player.getShipSprite().position
        bullet.zPosition = 1
        bullet.physicsBody =  SKPhysicsBody(rectangleOf: bullet.size)
        bullet.physicsBody?.affectedByGravity = false
        
        bullet.physicsBody?.categoryBitMask = PhysicsCategories.Bullet
        bullet.physicsBody?.collisionBitMask = PhysicsCategories.None
        bullet.physicsBody?.contactTestBitMask = PhysicsCategories.Enemy
        
        let moveBullet = SKAction.moveTo(y: self.size.height + player.getShipSprite().size.height, duration: 1)
        let deleteBullet = SKAction.removeFromParent()
        let bulletSequence = SKAction.sequence([bulletSound,moveBullet,deleteBullet])
        bullet.run(bulletSequence)
        self.addChild(bullet)
    }
    
    

    func spawnEnemy(){
        let startPoint = enemySpawner.getStartPoint(screenHeight: self.size.height, minX: gameArea.minX, maxX: gameArea.maxX)
        let endPoint = enemySpawner.getEndPoint(screenHeight: self.size.height, minX: gameArea.minX, maxX: gameArea.maxX)
        let enemy = EnemyShip(startPoint: startPoint, endPoint: endPoint)
        enemy.getShipSprite().position = startPoint
        
        self.addChild(enemy.getShipSprite())
        
        let moveEnemy = SKAction.move(to: endPoint, duration: 1.5)
        let deleteEnemy = SKAction.removeFromParent()
        let loseALifeAction = SKAction.run(loseALife)
        let enemySequence = SKAction.sequence([moveEnemy,deleteEnemy,loseALifeAction])
        
        if currentGameState == gameState.inGame{
            enemy.getShipSprite().run(enemySequence)
        }

        

        
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        var body1 = SKPhysicsBody()
        var body2 = SKPhysicsBody()
        
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask{ //checks numerical order of physics cat
            body1 = contact.bodyA //whatever has the lower category number assign to body1, larger body 2
            body2 = contact.bodyB
        }else{
            body1 = contact.bodyB
            body2 = contact.bodyA
            
        }
        
        if body1.categoryBitMask == PhysicsCategories.Player && body2.categoryBitMask == PhysicsCategories.Enemy{
            //if the player has hit an enemy
            
            if body1.node != nil{ //replace with guard lets later maybe?
                guard let body1Position = body1.node?.position else{
                    return
                }
                spawnExplosion(spawnPosition: body1Position)
            }
            
            if body2.node != nil{
                guard let body2Position = body2.node?.position else{
                    return
                }
                spawnExplosion(spawnPosition: body2Position)
                
            }
            
            body1.node?.removeFromParent()
            body2.node?.removeFromParent()
            
            runGameOver()
            
            
        }
        
        guard let body2NodePositionY = body2.node?.position.y else {
            return
        }
        
        guard let body2NodePosition = body2.node?.position else {
            return
        }
        
        if body1.categoryBitMask == PhysicsCategories.Bullet && body2.categoryBitMask == PhysicsCategories.Enemy  && (body2NodePositionY)<self.size.height{
            //if the bullet has hit an enemy
            
            addScore() //increment score
            
            if body2.node != nil{
                spawnExplosion(spawnPosition: body2NodePosition)
            }
            
            body1.node?.removeFromParent()
            body2.node?.removeFromParent()
            
            
        }
    }
    
    
    
    
    
    
    
    
    //MARK: Touch Functions
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if currentGameState == gameState.preGame{
            startGame()
        }else if currentGameState == gameState.inGame{
            fireBullet()
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch: AnyObject in touches{
            let pointOfTouch = touch.location(in: self)
            let previousPointOfTouch = touch.previousLocation(in: self)
            
            let amountDragged = pointOfTouch.x - previousPointOfTouch.x
            
            
            if currentGameState == gameState.inGame{
                
                player.getShipSprite().position.x = player.getShipSprite().position.x + amountDragged
                
                if player.getShipSprite().position.x > gameArea.maxX - player.getShipSprite().size.width{
                    player.getShipSprite().position.x = gameArea.maxX - player.getShipSprite().size.width
                }
                
                if player.getShipSprite().position.x < gameArea.minX + player.getShipSprite().size.width{
                    player.getShipSprite().position.x = gameArea.minX + player.getShipSprite().size.width
                }
            }
        }
        
    }
    
}
