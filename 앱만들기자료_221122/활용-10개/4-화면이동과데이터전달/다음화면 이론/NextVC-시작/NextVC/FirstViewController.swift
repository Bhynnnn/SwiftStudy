//
//  FirstViewController.swift
//  NextVC
//
//  Created by 강보현 on 2023/01/10.
//

import UIKit

class FirstViewController: UIViewController {

    let mainLabel = UILabel()
    
    let backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("back", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // 옵셔널로 선언 초기값 = nil
    var someString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    func configureUI(){
        
        mainLabel.text = someString
        mainLabel.font = UIFont.systemFont(ofSize: 22)

        view.addSubview(mainLabel)
        view.addSubview(backButton)
        view.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false

        
        mainLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc func backButtonTapped(){
        print("Back button tapped")
        dismiss(animated: true, completion: nil)
    }
    
    
}
