//
//  DetailView.swift
//  Quizzes
//
//  Created by Matthew Huie on 2/3/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailView: UIView {

    lazy var quizDetailCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 350, height: 500)
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        layout.scrollDirection = .vertical
        
        var collectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit(){
        setupView()
        quizDetailCollectionView.register(DetailCollectionViewCell.self, forCellWithReuseIdentifier: "DetailCell")
    }
}
extension DetailView {
    private func setupView() {
        setupCollectionView()
    }
    
    private func setupCollectionView(){
        addSubview(quizDetailCollectionView)
        quizDetailCollectionView.translatesAutoresizingMaskIntoConstraints = false
        quizDetailCollectionView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        quizDetailCollectionView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        quizDetailCollectionView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        quizDetailCollectionView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
    }
}


