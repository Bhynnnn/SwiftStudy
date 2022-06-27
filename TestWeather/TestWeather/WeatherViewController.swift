//
//  WeatherViewController.swift
//  TestWeather
//
//  Created by 강보현 on 2022/06/24.
//

import UIKit

class WeatherViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let weatherView = Bundle.main.loadNibNamed("WeatherView", owner: self, options: nil)?.first as? WeatherView else { return}
        weatherView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        weatherView.setupCollectionView()
        self.view.addSubview(weatherView)
        // Do any additional setup after loading the view.
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
