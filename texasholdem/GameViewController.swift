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

    
    @IBOutlet weak var leftCardImage: UIImageView!
    
    @IBOutlet weak var rightCardImage: UIImageView!
    
    
    
    
    
    
    
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
    
    func newCard(num : Int) -> Card
    {
        var newCard : Card = Card(numb: num)
        return newCard
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        leftCardImage.image = UIImage(named: "back")
        
        rightCardImage.image = UIImage(named: "back")
        
        
        //0 and 1 are the players cards and 2 to 6 are the boards card.
       
        
        var board: [Card] = [newCard(num: generateRandomNumber()), newCard(num: generateRandomNumber()), newCard(num: generateRandomNumber()), newCard(num: generateRandomNumber()), newCard(num: generateRandomNumber())]
        
        
        var playerOne: [Card] = [newCard(num: generateRandomNumber()), newCard(num: generateRandomNumber()), board[0], board[1], board[2], board[3], board[4]]
        
        var playerTwo: [Card] = [newCard(num: generateRandomNumber()), newCard(num: generateRandomNumber()), board[0], board[1], board[2], board[3], board[4]]
        var playerThree: [Card] = [newCard(num: generateRandomNumber()), newCard(num: generateRandomNumber()), board[0],board[1],board[2],board[3],board[4]]
        var playerFour: [Card] = [newCard(num: generateRandomNumber()), newCard(num: generateRandomNumber()), board[0],board[1],board[2],board[3],board[4]]
        
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
    
    // back is a placeholder until we know what the actual card will be
    @IBAction func rightCard(_ sender: UIButton) {
      leftCardImage.image = UIImage(named: "back")
    }
    
    @IBAction func leftCard(_ sender: UIButton) {
       rightCardImage.image = UIImage(named: "back")
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
        //2,3,4,5,6,7,8,9,10, 11, 12, 13, 14, 15
        // 0 = spades, 1 = clubs, 2 = hearts, 3 = diamonds
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
    var aceSpade : Card! = Card(name1: 15, suit1: 0)
    var aceDia : Card! = Card(name1: 15, suit1: 3)
    
    //how are we going to determine which one is the best
    //have an array for each player
    
    
    func checkSuit(player: Array<Card>) -> Bool
    {
        var c = 0
        var s = 0
        var d = 0
        var h = 0
        for i in 0...6
        {
            if (player[i].getSuit() == 0)
            {
                c += 1
            }
            if (player[i].getSuit() == 1)
            {
                s += 1
            }
            if (player[i].getSuit() == 2)
            {
                d += 1
            }
            if (player[i].getSuit() == 3)
            {
                h += 1
            }
        }
        if (c >= 5 || s >= 5 || d >= 5 || h >= 5)
        {
            return true
        }
        return false
    }
    func royalFlush(player: Array<Card>) -> Int
    {
        //use sortedPlayer
        var royalFlushCards: [Card] = [player[2], player[3], player[4], player[5], player[6]]
        var cardValues: [Int] = []
        for i in 2...6
        {
            cardValues.append(player[i].getName())
        }
        if (cardValues.contains(10) && cardValues.contains(11) && cardValues.contains(12) && cardValues.contains(13) && cardValues.contains(14))
        {
            if (checkSuit(player: royalFlushCards))
            {
                return 1
            }
        }
        return -1
        
    }
    func straightFlush(player: Array<Any>) -> Int
    {
        
    }
    func fourOfAKind(player: Array<Any>) -> Int
    {
    
    }
    func fullHouse(player: Array<Any>) -> Int
    {
        
    }
    func flush(player: Array<Any>) -> Int
    {
        
    }
    func straight(player: Array<Any>) -> Int
    {
        
    }
    func threeOfAKind(player: Array<Any>) -> Int
    {
        
    }
    func twoPair(player: Array<Any>) -> Int
    {
        
    }
    func onePair(player: Array<Any>) -> Int
    {
        
    }
    func highCard(player: Array<Any>) -> Int
    {
        
    }
    
    
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
