//
//  UpdatePatientViewController.swift
//  PatientManagementSystem
//
//  Created by Tihitinaw Buzuwek on 26/10/2025.
//

import UIKit

class UpdatePatientViewController: UIViewController {
    @IBOutlet weak var errorMessage: UILabel!
    
    @IBOutlet weak var patientNameField: UITextField!
    
    @IBOutlet weak var patientAgeField: UITextField!
    
    @IBOutlet weak var patientDiagnosisField: UITextField!
    
    var targetPatient:PatientModel?
    
    lazy var updatePatientController: UpdatePatientController = {
        return UpdatePatientController(updatePatientViewController: self, viewModel: PatientViewModel()) 
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        hydrateUpdateFields()
    }
    
    func hydrateUpdateFields(){
        if let patient = targetPatient {
            patientNameField.text = patient.name
            patientAgeField.text = String(patient.age)
            patientDiagnosisField.text = patient.diagnosis
        }
    }
    
    @IBAction func updatePatientAction(_ sender: Any) {
        errorMessage.text = ""
        let updatedPatient = PatientModelTranserO(
            id: String(targetPatient?.id ?? 0) ,
            name: patientNameField.text ?? "",
            age: patientAgeField.text ?? "",
            diagnosis: patientDiagnosisField.text ?? "")
        
        updatePatientController.updatePatient(updatedPatient: updatedPatient)
    }
    
    func showErrorMessage(message:String){
        errorMessage.text = message
    }
    
    func goBack(){
        self.navigationController?.popViewController(animated: true);
    }

  
}
