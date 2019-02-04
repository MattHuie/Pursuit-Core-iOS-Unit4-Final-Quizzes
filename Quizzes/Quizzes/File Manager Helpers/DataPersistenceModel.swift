//
//  DataPersistenceModel.swift
//  Quizzes
//
//  Created by Matthew Huie on 2/3/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

struct DataPersistenceModel {
    
    private static var quizzes = [SavedQuiz]()
    
    static func saveQuizzes(userName: String){
        let path = DataPersistenceManager.filepathToDocumentsDiretory(filename: userName)
        do {
            let data = try PropertyListEncoder().encode(quizzes)
            try data.write(to: path, options: .atomic)
        } catch {
            print("Property list encoding error \(error)")
        }
    }
    static func saveQuizz(userName: String,quiz: SavedQuiz){
        quizzes.append(quiz)
        saveQuizzes(userName: userName)
    }
    
    static func deleteQuiz(userName: String, index: Int){
        quizzes.remove(at: index)
        saveQuizzes(userName: userName)
    }
    static func getQuizzes(userName: String) -> [SavedQuiz]{
        
        let path = DataPersistenceManager.filepathToDocumentsDiretory(filename: userName).path
        if FileManager.default.fileExists(atPath: path){
            if let data = FileManager.default.contents(atPath: path){
                do {
                    quizzes = try PropertyListDecoder().decode([SavedQuiz].self, from: data)
                    quizzes = quizzes.sorted{$0.date < $1.date}
                }catch{
                    print("Property list decoding error: \(error)")
                }
            } else {
                print("getPhotoJournal data is nil")
            }
        } else {
            print("\(userName) does not exist")
        }
        return quizzes
    }
    
}
