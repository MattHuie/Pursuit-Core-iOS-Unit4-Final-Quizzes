//
//  DataPersistenceManager.swift
//  Quizzes
//
//  Created by Alex Paul on 1/31/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

final class DataPersistenceManager {
  private init() {}
  
  static func documentsDirectory() -> URL {
    return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
  }
  
  static func filepathToDocumentsDiretory(filename: String) -> URL {
    return documentsDirectory().appendingPathComponent(filename)
  }
}
