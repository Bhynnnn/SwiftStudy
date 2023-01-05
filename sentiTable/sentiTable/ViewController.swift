//
//  ViewController.swift
//  sentiTable
//
//  Created by 강보현 on 2022/04/18.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Main StoryBoard에서 TableView 클릭 + ctrl 한 뒤 코드로 옮기면 아래와 같이 변수 선언 됨
    @IBOutlet weak var TableViewMain: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 데이터 몇개? (2)
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 데이터 무엇? (1)
        // cellForRowAt 각 행을 의미함
        // 반복 10번
        // 2가지 방법 있음
        // (1. 임의의 셀 만들기)
        // table 수 출력함
        // (2. 스토리보드 + id)
//        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "TableCellType1")
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "Type1")

        cell.textLabel?.text = "\(indexPath.row)"
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        TableViewMain.delegate = self
        TableViewMain.dataSource = self
        // self : 클래스 안의 func을 의미함 해당 클래스에서 함수 알아서 찾아가라
    }

    // tableView: 테이블로 된 뷰 - 여러개의 행이 모여있는 목록 뷰( 화면 )
    // 정갈하게 보여주기 위해 - 전화번호부
    // 1. 테이블에 보여지는 데이터 무엇?⭐️
    // 2. 테이블에 보여지는 데이터 몇개?⭐️
    // 3. (옵션) 데이터 행 클릭 시
}

