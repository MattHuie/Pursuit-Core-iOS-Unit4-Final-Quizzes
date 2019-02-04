//
//  CreateViewController.swift
//  Quizzes
//
//  Created by Matthew Huie on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate  {

    @IBOutlet weak var factTitleLabel: UITextField!
    @IBOutlet weak var factOne: UITextView!
    @IBOutlet weak var factTwo: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        factTitleLabel.delegate = self
        factOne.delegate = self
        factTwo.delegate = self

       
    }
    
    
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createPressed(_ sender: UIBarButtonItem) {
        if factTitleLabel.text != ""  && factOne.text != "" && factTwo.text != "" {
            let facts = [factOne.text!, factTwo.text!]
            let timeStamp = Date.getISOTimestamp()
            let quizTitle = self.factTitleLabel.text!
            let id = UUID().uuidString
            let createdQuiz = SavedQuiz.init(id: id, quizTitle: quizTitle, facts: facts, savedAt: timeStamp)
            if let userName = UserDefaults.standard.object(forKey: UserDefaultsManager.profileNameKey) as? String{
                DataPersistenceModel.saveQuizz(userName: userName, quiz: createdQuiz)
                let alert = UIAlertController(title: "Quiz Saved To My Quizzes", message: nil, preferredStyle: .alert)
                let ok = UIAlertAction(title: "Ok", style: .default) { (UIAlertAction) in
                    self.dismiss(animated: true, completion: nil)
                }
                alert.addAction(ok)
                present(alert, animated: true, completion: nil)
            }
            factOne.resignFirstResponder()
            factTwo.resignFirstResponder()
            factOne.isEditable = false
            factTwo.isEditable = false
            
        } else {
            let alert = UIAlertController(title: "Quiz requires a title and 2 facts", message: nil, preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .default) { (UIAlertAction) in
                alert.dismiss(animated: true, completion: nil)
            }
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

}
