//
//  AddPatientController.swift
//  PatientManagementSystem
//
//  Created by Tihitinaw Buzuwek on 26/10/2025.
//

import Foundation

class AddPatientController{
    let addPatientViewController:AddPatientViewController
    var patientViewModel : PatientViewModel
    
    init(addPatientViewController: AddPatientViewController, patientViewModel:PatientViewModel) {
        self.addPatientViewController = addPatientViewController
        self.patientViewModel = patientViewModel
    }
    
    func addNewPatient(newPatient:PatientModelTranserO){
        
        let validationResult = patientViewModel.validatePatientFields(newPatient: newPatient, isAddNew:true)
        
        if !validationResult.isValid{
            addPatientViewController.showErrorMessage(message: validationResult.errorMessage)
            return
        }
        guard let validPatient = validationResult.validatedPatientDetail else{ return }

        let newPatient = PatientModel(id: validPatient.id, name: validPatient.name, age: validPatient.age, diagnosis: validPatient.diagnosis)
        patientViewModel.addPatient(patient: newPatient)
        
        addPatientViewController.goBack()
        
        
    }
}
