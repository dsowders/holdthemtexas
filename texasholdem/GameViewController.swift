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
var arrayNumbers: [Int] = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51]

class GameViewController: UIViewController {

    func checkForNegative(num: Int, arr: Array<Int>) -> Bool
    {
        if(arr[num] == -1)
        {
            return true
        }
        return false
    }
    func generateRandomNumber() -> Int
    {
        var num = Int(arc4random_uniform(52))
        
        if(arrayNumbers[num] == -1)
        {
            return generateRandomNumber()
        }
        else
        {
            arrayNumbers[num] = -1
        }
        return num
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //0 and 1 are the players cards and 2 to 6 are the boards card.
        var board: [Card] = []
        var playerOne: [Card] = []
        var playerTwo: [Card] = []
        var playerThree: [Card] = []
        var playerFour: [Card] = []
        
        var playerOneCardOne : Card! = Card(genearteRandomNumber())
        var playerOneCardTwo : Card! = Card(generateRandomNumber())
        
       playerOne[] = [playerOneCardOne,playerTwoCardTwo, board[0], board[1],board[2], board[3], board[4]]
        
        //we are going to use this array to check what cards have been randomly generated.
        //set the position that we have used to negative one. check on whether or not the value is negative.
        
        var tempNum = 52
        
        
        
        
        
        
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
        var name1: Int
        var suit1: Int
        
        
        // var image: UIImage
        //0,1,2,3,4,5,6,7,8...50,51
        //twoOfClubs,twoOfSpades,twoOfDiamonds,twoOfHearts,threeOfClubs,threeOfSpades,threeOfDiamonds,threeOfHearts
        //fourOfClubs...aceOfDiamonds,aceOfHearts
        init(numb: Int)
        {
            self.name1 = ((numb / 4) + 2)
            self.suit1 = (numb % 4)
        }
        //2,3,4,5,6,7,8,9,10, Jack, Queen, King, Ace
        //2,3,4,5,6,7,8,9,10, 11, 12, 13, 14
        //these are the names^^
        func getName() -> Int
        {
            return name1
        }
        func setName(num: Int)
        {
            name1 = num
        }
        //clubs, spades, diamonds, hearts
        //0,1,2,3
        //these are the suits^^
        func setSuit(num: Int)
        {
            suit1 = num
        }
        func getSuit() -> Int
        {
            return suit1
        }
    }
   
    //this is what we are going to do 
    
    //how are we going to determine which one is the best
    //have an array for each player
    
    
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
