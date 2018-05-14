//
//  pokertableViewController.swift
//  texasholdem
//
//  Created by Student on 5/11/18.
//  Copyright © 2018 kartikchrisderick. All rights reserved.
//

import UIKit


class Card: NSObject
{
    var name1: Int
    var suit1: Int
    var num1: Int
    init(numb: Int)
    {
        self.num1 = numb
        self.name1 = ((numb / 4) + 2)
        self.suit1 = (numb % 4)
    }
    func getName() -> Int
    {
        return name1
    }
    func setName(num: Int)
    {
        name1 = num
    }
    func setSuit(num: Int)
    {
        suit1 = num
    }
    func getSuit() -> Int
    {
        return suit1
    }
    func getNum() -> Int
    {
        return num1
    }
}


class pokertableViewController: UIViewController {

    var arrayNumbers: [Int] = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51]
    
    //clubs
    //spades
    //hearts
    //diamonds
    
    var playerOneChips : Int = 0
    var playerTwoChips : Int = 0
    var playerThreeChips : Int = 0
    var playerFourChips : Int = 0
    
    @IBOutlet weak var cardOne: UIImageView!
    @IBOutlet weak var cardTwo: UIImageView!
    @IBOutlet weak var cardThree: UIImageView!
    @IBOutlet weak var cardFour: UIImageView!
    @IBOutlet weak var cardFive: UIImageView!
    
    
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
    
    var flippedOne = false
    var flippedTwo = false
    
    var images: [UIImage] = []
    
    var turn = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        
        images = [#imageLiteral(resourceName: "ace_of_clubs"),#imageLiteral(resourceName: "2_of_clubs"), #imageLiteral(resourceName: "3_of_clubs"),#imageLiteral(resourceName: "4_of_clubs"), #imageLiteral(resourceName: "5_of_clubs"),#imageLiteral(resourceName: "6_of_clubs"),#imageLiteral(resourceName: "7_of_clubs"),#imageLiteral(resourceName: "8_of_clubs"),#imageLiteral(resourceName: "9_of_clubs"),#imageLiteral(resourceName: "10_of_clubs"),#imageLiteral(resourceName: "jack_of_clubs2"),#imageLiteral(resourceName: "queen_of_clubs2"),#imageLiteral(resourceName: "king_of_clubs2"),#imageLiteral(resourceName: "ace_of_spades"),#imageLiteral(resourceName: "2_of_spades"),#imageLiteral(resourceName: "3_of_spades"),#imageLiteral(resourceName: "4_of_spades"),#imageLiteral(resourceName: "5_of_spades"),#imageLiteral(resourceName: "6_of_spades"),#imageLiteral(resourceName: "7_of_spades"),#imageLiteral(resourceName: "8_of_spades"),#imageLiteral(resourceName: "9_of_spades"),#imageLiteral(resourceName: "10_of_spades"),#imageLiteral(resourceName: "jack_of_spades2"),#imageLiteral(resourceName: "queen_of_spades2"),#imageLiteral(resourceName: "king_of_spades2"),#imageLiteral(resourceName: "ace_of_hearts"),#imageLiteral(resourceName: "2_of_hearts"),#imageLiteral(resourceName: "3_of_hearts"),#imageLiteral(resourceName: "3_of_hearts"),#imageLiteral(resourceName: "4_of_hearts"), #imageLiteral(resourceName: "5_of_hearts"),#imageLiteral(resourceName: "6_of_hearts"),#imageLiteral(resourceName: "7_of_hearts"),#imageLiteral(resourceName: "8_of_hearts"),#imageLiteral(resourceName: "9_of_hearts"),#imageLiteral(resourceName: "10_of_hearts"),#imageLiteral(resourceName: "jack_of_hearts2"),#imageLiteral(resourceName: "queen_of_hearts2"),#imageLiteral(resourceName: "king_of_hearts2"),#imageLiteral(resourceName: "ace_of_diamonds"),#imageLiteral(resourceName: "2_of_diamonds"),#imageLiteral(resourceName: "3_of_diamonds"),#imageLiteral(resourceName: "4_of_diamonds"),#imageLiteral(resourceName: "5_of_diamonds"),#imageLiteral(resourceName: "6_of_diamonds"),#imageLiteral(resourceName: "7_of_diamonds"),#imageLiteral(resourceName: "8_of_diamonds"),#imageLiteral(resourceName: "9_of_diamonds"),#imageLiteral(resourceName: "10_of_diamonds"),#imageLiteral(resourceName: "jack_of_diamonds2"),#imageLiteral(resourceName: "queen_of_diamonds2"),#imageLiteral(resourceName: "king_of_diamonds2")]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var playerCardOneA: UIButton!
    @IBAction func playerCardOne(_ sender: UIButton) {
        if flippedOne
        {
            playerCardOneA.image = 
        }
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
        var cardNums: [Int] = []
        for i in 0...6
        {
            cardNums.append(player[i].getNum())
        }
        if (cardNums.contains(51) && cardNums.contains(47) && cardNums.contains(43) && cardNums.contains(39) && cardNums.contains(35))
        {
            return 1
        }
        if (cardNums.contains(50) && cardNums.contains(46) && cardNums.contains(42) && cardNums.contains(38) && cardNums.contains(34))
        {
            return 1
        }
        if (cardNums.contains(49) && cardNums.contains(45) && cardNums.contains(41) && cardNums.contains(37) && cardNums.contains(33))
        {
            return 1
        }
        if (cardNums.contains(48) && cardNums.contains(44) && cardNums.contains(40) && cardNums.contains(36) && cardNums.contains(32))
        {
            return 1
        }
        return -1
        
    }
    func straightFlush(player: Array<Card>) -> Int
    {
        let temp : Card = Card(numb: 0)
        var tempArrayYuh: [Card] = []
        for i in 0...6
        {
            tempArrayYuh = []
            temp.setSuit(num: player[i].getSuit())
            for j in 0...6
            {
                if(player[i].getSuit() == player[j].getSuit())
                {
                    tempArrayYuh.append(player[j])
                }
                if(tempArrayYuh.count >= 5)
                {
                    break
                }
            }
        }
        var tempArray: [Int] = []
        for i in 0...tempArrayYuh.count
        {
            tempArray.append(tempArrayYuh[i].getName())
        }
        if (tempArray.contains(10) && tempArray.contains(11) && tempArray.contains(12) && tempArray.contains(13) && tempArray.contains(14))
        {
            return 14
        }
        if (tempArray.contains(10) && tempArray.contains(11) && tempArray.contains(12) && tempArray.contains(13) && tempArray.contains(9))
        {
            return 13
        }
        if (tempArray.contains(10) && tempArray.contains(11) && tempArray.contains(12) && tempArray.contains(8) && tempArray.contains(9))
        {
            return 12
        }
        if (tempArray.contains(10) && tempArray.contains(11) && tempArray.contains(7) && tempArray.contains(8) && tempArray.contains(9))
        {
            return 11
        }
        if (tempArray.contains(10) && tempArray.contains(9) && tempArray.contains(8) && tempArray.contains(7) && tempArray.contains(6))
        {
            return 10
        }
        if (tempArray.contains(9) && tempArray.contains(8) && tempArray.contains(7) && tempArray.contains(6) && tempArray.contains(5))
        {
            return 9
        }
        if (tempArray.contains(8) && tempArray.contains(7) && tempArray.contains(6) && tempArray.contains(5) && tempArray.contains(4))
        {
            return 8
        }
        if (tempArray.contains(7) && tempArray.contains(6) && tempArray.contains(5) && tempArray.contains(4) && tempArray.contains(3))
        {
            return 7
        }
        if (tempArray.contains(6) && tempArray.contains(5) && tempArray.contains(4) && tempArray.contains(3) && tempArray.contains(2))
        {
            return 6
        }
        if (tempArray.contains(2) && tempArray.contains(3) && tempArray.contains(4) && tempArray.contains(5) && tempArray.contains(14))
        {
            return 5
        }
        return -1
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
        for i in 0...6
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
    
    func determineWinner() -> Array<Int> //returns array of winners
    {
        var cardValues: [Int] = []
        cardValues = [royalFlush(player: sortedPlayerOne), royalFlush(player: sortedPlayerTwo), royalFlush(player: sortedPlayerThree), royalFlush(player: sortedPlayerFour)]
        var maxNum = cardValues.max()
        if (maxNum != -1)
        {
            let indexForPlayerWithMaxScore = cardValues.indices.filter { cardValues[$0] == maxNum }
            return indexForPlayerWithMaxScore
        }
        cardValues = []
        cardValues = [straightFlush(player: sortedPlayerOne), straightFlush(player: sortedPlayerTwo), straightFlush(player: sortedPlayerThree), straightFlush(player: sortedPlayerFour)]
        maxNum = cardValues.max()
        if (maxNum != -1)
        {
            let indexForPlayerWithMaxScore = cardValues.indices.filter { cardValues[$0] == maxNum }
            return indexForPlayerWithMaxScore
        }
        cardValues = []
        cardValues = [fourOfAKind(player: sortedPlayerOne), fourOfAKind(player: sortedPlayerTwo), fourOfAKind(player: sortedPlayerThree), fourOfAKind(player: sortedPlayerFour)]
        maxNum = cardValues.max()
        if (maxNum != -1)
        {
            let indexForPlayerWithMaxScore = cardValues.indices.filter { cardValues[$0] == maxNum }
            return indexForPlayerWithMaxScore
        }
        cardValues = []
        cardValues = [fullHouse(player: sortedPlayerOne), fullHouse(player: sortedPlayerTwo), fullHouse(player: sortedPlayerThree), fullHouse(player: sortedPlayerFour)]
        maxNum = cardValues.max()
        if (maxNum != -1)
        {
            let indexForPlayerWithMaxScore = cardValues.indices.filter { cardValues[$0] == maxNum }
            return indexForPlayerWithMaxScore
        }
        cardValues = []
        cardValues = [flush(player: sortedPlayerOne), flush(player: sortedPlayerTwo), flush(player: sortedPlayerThree), flush(player: sortedPlayerFour)]
        maxNum = cardValues.max()
        if (maxNum != -1)
        {
            let indexForPlayerWithMaxScore = cardValues.indices.filter { cardValues[$0] == maxNum }
            return indexForPlayerWithMaxScore
        }
        cardValues = []
        cardValues = [straight(player: sortedPlayerOne), straight(player: sortedPlayerTwo), straight(player: sortedPlayerThree), straight(player: sortedPlayerFour)]
        maxNum = cardValues.max()
        if (maxNum != -1)
        {
            let indexForPlayerWithMaxScore = cardValues.indices.filter { cardValues[$0] == maxNum }
            return indexForPlayerWithMaxScore
        }
        cardValues = []
        cardValues = [threeOfAKind(player: sortedPlayerOne), threeOfAKind(player: sortedPlayerTwo), threeOfAKind(player: sortedPlayerThree), threeOfAKind(player: sortedPlayerFour)]
        maxNum = cardValues.max()
        if (maxNum != -1)
        {
            let indexForPlayerWithMaxScore = cardValues.indices.filter { cardValues[$0] == maxNum }
            return indexForPlayerWithMaxScore
        }
        cardValues = []
        cardValues = [twoPair(player: sortedPlayerOne), twoPair(player: sortedPlayerTwo), twoPair(player: sortedPlayerThree), twoPair(player: sortedPlayerFour)]
        maxNum = cardValues.max()
        if (maxNum != -1)
        {
            let indexForPlayerWithMaxScore = cardValues.indices.filter { cardValues[$0] == maxNum }
            return indexForPlayerWithMaxScore
        }
        cardValues = []
        cardValues = [onePair(player: sortedPlayerOne), onePair(player: sortedPlayerTwo), onePair(player: sortedPlayerThree), onePair(player: sortedPlayerFour)]
        maxNum = cardValues.max()
        if (maxNum != -1)
        {
            let indexForPlayerWithMaxScore = cardValues.indices.filter { cardValues[$0] == maxNum }
            return indexForPlayerWithMaxScore
        }
        cardValues = []
        cardValues = [highCard(player: sortedPlayerOne), highCard(player: sortedPlayerTwo), highCard(player: sortedPlayerThree), highCard(player: sortedPlayerFour)]
        maxNum = cardValues.max()
        if (maxNum != -1)
        {
            let indexForPlayerWithMaxScore = cardValues.indices.filter { cardValues[$0] == maxNum }
            return indexForPlayerWithMaxScore
        }
        
        
        return []
        
    }
    
}
