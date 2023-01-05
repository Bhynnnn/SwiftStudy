//
//  ViewController.swift
//  MyFirstApp
//
//  Created by 강보현 on 2022/12/14.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        mainLabel.text = "안녕하세요"
        mainLabel.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        
        print("button pressed")
        mainLabel.textAlignment = NSTextAlignment.left
    }
    
}

