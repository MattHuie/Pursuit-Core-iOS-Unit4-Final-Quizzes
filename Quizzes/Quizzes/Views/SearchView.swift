//
//  SearchView.swift
//  Quizzes
//
//  Created by Matthew Huie on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class SearchView: UIView {

    public lazy var searchCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
            
        let cv =  UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
        cv.backgroundColor = .gray
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .red
        self.searchCollectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: "SearchCell")
        setupView()
    
    }
    
}

extension SearchView {
    private func setupView() {
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        addSubview(searchCollectionView)
        searchCollectionView.translatesAutoresizingMaskIntoConstraints = false
        searchCollectionView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        searchCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        searchCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        searchCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
}
