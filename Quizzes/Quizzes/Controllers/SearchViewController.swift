//
//  SearchViewController.swift
//  Quizzes
//
//  Created by Matthew Huie on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    let searchView = SearchView()
    
    var quizzes = [Quizzes]() {
        didSet {
            DispatchQueue.main.async {
                self.searchView.searchCollectionView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(searchView)
        searchView.searchCollectionView.dataSource = self
        searchView.searchCollectionView.delegate = self
        getQuizzes()

        
    }
    
    func getQuizzes() {
        QuizAPIClient.getQuizzes { (error, data) in
            if let error = error {
                print(error.errorMessage())
            } else if let data = data {
                self.quizzes = data
            }
        }
    }

    
}

extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return quizzes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCell", for: indexPath) as? SearchCollectionViewCell else { return UICollectionViewCell() }
        let cellToSet = quizzes[indexPath.row]
        cell.layer.borderWidth = 3
        cell.layer.cornerRadius = 10
        cell.layer.borderColor = UIColor.black.cgColor
        cell.label.text = cellToSet.quizTitle
        return cell
    }
    
    
}
