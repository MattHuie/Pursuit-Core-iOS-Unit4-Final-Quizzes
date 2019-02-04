//
//  SavedQuiz.swift
//  Quizzes
//
//  Created by Matthew Huie on 2/3/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

struct SavedQuiz: Codable {
    let id: String
    let quizTitle: String
    let facts: [String]
    let savedAt: String
    
    public var date: Date {
        let date = savedAt.date()
        return date
    }
}
