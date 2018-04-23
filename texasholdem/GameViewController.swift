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
    
    func newCard(num : Int) -> Card
    {
        var newCard : Card = Card(numb: num)
        return newCard
    }
    
    
    func partition(v: [Card], left: Int, right: Int) -> Int {
        var i = left
        var temp : Card = Card(numb: 0)
        for j in (left)...(right) {
            if v[j].getName() < v[left].getName() {
                i += 1
                temp.setSuit(num: v[i].getSuit())
                temp.setName(num: v[i].getName())
                v[i].setName(num: v[j].getName())
                v[i].setSuit(num: v[j].getSuit())
                v[j].setName(num: temp.getName())
                v[j].setSuit(num: temp.getSuit())
            }
        }
        
        temp.setSuit(num: v[i].getSuit())
        temp.setName(num: v[i].getName())
        v[i].setSuit(num: v[left].getSuit())
        v[i].setName(num: v[left].getName())
        v[left].setSuit(num: temp.getSuit())
        v[left].setName(num: temp.getName())
        return i
    }
    
    func quicksort(c: [Card], a: Int, b: Int) {
        if b > a {
            let pivotIndex = partition(v: c, left: a, right: b)
            quicksort(c: c, a: a, b: pivotIndex - 1)
            quicksort(c: c, a: pivotIndex + 1, b: b)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //0 and 1 are the players cards and 2 to 6 are the boards card.
       
        
        var board: [Card] = [newCard(num: generateRandomNumber()), newCard(num: generateRandomNumber()), newCard(num: generateRandomNumber()), newCard(num: generateRandomNumber()), newCard(num: generateRandomNumber())]
        
        
        var playerOne: [Card] = [newCard(num: generateRandomNumber()), newCard(num: generateRandomNumber()), board[0], board[1], board[2], board[3], board[4]]
        
        var playerTwo: [Card] = [newCard(num: generateRandomNumber()), newCard(num: generateRandomNumber()), board[0], board[1], board[2], board[3], board[4]]
        var playerThree: [Card] = [newCard(num: generateRandomNumber()), newCard(num: generateRandomNumber()), board[0],board[1],board[2],board[3],board[4]]
        var playerFour: [Card] = [newCard(num: generateRandomNumber()), newCard(num: generateRandomNumber()), board[0],board[1],board[2],board[3],board[4]]
        var sortedPlayerOne: [Card] = [playerOne[0],playerOne[1],playerOne[2],playerOne[3],playerOne[4], playerOne[5],playerOne[6]]
        var sortedPlayerTwo: [Card] = [playerTwo[0],playerTwo[1],playerTwo[2],playerTwo[3],playerTwo[4], playerTwo[5], playerTwo[6]]
        var sortedPlayerThree: [Card] = [playerThree[0],playerThree[1],playerThree[2],playerThree[3],playerThree[4], playerThree[5],playerThree[6]]
        var sortedPlayerFour: [Card] = [playerFour[0],playerFour[1],playerFour[2],playerFour[3],playerFour[4],playerFour[5],playerFour[6]]
        quicksort(c: sortedPlayerOne, a: 0, b: 6)
        quicksort(c: sortedPlayerTwo, a: 0, b: 6)
        quicksort(c: sortedPlayerThree, a: 0, b: 6)
        quicksort(c: sortedPlayerFour, a: 0, b: 6)
        
        print(playerOne[0])
        print(playerOne[1])
        print(playerOne[2])
        print(playerOne[3])
        print(playerOne[4])
        print(playerOne[5])
        print(playerOne[6])
       
        
        print()
        
        print(sortedPlayerOne[0])
        print(sortedPlayerOne[1])
        print(sortedPlayerOne[2])
        print(sortedPlayerOne[3])
        print(sortedPlayerOne[4])
        print(sortedPlayerOne[5])
        print(sortedPlayerOne[6])
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
