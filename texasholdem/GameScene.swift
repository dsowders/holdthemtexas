//
//  GameScene.swift
//  texasholdem
//
//  Created by yonk on 4/5/18.
//  Copyright © 2018 kartikchrisderick. All rights reserved.
//

import SpriteKit
import GameplayKit

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


class GameScene: SKScene {
    var arrayNumbers: [Int] = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51]
    var playerOneChips : Int = 0
    var playerTwoChips : Int = 0
    var playerThreeChips : Int = 0
    var playerFourChips : Int = 0
    
    var board: [Card] = []
    var playerOne: [Card] = []
    var playerTwo: [Card] = []
    var playerThree: [Card] = []
    var playerFour: [Card] = []
    var sortedPlayerOne: [Card] = []
    var sortedPlayerTwo: [Card] = []
    var sortedPlayerThree: [Card] = []
    var sortedPlayerFour: [Card] = []
    
    override func didMove(to view: SKView) {
       
    }

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
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
    
    func makeEverything()
    {
     board = [newCard(num: generateRandomNumber()), newCard(num: generateRandomNumber()), newCard(num: generateRandomNumber()), newCard(num: generateRandomNumber()), newCard(num: generateRandomNumber())]
    playerOne = [newCard(num: generateRandomNumber()), newCard(num: generateRandomNumber()), board[0], board[1], board[2], board[3], board[4]]
    
     playerTwo = [newCard(num: generateRandomNumber()), newCard(num: generateRandomNumber()), board[0], board[1], board[2], board[3], board[4]]
     playerThree = [newCard(num: generateRandomNumber()), newCard(num: generateRandomNumber()), board[0],board[1],board[2],board[3],board[4]]
     playerFour = [newCard(num: generateRandomNumber()), newCard(num: generateRandomNumber()), board[0],board[1],board[2],board[3],board[4]]
     sortedPlayerOne = [playerOne[0],playerOne[1],playerOne[2],playerOne[3],playerOne[4], playerOne[5],playerOne[6]]
     sortedPlayerTwo = [playerTwo[0],playerTwo[1],playerTwo[2],playerTwo[3],playerTwo[4], playerTwo[5], playerTwo[6]]
     sortedPlayerThree = [playerThree[0],playerThree[1],playerThree[2],playerThree[3],playerThree[4], playerThree[5],playerThree[6]]
     sortedPlayerFour = [playerFour[0],playerFour[1],playerFour[2],playerFour[3],playerFour[4],playerFour[5],playerFour[6]]
    }
        //0 and 1 are the players cards and 2 to 6 are the boards card.
        
        
    
    
    
    
    
  
    
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
