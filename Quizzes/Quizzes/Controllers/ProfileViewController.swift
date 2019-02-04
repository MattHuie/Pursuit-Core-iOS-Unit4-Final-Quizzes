//
//  ProfileViewController.swift
//  Quizzes
//
//  Created by Matthew Huie on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImage: UIButton!
    @IBOutlet weak var profileName: UIButton!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    
    private var imagePickerViewController: UIImagePickerController!
    
    var userName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let userName = UserDefaults.standard.object(forKey: UserDefaultsManager.profileNameKey) as? String {
            profileName.setTitle(userName, for: .normal)
            profileImage.setImage(UserDefaultsManager.retrieveImage(), for: .normal)
            
        } else {
            showAlert()
        }
        imagePickerViewController = UIImagePickerController()
        imagePickerViewController.delegate = self
        if !UIImagePickerController.isSourceTypeAvailable(.camera){
            cameraButton.isEnabled = false
        }
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "Enter User Name", message: "No spaces allowed or special characters", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "enter username"
            textField.textAlignment = .center
        }
        let okay = UIAlertAction(title: "Okay", style: .default) { (UIAlertAction) in
            if var text = alert.textFields?.first?.text{
                text.insert("@", at: text.startIndex)
                self.profileName.setTitle(text, for: .normal)
                self.userName = text
                UserDefaults.standard.set(text, forKey: "ProfileName")
            }
        }
        alert.addAction(okay)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func profileImagePressed(_ sender: UIButton) {
        imagePickerViewController.sourceType = .photoLibrary
        present(imagePickerViewController,animated: true,completion:  nil)
    }
    
    @IBAction func cameraButtonPressed(_ sender: UIBarButtonItem) {
        imagePickerViewController.sourceType = .camera
        present(imagePickerViewController,animated: true,completion:  nil)
    }
    
    

}
extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profileImage.setImage(image, for: .normal)
            let imageToSave = image.jpegData(compressionQuality: 0.5)
            if let userName = UserDefaults.standard.object(forKey: UserDefaultsManager.profileNameKey) as? String{
                UserDefaults.standard.set(imageToSave, forKey: "ProfileImage" + userName)
            }
        } else {
            print("Image Nil")
        }
        dismiss(animated: true, completion: nil)
    }
}
