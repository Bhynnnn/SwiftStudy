//
//  DetailViewController.swift
//  everytime_std
//
//  Created by 강보현 on 2022/04/04.
//

import Foundation
import UIKit

final class DetailViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero, style: .grouped)
    
    private let replyTextView = ReplyTextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(self.tableView)
        self.view.addSubview(self.replyTextView)
        
        self.replyTextView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(DetailReplyCell.self, forCellReuseIdentifier: "DetailReplyCell")
        self.tableView.register(DetailContentView.self, forHeaderFooterViewReuseIdentifier: "DetailContentView")
        
        NSLayoutConstraint.activate([
            // view전체를 tableview로 잡음
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            self.replyTextView.topAnchor.constraint(equalTo: self.tableView.bottomAnchor, constant: 8),
            self.replyTextView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 8),
            self.replyTextView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -8),
            self.replyTextView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            
        ])
        
        self.tableView.separatorStyle = .none
        self.tableView.reloadData()
        self.tableView.layoutIfNeeded()
    }
}

extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) ->
    Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailReplyCell") as! DetailReplyCell
        cell.backgroundColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView,
        viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView
            .dequeueReusableHeaderFooterView(withIdentifier: "DetailContentView") as! DetailContentView

        return view
    }

}
