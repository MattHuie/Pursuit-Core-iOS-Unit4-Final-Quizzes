//
//  DetailCollectionViewCell.swift
//  Quizzes
//
//  Created by Matthew Huie on 2/3/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {
    
    lazy var label: UILabel = {
        var label = UILabel()
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 3
        label.textAlignment = .center
        label.backgroundColor = .purple
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension DetailCollectionViewCell {
    private func setupView() {
        setupLabel()
    }
    private func setupLabel(){
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
    }
    
}
