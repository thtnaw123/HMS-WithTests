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
    
    func updatePatient(updatedPatient:PatientModelTranserO){
        guard let pId = Int(updatedPatient.id)else{return}
        let validationResult = patientViewModel.validatePatientFields(newPatient: updatedPatient, isAddNew:false)
        
        if !validationResult.isValid{
            updatePatientViewController.showErrorMessage(message: validationResult.errorMessage)
            return
        }
        guard let validPatient = validationResult.validatedPatientDetail else{ return }

        let updatedPatient = PatientModel(id:pId, name: validPatient.name, age: validPatient.age, diagnosis: validPatient.diagnosis)
        
        patientViewModel.updatePatient(patient: updatedPatient)
        updatePatientViewController.goBack()
    }
}
