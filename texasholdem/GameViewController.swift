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
        var name: Int
        var suit: Int
        // var image: UIImage
        init(name1: Int, suit1: Int)
        {
            name.self = name1
            suit.self = suit1
            
        }
        //2,3,4,5,6,7,8,9,10, Jack, Queen, King, Ace
        //2,3,4,5,6,7,8,9,10, 11, 12, 13, 14, 15
        func getName() -> Int
        {
            return name
        }
        func setName(num: Int)
        {
            name = num
        }
        func getSuit() -> Int
        {
            return suit
        }
        func setSuit(num: Int)
        {
            suit = num
        }
    }
    var aceSpade : Card! = Card(name1: 0, suit1: 0)
    var aceDia : Card! = Card(name1: 0, suit1: 0)
    
    //how are we going to determine which one is the best
    //have an array for each player
    
    
    
    func royalFlush(playerOne: Array<Any>, playerTwo: Array<Any>)
    {
        playerOne[0].getCard
    }
    
    func straightFlush()
    {
    
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
