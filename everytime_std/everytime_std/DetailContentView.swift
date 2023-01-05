//
//  DetailContentView.swift
//  everytime_std
//
//  Created by 강보현 on 2022/04/05.
//

import Foundation
import UIKit

final class DetailContentView: UITableViewHeaderFooterView {
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "detail_main_profile")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let nicknameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(w: 41)
        label.textAlignment = .left
        label.text = "익명"
        label.numberOfLines = 1
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .init(w: 68)
        label.textAlignment = .left
        label.text = "ㅋㅋ 고민중"
        label.numberOfLines = 0
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.textColor = .init(w: 166)
        label.textAlignment = .left
        label.text = "08/30 20:54"
        label.numberOfLines = 1
        return label
    }()
    
    private let reactionView = ReactionView()
    
    private let nicknameContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 3
        return stackView
    }()
    
    private let container: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 3
        return stackView
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.backgroundView = UIView()
        self.backgroundView?.backgroundColor = .white
        self.addSubview(self.profileImageView)
        self.addSubview(self.nicknameLabel)
        self.addSubview(self.timeLabel)
        self.addSubview(self.titleLabel)
        self.addSubview(self.reactionView)
        
        self.profileImageView.translatesAutoresizingMaskIntoConstraints = false
        self.nicknameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.timeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.reactionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.profileImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.profileImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            self.profileImageView.widthAnchor.constraint(equalToConstant: 36),
            self.profileImageView.heightAnchor.constraint(equalToConstant: 36),
            
            self.nicknameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.nicknameLabel.leadingAnchor.constraint(equalTo: self.profileImageView.trailingAnchor, constant: 8),
            
            self.timeLabel.topAnchor.constraint(equalTo: self.nicknameLabel.bottomAnchor),
            
            self.timeLabel.leadingAnchor.constraint(equalTo: self.profileImageView.trailingAnchor, constant: 8),
            self.titleLabel.topAnchor.constraint(equalTo: self.profileImageView.bottomAnchor, constant: 6),
            
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            self.titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -44),
            self.reactionView.heightAnchor.constraint(equalToConstant: 16),
            self.reactionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            self.reactionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),

        
        ])

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
