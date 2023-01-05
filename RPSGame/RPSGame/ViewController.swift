//
//  ViewController.swift
//  RPSGame
//
//  Created by 강보현 on 2022/12/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var my_img: UIImageView!
    @IBOutlet weak var my_lb: UILabel!
    @IBOutlet weak var com_lb: UILabel!
    @IBOutlet weak var title_lb: UILabel!
    @IBOutlet weak var com_img: UIImageView!
    
    @IBOutlet weak var paperBtn: UIButton!
    @IBOutlet weak var rockBtn: UIButton!
    @IBOutlet weak var scisorsBtn: UIButton!
    @IBOutlet weak var selectBtn: UIButton!
    var rpsArr: [UIImage] = [#imageLiteral(resourceName: "rock"), #imageLiteral(resourceName: "scissors"), #imageLiteral(resourceName: "paper")]
    var com = ""
    var my = ""
    var rockImg = #imageLiteral(resourceName: "rock")
    var scisorsImg = #imageLiteral(resourceName: "scissors")
    var paperImg = #imageLiteral(resourceName: "paper")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func paperBtn(_ sender: UIButton) {
        print("paper")
        my_img.image = #imageLiteral(resourceName: "paper")
        my_lb.text = "보"
        
    }
    
    @IBAction func rockBtn(_ sender: UIButton) {
        print("rock")
        my_img.image = #imageLiteral(resourceName: "rock")
        my_lb.text = "주먹"
    }
    
    @IBAction func scissorsBtn(_ sender: UIButton) {
        print("scissors")
        my_img.image = #imageLiteral(resourceName: "scissors")
        my_lb.text = "가위"
    }
    
    @IBAction func selectBtn(_ sender: UIButton) {
        // com 이미지 랜덤
        com_img.image = rpsArr.randomElement()
        
        if com_img.image == rockImg {
            com_lb.text = "주먹"
        }
        else if com_img.image == scisorsImg {
            com_lb.text = "가위"
        }
        else if com_img.image == paperImg {
            com_lb.text = "보"
        }
        
        // rps 결과
        if (com_img.image == rockImg && my_img.image == rockImg) || (com_img.image == scisorsImg && my_img.image == scisorsImg) || (com_img.image == paperImg && my_img.image == paperImg){
            title_lb.text = "비김"
        }
        else if (com_img.image == rockImg && my_img.image == paperImg) || (com_img.image == paperImg && my_img.image == scisorsImg) || (com_img.image == scisorsImg && my_img.image == rockImg) {
            title_lb.text = "나의 승리"
        }
        else if (com_img.image == rockImg && my_img.image == scisorsImg) || (com_img.image == paperImg && my_img.image == rockImg) || (com_img.image == scisorsImg && my_img.image == paperImg) {
            title_lb.text = "나의 패배"
        }
        
    }
    
    @IBAction func resetBtn(_ sender: UIButton) {
        com_lb.text = "준비"
        my_lb.text = "준비"
        
        com_img.image = #imageLiteral(resourceName: "ready")
        my_img.image = #imageLiteral(resourceName: "ready")
        
    }
    
}

