//
//  LoginViewController.swift
//  JPlan
//
//  Created by 강보현 on 2022/05/04.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var password_txt: UITextField!
    @IBOutlet weak var email_txt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var backBtn: UIButton!
    
    @IBAction func loginBtn(_sender: UIButton){
        if let email = email_txt.text,
           let password = password_txt.text {
            Auth.auth().signIn(withEmail: email, password: password){authResult, error in
                if let e = error {
                    print(e)
                }
                else {
//                    self.performSegue(withIdentifier: "MainViewController", sender: self)
                    guard let svc = self.storyboard?.instantiateViewController(withIdentifier: "TabBarController") else {
                        return
                    }
                    
                    //화면 전환 애니메이션을 설정합니다. coverVertical 외에도 다양한 옵션이 있습니다.
                    svc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
                    svc.modalPresentationStyle = .fullScreen
                    //인자값으로 다음 뷰 컨트롤러를 넣고 present 메소드를 호출합니다.
                    self.present(svc, animated: true)
                }
            }
        }
        
    }
    @IBAction func back(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
//    @IBAction func change_TodayVC(_ sender: Any) {
//        //storyboard를 통해 두번쨰 화면의 storyboard ID를 참조하여 뷰 컨트롤러를 가져옵니다.
//
//    }

}
