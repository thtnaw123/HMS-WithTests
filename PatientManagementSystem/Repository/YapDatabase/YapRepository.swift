//
//  YapRepository.swift
//  PatientManagementSystem
//
//  Created by Tihitinaw Buzuwek on 26/11/2025.
//

import Foundation
import YapDatabase

class YapRepository:PatientRepositoryProtocol{

    private let manager = YapDataBaseManager.shared
    private let collection = "patients"
    
    func addPatient(newPatient: PatientModel) {
        manager.writeConnection.asyncReadWrite { transaction in
            transaction.setObject(newPatient, forKey: "\(newPatient.id)", inCollection: self.collection)
        }
    }
    
    
    func getPatients() -> [PatientModel] {
        var result: [PatientModel] = []
        manager.readConnection.read { transaction in
            guard let viewTransaction = transaction.ext(YapPatientExtension.viewName)
                    as? YapDatabaseViewTransaction else { return }
            let count = viewTransaction.numberOfItems(inGroup: "all")

            for i in 0..<count {
                if let patient = viewTransaction.object(at: UInt(i), inGroup: "all") as? PatientModel {

                    result.append(patient)
                }
            }
        }

        return result
    }
    
    func deletePatient(_ patient: PatientModel) {
        print("deleting ... \(patient.name)")
        manager.readConnection.asyncReadWrite{ transaction in
            transaction.removeObject(forKey: "\(patient.id)", inCollection: self.collection)
        }
    }
    
    func updatePatient(_ patient: PatientModel) {
        print("updating ... \(patient.name)")
        manager.readConnection.asyncReadWrite{ transaction in
            transaction.setObject(patient, forKey:"\(patient.id)", inCollection: self.collection)
        }
    }
    
    
    
}
