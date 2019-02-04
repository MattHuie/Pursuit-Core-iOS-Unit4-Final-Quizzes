//
//  ViewController.swift
//  Quizzes
//
//  Created by Alex Paul on 1/31/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizzesViewController: UIViewController {

    @IBOutlet weak var savedQuizCollectionView: UICollectionView!
    @IBOutlet weak var messageLabel: UILabel!
    
    var quizzes = [SavedQuiz]() {
        didSet{
            DispatchQueue.main.async {
                self.savedQuizCollectionView.reloadData()
                if self.quizzes.count == 0 {
                    self.messageLabel.isHidden = false
                } else {
                    self.messageLabel.isHidden = true
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        savedQuizCollectionView.dataSource = self
        savedQuizCollectionView.delegate = self
        savedQuizCollectionView.register(QuizCollectionViewCell.self, forCellWithReuseIdentifier: "MyQuizCell")
        if let userName = UserDefaults.standard.object(forKey: UserDefaultsManager.profileNameKey) as? String{
            quizzes = DataPersistenceModel.getQuizzes(userName: userName)
        }
        if quizzes.count == 0 {
            messageLabel.isHidden = false
        } else {
            messageLabel.isHidden = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let userName = UserDefaults.standard.object(forKey: UserDefaultsManager.profileNameKey) as? String{
            quizzes = DataPersistenceModel.getQuizzes(userName: userName)
        }
    }
    
    @objc func deleteButtonPressed(sender: UIButton) {
        if let userName = UserDefaults.standard.object(forKey: UserDefaultsManager.profileNameKey) as? String {
            let index = sender.tag
            let optionMenu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { alert in
                DataPersistenceModel.deleteQuiz(userName: userName, index: index)
                self.quizzes = DataPersistenceModel.getQuizzes(userName: userName)
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            optionMenu.addAction(deleteAction)
            optionMenu.addAction(cancelAction)
            present(optionMenu, animated: true, completion: nil)
            
        }
    }


}

extension QuizzesViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return quizzes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyQuizCell", for: indexPath) as? QuizCollectionViewCell else { return UICollectionViewCell() }
        let cellToSet = quizzes[indexPath.row]
        cell.quizLabel.text = cellToSet.quizTitle
        cell.layer.borderWidth = 3
        cell.layer.cornerRadius = 10
        cell.layer.borderColor = UIColor.black.cgColor
        cell.deleteButton.tag = indexPath.row
        cell.deleteButton.addTarget(self, action: #selector(deleteButtonPressed), for: .touchUpInside)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 250, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let chosenQuiz = quizzes[indexPath.row]
        let detailVC = DetailViewController.init(quizAnswer: chosenQuiz.facts, quizTitle: chosenQuiz.quizTitle)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
