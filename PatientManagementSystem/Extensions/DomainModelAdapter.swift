//
//  DomainModelAdapter.swift
//  PatientManagementSystem
//
//  Created by Tihitinaw Buzuwek on 30/10/2025.
//

import Foundation

extension PatientModelDataEntity {
    func toDomainModel() -> PatientModel {
        return PatientModel(
            id: Int(self.patientId),
            name: self.patientName ?? "",
            age: Int(self.patientAge),
            diagnosis: self.patientDiagnosis ?? ""
        )
    }
}
