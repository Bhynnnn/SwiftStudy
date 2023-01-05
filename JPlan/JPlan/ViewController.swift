//
//  ViewController.swift
//  JPlan
//
//  Created by 강보현 on 2022/04/12.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var registerBtn: UIButton!
    
    let mainColor = UIColor(named: "MainColor")

    @IBAction func change_loginVC(_ sender: Any) {
        //storyboard를 통해 두번쨰 화면의 storyboard ID를 참조하여 뷰 컨트롤러를 가져옵니다.
        guard let svc = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") else {
            return
        }
        
        //화면 전환 애니메이션을 설정합니다. coverVertical 외에도 다양한 옵션이 있습니다.
        svc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        
        //인자값으로 다음 뷰 컨트롤러를 넣고 present 메소드를 호출합니다.
        self.present(svc, animated: true)
    }
    
    @IBAction func change_registerVC(_ sender: Any) {
        //storyboard를 통해 두번쨰 화면의 storyboard ID를 참조하여 뷰 컨트롤러를 가져옵니다.
        guard let svc = self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") else {
            return
        }
        
        //화면 전환 애니메이션을 설정합니다. coverVertical 외에도 다양한 옵션이 있습니다.
        svc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        
        //인자값으로 다음 뷰 컨트롤러를 넣고 present 메소드를 호출합니다.
        self.present(svc, animated: true)
    }

}

