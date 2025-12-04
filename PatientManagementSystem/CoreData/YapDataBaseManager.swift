//
//  YapDataBaseManager.swift
//  PatientManagementSystem
//
//  Created by Tihitinaw Buzuwek on 26/11/2025.
//

import Foundation
import YapDatabase

class YapDataBaseManager{
    static let shared = YapDataBaseManager()
    let db:YapDatabase
    let readConnection:YapDatabaseConnection
    let writeConnection:YapDatabaseConnection
    
    private init(){
        db = YapDatabase()
        
        db.registerCodableSerialization(PatientModel.self, forCollection: "patients")
        
        YapPatientExtension.register(in: db)
        readConnection = db.newConnection()
        writeConnection = db.newConnection()
    }
    
}
