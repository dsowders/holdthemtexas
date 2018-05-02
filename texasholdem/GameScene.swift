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
    
    var dealerCardOne = SKSpriteNode()
    
    //put this make everything function i think
    
    
    var board: [Card] = []
    var playerOne: [Card] = []
    var playerTwo: [Card] = []
    var playerThree: [Card] = []
    var playerFour: [Card] = []
    var sortedPlayerOne: [Card] = []
    var sortedPlayerTwo: [Card] = []
    var sortedPlayerThree: [Card] = []
    var sortedPlayerFour: [Card] = []
    var playerOneBalance = 100
    var playerTwoBalance = 100
    var playerThreeBalance = 100
    var playerFourBalance = 100
    var totalPot = 0
    var playerCount = 0
    
    @IBOutlet weak var raiseText: UITextField!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var leftCardImage: UIImageView!
    @IBOutlet weak var rightCardImage: UIImageView!
    
    @IBAction func raiseButton(_ sender: UIButton) {
        if playerCount == 0
        {
            playerOneBalance = playerOneBalance - (Int(raiseText.text!)!)
            balanceLabel.text = (String(playerOneBalance))
        }
        if playerCount == 1
        {
            playerTwoBalance = playerTwoBalance - (Int(raiseText.text!)!)
            balanceLabel.text = (String(playerTwoBalance))
        }
        if playerCount == 2
        {
            playerThreeBalance = playerThreeBalance - (Int(raiseText.text!)!)
            balanceLabel.text = (String(playerThreeBalance))
        }
        if playerCount == 3
        {
            playerFourBalance = playerFourBalance - (Int(raiseText.text!)!)
            balanceLabel.text = (String(playerFourBalance))
        }
        totalPot = totalPot + (Int(raiseText.text!)!)
    }
    @IBAction func checkButton(_ sender: UIButton) {
    }
    @IBAction func callButton(_ sender: UIButton) {
        totalPot = totalPot + 2
        if playerCount == 0
        {
            playerOneBalance = playerOneBalance - 2
            balanceLabel.text = (String(playerOneBalance))
        }
        if playerCount == 1
        {
            playerTwoBalance = playerTwoBalance - 2
            balanceLabel.text = (String(playerTwoBalance))
        }
        if playerCount == 2
        {
            playerThreeBalance = playerThreeBalance - 2
            balanceLabel.text = (String(playerThreeBalance))
        }
        if playerCount == 3
        {
            playerFourBalance = playerFourBalance - 2
            balanceLabel.text = (String(playerFourBalance))
        }
    }
    
    // methods changing image of back of cards to the actual card image the object will relate to
    // back is a placeholder until we know what the actual card will be
    @IBAction func rightCard(_ sender: UIButton) {
        leftCardImage.image = UIImage(named: "back")
    }
    @IBAction func leftCard(_ sender: UIButton) {
        rightCardImage.image = UIImage(named: "back")
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for touch in touches
        {
            let location = touch.location(in: self)
            if(dealerCardOne.frame.contains(location))
            {
                dealerCardOne.color = .blue
            }
        }
    }
    
    override func didMove(to view: SKView) {
       makeEverything()
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
        let num = Int(arc4random_uniform(52))
        
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
        let newCard : Card = Card(numb: num)
        return newCard
    }
    
    
    func partition(v: [Card], left: Int, right: Int) -> Int {
        var i = left
        let temp : Card = Card(numb: 0)
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
        dealerCardOne = self.childNode(withName: "dealerCardOne") as! SKSpriteNode
     board = [newCard(num: generateRandomNumber()), newCard(num: generateRandomNumber()), newCard(num: generateRandomNumber()), newCard(num: generateRandomNumber()), newCard(num: generateRandomNumber())]
    playerOne = [newCard(num: generateRandomNumber()), newCard(num: generateRandomNumber()), board[0], board[1], board[2], board[3], board[4]]
    
     playerTwo = [newCard(num: generateRandomNumber()), newCard(num: generateRandomNumber()), board[0], board[1], board[2], board[3], board[4]]
     playerThree = [newCard(num: generateRandomNumber()), newCard(num: generateRandomNumber()), board[0],board[1],board[2],board[3],board[4]]
     playerFour = [newCard(num: generateRandomNumber()), newCard(num: generateRandomNumber()), board[0],board[1],board[2],board[3],board[4]]
     sortedPlayerOne = [playerOne[0],playerOne[1],playerOne[2],playerOne[3],playerOne[4], playerOne[5],playerOne[6]]
     sortedPlayerTwo = [playerTwo[0],playerTwo[1],playerTwo[2],playerTwo[3],playerTwo[4], playerTwo[5], playerTwo[6]]
     sortedPlayerThree = [playerThree[0],playerThree[1],playerThree[2],playerThree[3],playerThree[4], playerThree[5],playerThree[6]]
     sortedPlayerFour = [playerFour[0],playerFour[1],playerFour[2],playerFour[3],playerFour[4],playerFour[5],playerFour[6]]
        
        quicksort(c: sortedPlayerOne, a: 0, b: 6)
        quicksort(c: sortedPlayerTwo, a: 0, b: 6)
        quicksort(c: sortedPlayerThree, a: 0, b: 6)
        quicksort(c: sortedPlayerFour, a: 0, b: 6)
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
        let royalFlushCards: [Card] = [player[2], player[3], player[4], player[5], player[6]]
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
    func fourOfAKind(player: Array<Card>) -> Int
    {
        for i in 6...3
        {
            if (player[i].getName() == player[i - 1].getName() && player[i].getName() == player[i - 2].getName() && player[i].getName() == player[i - 3].getName())
            {
                return player[i].getName()
            }
        }
        return -1
    }
    func fullHouse(player: Array<Card>) -> Int
    {
        let threeKindNum = threeOfAKind(player: player)
        if threeKindNum == -1
        {
            return -1
        }
        var cardValues: [Int] = []
        for i in 0...6
        {
            cardValues.append(player[i].getName())
        }
        cardValues = cardValues.filter{$0 != threeKindNum}
        let twoKindNum = onePair(player: player)
        if twoKindNum == -1
        {
            return -1
        }
        return threeKindNum
    }
    func flush(player: Array<Card>) -> Int //there are five of the same suit check to
    {
        let temp : Card = Card(numb: 0)
        for i in 0...6
        {
            var tempArray: [Card] = []
            temp.setSuit(num: player[i].getSuit())
            for j in 0...6
            {
                if(player[i].getSuit() == player[j].getSuit())
                {
                    tempArray.append(player[j])
                }
                if(tempArray.count >= 5)
                {
                    return tempArray[tempArray.count - 1].getName()
                }
            }
        }
        return -1
    }
    func straight(player: Array<Card>) -> Int
    {
        var cardValues: [Int] = []
        for i in 2...6
        {
            cardValues.append(player[i].getName())
        }
        if (cardValues.contains(10) && cardValues.contains(11) && cardValues.contains(12) && cardValues.contains(13) && cardValues.contains(14))
        {
            return 14
        }
        if (cardValues.contains(10) && cardValues.contains(11) && cardValues.contains(12) && cardValues.contains(13) && cardValues.contains(9))
        {
            return 13
        }
        if (cardValues.contains(10) && cardValues.contains(11) && cardValues.contains(12) && cardValues.contains(8) && cardValues.contains(9))
        {
            return 12
        }
        if (cardValues.contains(10) && cardValues.contains(11) && cardValues.contains(7) && cardValues.contains(8) && cardValues.contains(9))
        {
            return 11
        }
        if (cardValues.contains(10) && cardValues.contains(9) && cardValues.contains(8) && cardValues.contains(7) && cardValues.contains(6))
        {
            return 10
        }
        if (cardValues.contains(9) && cardValues.contains(8) && cardValues.contains(7) && cardValues.contains(6) && cardValues.contains(5))
        {
            return 9
        }
        if (cardValues.contains(8) && cardValues.contains(7) && cardValues.contains(6) && cardValues.contains(5) && cardValues.contains(4))
        {
            return 8
        }
        if (cardValues.contains(7) && cardValues.contains(6) && cardValues.contains(5) && cardValues.contains(4) && cardValues.contains(3))
        {
            return 7
        }
        if (cardValues.contains(6) && cardValues.contains(5) && cardValues.contains(4) && cardValues.contains(3) && cardValues.contains(2))
        {
            return 6
        }
        if (cardValues.contains(2) && cardValues.contains(3) && cardValues.contains(4) && cardValues.contains(5) && cardValues.contains(14))
        {
            return 5
        }
        return -1
    }
    func threeOfAKind(player: Array<Card>) -> Int
    {
        for i in 6...2
        {
            if (player[i].getName() == player[i - 1].getName() && player[i].getName() == player[i - 2].getName())
            {
                return player[i].getName()
            }
        }
        return -1
    }
    func twoPair(player: Array<Card>) -> Int
    {
        var a = -1
        var b = -1
        for i in 6...1
        {
            if (player[i].getName() == player[i - 1].getName())
            {
                a = i
            }
        }
        for i in a...1
        {
            if (player[i].getName() == player[i - 1].getName())
            {
                b = i
            }
        }
        if (b != -1)
        {
            return player[a].getName()
        }
        else
        {
            return -1
        }
    }
    func onePair(player: Array<Card>) -> Int
    {
        for i in 6...1
        {
            if (player[i].getName() == player[i - 1].getName())
            {
                return player[i].getName()
            }
        }
        return -1
    }
    func highCard(player: Array<Card>) -> Int
    {
        return player[6].getName()
    }
    
    
    //override var prefersStatusBarHidden: Bool {
    //    return true
    //}
}
