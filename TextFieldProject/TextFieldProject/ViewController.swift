//
//  ViewController.swift
//  TextFieldProject
//
//  Created by 강보현 on 2023/01/09.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    //속성은 이 위에

    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        // textField 안에 delegate라는 속성이 있음
        // delegate 는 대리자
        // 대리자를 self로 설정
        // self 는 viewcontriller
        
        
        setup()
    }
    
    func setup(){
        // view 는 전체 배경을 의미함
        view.backgroundColor = UIColor.gray
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.placeholder = "이메일 입력하시오"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
    }

    // textfield의 입력을 시작할 대 호출 (시작할지 말지의 여부 허락하는 것)
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // return 값 없음 -> 보통 시점 의미함
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
        print("유저가 텍스트필드 입력 시작함")
        // textField 선택시 메시지 출력
    }
    // textField clear 할지말지 여부 결정해야함
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print(#function)
        // 안지워짐
        return false
        
//        // 지워짐
//        return true
    }
    
    // textfield 글자 내용이 (한글자 한글자) 입력되거나 지워질 때 호출이 됨 (허락)
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(#function)
        print(string)
        // 입력되는 한 글자를 출력함
        return true
        
    }
    
    // textfield의 엔터키가 눌러지면 다음 동작을 허락할 것인지 말것인지
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // textfield의 입력이 끝날 때 호출 ( 끝날지 말지 허락)
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // textfield의 입력이 실제 끝났을 때 호출 (시점)
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        print("입력 종료")
    }
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        
    }
    
}

