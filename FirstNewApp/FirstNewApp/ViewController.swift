//
//  ViewController.swift
//  FirstNewApp
//
//  Created by 강보현 on 2023/01/05.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var mainLabel: UILabel!
    
    weak var timer: Timer?
    
    var number = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        configureUI()
    }
    
    func configureUI(){
        mainLabel.text = "초를 선택하세요"
        slider.value = 0.5
    }

    @IBAction func sliderChanged(_ sender: UISlider) {

        let seconds = Int(slider.value * 60)
        print(seconds)
        mainLabel.text = "\(seconds)"
        number = seconds
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        timer?.invalidate()
        
        // { 뒤에 [self] 써줬을 경우
        timer = Timer(timeInterval: 1.0, repeats: true) {[self]_ in
            //반복하고 싶은 코드 넣기
            if number > 0 {
                number -= 1
                slider.value = Float(number) / Float(60)
                mainLabel.text = "\(number) 초"
            }
            else {
                number = 0
                mainLabel.text = "초를 선택하세요"
                
                //타이머 비활성화
                timer?.invalidate()
                AudioServicesPlayAlertSound(SystemSoundID(1322))

            }
        }
        // { 뒤에 [self] 안써줬을 경우 일일이 self.number 처럼 해야함

//        timer = Timer(timeInterval: 60.0, repeats: true) {_ in
//            //반복하고 싶은 코드 넣기
//            if self.number > 0 {
//                self.number -= 1
//            }
//            else {
//
//            }
//        }
        
        // 파라미터에 timer 넣어줘도 됨
        //        timer = Timer(timeInterval: 60.0, repeats: true) { timer in
        //            //반복하고 싶은 코드 넣기
        //            if self.number > 0 {
        //                self.number -= 1
        //            }
        //            else {
        //
        //            }
        //        }
        
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        mainLabel.text = "초를 선택하세요"
        slider.setValue(0.5, animated: true)
        number = 0
        timer?.invalidate()
//        timer = nil
        
    }
}

