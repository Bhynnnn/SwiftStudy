//
//  ReplyTextView.swift
//  everytime_std
//
//  Created by 강보현 on 2022/04/05.
//

import Foundation
import UIKit

final class ReplyTextView: UIView {
    
    private let nicknameButton: UIButton = {
        let button = UIButton()
        button.setTitle("익명", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .bold)
        button.setTitleColor(UIColor(r: 198, g: 41, b: 23), for: .normal)
        button.setImage(UIImage(named: "reply_text_nickname_icon"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    private let textView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 14, weight: .medium)
        textView.textContainerInset = .zero
        textView.text = "hello"
        textView.textContainer.lineFragmentPadding = 0
        textView.tintColor = UIColor(r: 198, g: 41, b: 23)
        textView.backgroundColor = .clear
        textView.setContentHuggingPriority(.init(rawValue: 0), for: .horizontal)
        return textView
    }()
    
    private let placeholderLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.tintColor = UIColor(w: 168)
        label.text = "댓글을 입력하세요."
        label.setContentHuggingPriority(.init(rawValue: 0), for: .horizontal)
        return label
    }()
    
    private let sendButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "reply_send_icon"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(w: 242)
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.backgroundView)
        self.addSubview(self.nicknameButton)
        self.addSubview(self.textView)
        self.addSubview(self.sendButton)
        self.addSubview(self.placeholderLabel)
        
        self.backgroundView.translatesAutoresizingMaskIntoConstraints = false
        self.nicknameButton.translatesAutoresizingMaskIntoConstraints = false
        self.textView.translatesAutoresizingMaskIntoConstraints = false
        self.sendButton.translatesAutoresizingMaskIntoConstraints = false
        self.placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        self.textView.delegate = self
        NSLayoutConstraint.activate([
            self.backgroundView.topAnchor.constraint(equalTo: self.topAnchor),
            self.backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        
            
            self.nicknameButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.nicknameButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12),
            self.nicknameButton.heightAnchor.constraint(equalToConstant: 24),
            
            
            self.sendButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            self.sendButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12),
            self.sendButton.heightAnchor.constraint(equalToConstant: 24),
            self.sendButton.widthAnchor.constraint(equalToConstant: 24),
            
            self.textView.leadingAnchor.constraint(equalTo: self.nicknameButton.trailingAnchor, constant: 12),
            self.textView.trailingAnchor.constraint(equalTo: self.nicknameButton.leadingAnchor, constant: -12),
            
            self.textView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.heightAnchor.constraint(equalToConstant: 48),
            
            self.textView.heightAnchor.constraint(equalToConstant: self.textView.font!.lineHeight),
            
            self.placeholderLabel.topAnchor.constraint(equalTo: self.textView.topAnchor),
            self.placeholderLabel.leadingAnchor.constraint(equalTo: self.textView.leadingAnchor),
            self.placeholderLabel.trailingAnchor.constraint(equalTo: self.textView.trailingAnchor),
            self.placeholderLabel.bottomAnchor.constraint(equalTo: self.textView.bottomAnchor),
            
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ReplyTextView: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        let text = textView.text as NSString
        self.placeholderLabel.isHidden = text.length != 0
    }
}
