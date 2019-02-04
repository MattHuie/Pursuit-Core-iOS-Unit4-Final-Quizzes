//
//  UserDefaults.swift
//  Quizzes
//
//  Created by Matthew Huie on 2/3/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

struct UserDefaultsManager {
    static var profileNameKey = "ProfileName"
    static var profileImageKey = "ProfileImage"
    
    static func retrieveImage() -> UIImage {
        var imageToReturn = UIImage()
        if let userName = UserDefaults.standard.object(forKey: UserDefaultsManager.profileNameKey) as? String {
            if let imageData = UserDefaults.standard.object(forKey: UserDefaultsManager.profileImageKey + userName) as? Data{
                if let image = UIImage(data: imageData){
                    imageToReturn = image
                }
            }
            
        } else {
            imageToReturn = UIImage(named: "placeholder-image")!
        }
        return imageToReturn
    }
}
