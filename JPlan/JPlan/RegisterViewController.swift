//
//  RegisterViewController.swift
//  JPlan
//
//  Created by 강보현 on 2022/05/04.
//

import UIKit
import Firebase
import FirebaseAuth

class RegisterViewController: UIViewController {
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var passwordAgain: UITextField!
    
    @IBOutlet weak var backBtn: UIButton!
    @IBAction func back(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerBtn(_sender: UIButton){
        if let emailText = userEmail.text,
           let passwordText = password.text,
           let passwordAgainText = passwordAgain.text,
           let userNameText = userName.text
        {
            if(emailText != "" || userNameText != "" || passwordAgainText != "" || passwordText != "" ){
                if(passwordText == passwordAgainText){
                    Auth.auth().createUser(withEmail:emailText, password: passwordText){ authResult, error in
                        if let e = error {
                            print(e.localizedDescription)
                        }
                        else{
                            guard let svc = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") else {
                                return
                            }
                            
                            //화면 전환 애니메이션을 설정합니다. coverVertical 외에도 다양한 옵션이 있습니다.
                            svc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
                            svc.modalPresentationStyle = .fullScreen
                            //인자값으로 다음 뷰 컨트롤러를 넣고 present 메소드를 호출합니다.
                            self.present(svc, animated: true)
        //                    self.performSegue(withIdentifier: "LoginViewController", sender: self)
                        }
                        
                    }
                }
                else{
                    print("두 비밀번호가 일치하지 않습니다.")
                }
            }
            else{
                print("빈칸을 모두 채워주세요.")
            }
            
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
