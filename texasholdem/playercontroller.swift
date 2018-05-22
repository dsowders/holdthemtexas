//
//  playercontroller.swift
//  texasholdem
//
//  Created by yonk on 4/5/18.
//  Copyright © 2018 kartikchrisderick. All rights reserved.
//

import UIKit
var importantvar = 2
class playercontroller: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  
    @IBOutlet weak var numberofPlayersLabel: UILabel!
    
    @IBAction func plusButton(_ sender: UIButton) {
        if(importantvar + 1 > 4)
        {
            importantvar = 4
        }
        else
        {
        importantvar += 1
        }
        numberofPlayersLabel.text = "\(importantvar)"
    }
    @IBAction func subtractButton(_ sender: UIButton) {
       if(importantvar - 1 < 2)
       {
        importantvar = 2
    }
       else{
        importantvar -= 1
        }
        numberofPlayersLabel.text = "\(importantvar)"
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
