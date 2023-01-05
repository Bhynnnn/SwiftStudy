//
//  ReplyReactionView.swift
//  everytime_std
//
//  Created by 강보현 on 2022/04/04.
//

import Foundation
import UIKit

final class ReplyReactionView: UIStackView {
    private let commentButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "detail_reply_comment"), for: .normal)
        return button
    }()
    
    private let likeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "detail_reply_like"), for: .normal)
        return button
    }()
    
    private let moreButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "detail_reply_more"), for: .normal)
        return button
    }()
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .init(w: 249)
        view.layer.cornerRadius = 4
        view.clipsToBounds = true
        return view
    }()
    
    private func makeSeperator() -> UIView {
        let view = UIView()
        view.backgroundColor = .init(w: 214)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.widthAnchor.constraint(equalToConstant: 1),
            view.heightAnchor.constraint(equalToConstant: 8)
        
        ])
        return view
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.spacing = 0
        self.axis = .horizontal
        self.alignment = .center
        self.addSubview(self.backgroundView)
        
        self.addArrangedSubview(self.commentButton)
        self.addArrangedSubview(self.makeSeperator())
        self.addArrangedSubview(self.likeButton)
        self.addArrangedSubview(self.makeSeperator())
        self.addArrangedSubview(self.moreButton)
        self.backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.backgroundView.topAnchor.constraint(equalTo: self.topAnchor),
            self.backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        
        ])

        [self.commentButton, self.likeButton, self.moreButton].forEach{ button in button.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                button.widthAnchor.constraint(equalToConstant: 36),
                
                button.topAnchor.constraint(equalTo: self.topAnchor),
                button.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                
                
            ])
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
