//
//  SearchCollectionViewCell.swift
//  Quizzes
//
//  Created by Matthew Huie on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 3
        label.textAlignment = .center
        return label
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        setupView()
    }
    
}
extension SearchCollectionViewCell {
    private func setupView() {
        setupLabel()
        setupButton()
        
    }
    private func setupButton() {
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func setupLabel() {
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
    }
    
}
