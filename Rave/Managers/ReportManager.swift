//
//  ReportManager.swift
//  Rave
//
//  Created by Bernie Cartin on 8/2/21.
//

import Foundation
import Firebase

class ReportManager {
    
    let db = Firestore.firestore()
    
    func saveReport(report:Report) {
        do {
            try _ = db.collection(C_REPORTS).addDocument(from: report)
        }
        catch {
            print(error.localizedDescription)
        }
    }
}
