//
//  ViewController.swift
//  DiceGame
//
//  Created by 강보현 on 2022/12/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var diceLeft: UIImageView!
    @IBOutlet weak var diceRight: UIImageView!
    
    var diceArray: [UIImage] = [#imageLiteral(resourceName: "black1"), #imageLiteral(resourceName: "black2"), #imageLiteral(resourceName: "black3"), #imageLiteral(resourceName: "black4"), #imageLiteral(resourceName: "black5"), #imageLiteral(resourceName: "black6")]
    override func viewDidLoad() {
        super.viewDidLoad()
        diceLeft.image = diceArray[0]
        diceRight.image = diceArray[1]
        // Do any additional setup after loading the view.
    }

    @IBAction func btnRoll(_ sender: UIButton) {
        
        diceLeft.image = diceArray.randomElement()
        diceRight.image = diceArray.randomElement()

        if diceLeft.image == diceRight.image {
            label.text = "same dice!!!!!"
        }
    }
}

