//
//  UpdatePatientController.swift
//  PatientManagementSystem
//
//  Created by Tihitinaw Buzuwek on 26/10/2025.
//

import Foundation

class UpdatePatientController{
    let updatePatientViewController: UpdatePatientViewController
    var patientViewModel: PatientViewModel  

    init(updatePatientViewController: UpdatePatientViewController, viewModel: PatientViewModel) {
           self.updatePatientViewController = updatePatientViewController
           self.patientViewModel = viewModel
       }
    
    func updatePatient(updatedPatient:PatientUIObject){
        guard let pId = Int(updatedPatient.id)else{return}
        let validationResult = patientViewModel.validatePatientFields(newPatient: updatedPatient, isAddNew:false)
        
        if !validationResult.isValid{
            updatePatientViewController.showErrorMessage(message: validationResult.errorMessage)
            return
        }
        guard let validPatient:PatientModel = validationResult.validatedPatientDetail else{ return }
        
        patientViewModel.updatePatient(patient: validPatient)
        updatePatientViewController.goBack()
    }
}
