//
//  GameViewController.swift
//  texasholdem
//
//  Created by yonk on 4/5/18.
//  Copyright © 2018 kartikchrisderick. All rights reserved.
//  comment

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var playerOne: [Card] = []
        var playerTwo: [Card] = []
        var playerThree: [Card] = []
        var playerFour: [Card] = []
        
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    class Card: NSObject
    {
        var card: Int
        
        
        // var image: UIImage
        init(name1: Int)
        {
            card.self = name1
            
            
        }
        //2,3,4,5,6,7,8,9,10, Jack, Queen, King, Ace
        //2,3,4,5,6,7,8,9,10, 11, 12, 13, 14
        func setCard(num: Int)
        {
            card = num
        }
        func getCard() -> Int
        {
            return card
        }
    }
    var aceSpade : Card! = Card(name1: 0)
    var aceDia : Card! = Card(name1: 0)
    
    //how are we going to determine which one is the best
    //have an array for each player
    
    func createCard(int )
    
    func royalFlush(player: Array<Any>)
    {
        
    }
    func straightFlush(player: Array<Any>)
    {
        
    }
    func fourOfAKind(player: Array<Any>)
    {
    
    }
    func fullHouse(player: Array<Any>)
    {
        
    }
    func flush(player: Array<Any>)
    {
        
    }
    func straight(player: Array<Any>)
    {
        
    }
    func threeOfAKind(player: Array<Any>)
    {
        
    }
    func twoPair(player: Array<Any>)
    {
        
    }
    func onePair(player: Array<Any>)
    {
        
    }
    func highCard(player: Array<Any>)
    {
        
    }
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
