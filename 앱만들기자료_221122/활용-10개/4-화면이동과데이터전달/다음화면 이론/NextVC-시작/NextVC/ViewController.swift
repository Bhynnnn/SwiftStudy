//
//  ViewController.swift
//  NextVC
//
//  Created by Allen H on 2021/12/05.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // 1) 코드로 화면 이동 (다음화면이 코드로 작성되어있을때만 가능한 방법)
    @IBAction func codeNextButtonTapped(_ sender: UIButton) {

        let firstVC = FirstViewController()
        firstVC.modalPresentationStyle = .fullScreen
        firstVC.someString = "안녕"
        present(firstVC, animated: true, completion: nil)
        
    }
    
    // 2) 코드로 스토리보드 객체를 생성해서, 화면 이동
    @IBAction func storyboardWithCodeButtonTapped(_ sender: UIButton) {
        //SecondViewController
        
        if let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") as? SecondViewController{

            secondVC.someString = "두번째 vc"
            present(secondVC, animated: true, completion: nil)
        }
        
//        guard let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") as? SecondViewController else { return }
//
//            present(secondVC, animated: true, completion: nil)
    }
    
    
    
    // 3) 스토리보드에서의 화면 이동(간접 세그웨이)
    @IBAction func storyboardWithSegueButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "toThirdVC", sender: self)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toThirdVC" {
            let thirdVC = segue.destination as! ThirdViewController
            thirdVC.someString = "엄마상어"
        }
        
        if segue.identifier == "toFourthVC" {
            let fourthVC = segue.destination as! FourthViewController
            fourthVC.someString = "뚜루루뜌뚜"
        }
    }
    
    var num = 5
    
    // 직접 세그웨이를 버튼이랑 연결했을 때만 호출됨
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if num > 5 {
            return false
        }
        else {
            return true
        }
    }

    
}

