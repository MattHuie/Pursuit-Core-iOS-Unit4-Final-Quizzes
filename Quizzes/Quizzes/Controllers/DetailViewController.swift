//
//  DetailViewController.swift
//  Quizzes
//
//  Created by Matthew Huie on 2/3/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var quizAnswer = [String]()
    var quizTitle: String!
    
    let detailView = DetailView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailView)
        detailView.quizDetailCollectionView.dataSource = self
        detailView.quizDetailCollectionView.delegate = self

    }
    
    init(quizAnswer: [String], quizTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.quizAnswer = quizAnswer
        self.quizTitle = quizTitle
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

   


}
extension DetailViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return quizAnswer.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCell", for: indexPath) as? DetailCollectionViewCell else { return UICollectionViewCell() }
        cell.label.text = quizTitle
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = self.detailView.quizDetailCollectionView.cellForItem(at: indexPath) as? DetailCollectionViewCell else { return }
        if cell.label.text == quizTitle{
            UIView.transition(with: cell, duration: 1, options: .transitionFlipFromRight, animations: {
                cell.label.text = self.quizAnswer[indexPath.row]
            })
        } else {
            UIView.transition(with: cell, duration: 1, options: .transitionFlipFromRight, animations: {
                cell.label.text = self.quizTitle
            })
        }
        
    }
    
    
}
