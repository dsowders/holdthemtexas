//
//  nameselectViewController.swift
//  texasholdem
//
//  Created by Student on 5/22/18.
//  Copyright © 2018 kartikchrisderick. All rights reserved.
//

import UIKit
var player1 = ""
var player2 = ""
var player3 = ""
var player4 = ""
class nameselectViewController: UIViewController {

    @IBOutlet weak var playerOneTextField: UITextField!
    @IBOutlet weak var playerTwoTextField: UITextField!
    @IBOutlet weak var playerThreeTextField: UITextField!
    @IBOutlet weak var playerFourTextField: UITextField!
    
    @IBOutlet weak var playerOneLab: UILabel!
    @IBOutlet weak var playerTwoLab: UILabel!
    @IBOutlet weak var playerThreeLab: UILabel!
    @IBOutlet weak var playerFourLab: UILabel!
    @IBOutlet weak var pressherebutton: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        playNowButton.isHidden = true
        pressherebutton.layer.cornerRadius = 20
        pressherebutton.clipsToBounds = true
        if(importantvar == 2)
        {
            playerThreeLab.isHidden = true
            playerFourLab.isHidden = true
            playerFourLab.isHidden = true
            playerThreeLab.isHidden = true
        }
        if(importantvar == 3)
        {
            playerFourLab.isHidden = true
            playerFourTextField.isHidden = true
        }
    }
    @IBOutlet weak var playNowButton: UIButton!
    
    @IBAction func playnow(_ sender: UIButton) {
        player1 = "\(playerOneTextField.text!)"
        player2 = "\(playerTwoTextField.text!)"
        player3 = "\(playerThreeTextField.text!)"
        player4 = "\(playerFourTextField.text!)"
        playNowButton.isHidden = false
    }
    


}
