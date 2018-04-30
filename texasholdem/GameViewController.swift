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
        
        //we are going to use this array to check what cards have been randomly generated.
        //set the position that we have used to negative one. check on whether or not the value is negativ

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

    

    
    //how are we going to determine which one is the best
    //have an array for each player
    
    
    
   // func straightFlush(player: Array<Any>) -> Int
    //{
        
   // }
    //func fourOfAKind(player: Array<Any>) -> Int
    //{
    
   // }
    //func fullHouse(player: Array<Any>) -> Int
    //{
        
    //}
    //func flush(player: Array<Any>) -> Int
    //{
        
    //}
    //func straight(player: Array<Any>) -> Int
    //{
    
    //}
    //func threeOfAKind(player: Array<Any>) -> Int
    //{
        
    //}
    //func twoPair(player: Array<Any>) -> Int
    //{
        
    //}
    //func onePair(player: Array<Any>) -> Int
    //{
        
    //}
    //func highCard(player: Array<Card>) -> Int
    //{
        
    //}
    
    
    //override var prefersStatusBarHidden: Bool {
    //    return true
    //}
}
