//
//  MainViewController.swift
//  everytime_std
//
//  Created by 강보현 on 2022/03/30.
//

import Foundation
import UIKit
// UITableViewController 상속
final class MainViewController: UITableViewController {
    
    private let texts = [
        "가나다라마바사아자차카타파하",
        "아에이오우",
        "abcdefghijklmnopqrstuvwxyz",
        "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
        "집에가고싶어요",
        "강보현강보현강보현강보현강보현",
    ]
    private let time = ["3", "23", "45", "67", "89" ,"100"]
    private let name = ["1", "2", "3", "4", "5", "6"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // navigation 달아주기
        self.title = ""
        self.navigationItem.titleView = NavigationTitleView()
        
        // tavleView 달아주기 (MainCell)
        self.tableView.separatorStyle = .none
        self.tableView.register(MainCell.self, forCellReuseIdentifier: "MainCell")
        self.tableView.reloadData()
        
        // 게시판 점 3개 더보기 달아줌
        // action 없으니 nil
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "more_title"), style: .plain, target: self, action: nil)
    }
    
    override func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
        texts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as! MainCell
        // text 라는 변수 = texts에서 indexPath번째의 item을 가지고와서
        let name_txt = "익명"+name[indexPath.item]
        let time_txt = time[indexPath.item] + "분전"
        let data_txt = texts[indexPath.item]

        // cell의 setupData함수를 이용해 text를 달아줌
        cell.setupData(name: name_txt, time: time_txt, data: data_txt)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailviewController = DetailViewController()
        self.navigationController?.pushViewController(detailviewController, animated: true)
    }
}
