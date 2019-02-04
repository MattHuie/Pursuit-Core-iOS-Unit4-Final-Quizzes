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
                self.quizzes = data.sorted{$0.quizTitle < $1.quizTitle}
            }
        }
    }
    
    @objc func saveQuizPressed(sender: UIButton) {
        if let userName = UserDefaults.standard.object(forKey: UserDefaultsManager.profileNameKey) as? String {
            let index = sender.tag
            let quizToSave = quizzes[index]
            var ids = [String]()
            let quizzesSaved = DataPersistenceModel.getQuizzes(userName: userName)
            for quiz in quizzesSaved {
                ids.append(quiz.id)
            }
            if ids.contains(quizToSave.id){
                let alert = UIAlertController(title: "Quiz already saved", message: "Please choose another one", preferredStyle: .alert)
                let okay = UIAlertAction(title: "Okay", style: .default) { (UIAlertAction) in
                    self.dismiss(animated: true, completion: nil)
                }
                alert.addAction(okay)
                present(alert, animated: true, completion: nil)
            } else {
                let timeStamp = Date.getISOTimestamp()
                let saveQuiz = SavedQuiz.init(id: quizToSave.id ,quizTitle: quizToSave.quizTitle, facts: quizToSave.facts, savedAt: timeStamp)
                DataPersistenceModel.saveQuizz(userName: userName, quiz: saveQuiz)
                let alert = UIAlertController(title: "Quiz Saved", message: nil, preferredStyle: .alert)
                let okay = UIAlertAction(title: "Okay", style: .default) { (UIAlertAction) in
                    self.dismiss(animated: true, completion: nil)
                }
                alert.addAction(okay)
                present(alert, animated: true, completion: nil)
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
        cell.button.tag = indexPath.row
        cell.button.addTarget(self, action: #selector(saveQuizPressed), for: .touchUpInside)
        cell.label.text = cellToSet.quizTitle
        return cell
    }
    
    
}
