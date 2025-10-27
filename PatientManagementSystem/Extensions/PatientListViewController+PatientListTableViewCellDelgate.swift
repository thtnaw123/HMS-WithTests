//
//  PatientListViewController+PatientListTableViewCellDelgate.swift
//  PatientManagementSystem
//
//  Created by Tihitinaw Buzuwek on 26/10/2025.
//

import UIKit

extension PatientListViewController:PatientListTableViewCellDelgate{
    func editPatientData(patient: PatientModel) {
        if let destVC = routeToPage(identifier: "UpdatePatientViewController") as? UpdatePatientViewController{
            destVC.targetPatient = patient
            destVC.updatePatientController.patientViewModel = self.patientViewModel
                    
            destVC.updatePatientController.patientViewModel.onPatientUpdated = { [weak self] in
                        DispatchQueue.main.async {
                            self?.patientListTableView.reloadData()
                        }
                    }
            navigationController?.pushViewController(destVC, animated: true)
        }
    }
    
    func deletePatientData(patient: PatientModel) {
        showAlert(patient)
    }
    
    func showAlert(_ patient : PatientModel){
        let alert = UIAlertController(title: "confirm delete", message: "Are You Sure You wanna delete \(patient.name)?", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler:{ _ in
            self.patientViewModel.onPatientDeleted = {[weak self] in
                self?.patientListTableView.reloadData()
            }
            self.patientViewModel.deletePatient(patientId: patient.id)
        }))
        
        alert.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    
}
