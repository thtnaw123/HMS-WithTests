//
//  PatientRepositoryProtocol.swift
//  PatientManagementSystem
//
//  Created by Tihitinaw Buzuwek on 26/11/2025.
//

import Foundation


protocol PatientRepositoryProtocol{
    
    func addPatient(newPatient:PatientModel)
    func getPatients() -> [PatientModel]
    func deletePatient(_ :PatientModel)
    func updatePatient(_ patient: PatientModel)
    
}
