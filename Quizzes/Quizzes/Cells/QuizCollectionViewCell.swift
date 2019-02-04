//
//  QuizCollectionViewCell.swift
//  Quizzes
//
//  Created by Matthew Huie on 2/3/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizCollectionViewCell: UICollectionViewCell {
    
    lazy var deleteButton: UIButton = {
        var button = UIButton()
        button.setTitle(". . .", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        return button
    }()
    lazy var quizLabel: UILabel = {
        var label = UILabel()
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 3
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit(){
        setupButton()
        setupLabel()
    }
}
extension QuizCollectionViewCell {
    func setupButton(){
        addSubview(deleteButton)
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        deleteButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        deleteButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        deleteButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    func setupLabel(){
        addSubview(quizLabel)
        quizLabel.translatesAutoresizingMaskIntoConstraints = false
        quizLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        quizLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        quizLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        quizLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
    }
}



