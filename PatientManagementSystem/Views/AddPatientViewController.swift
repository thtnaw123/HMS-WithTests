//
//  AddPatientViewController.swift
//  PatientManagementSystem
//
//  Created by Tihitinaw Buzuwek on 26/10/2025.
//

import UIKit

class AddPatientViewController: UIViewController {

    @IBOutlet weak var patientIdField: UITextField!
    

    @IBOutlet weak var patientNameField: UITextField!
    
    @IBOutlet weak var patientAgeField: UITextField!
    
    @IBOutlet weak var diagnosisNameField: UITextField!
    
    @IBOutlet weak var errorMessage: UILabel!
    
    lazy var addPatientController = AddPatientController(addPatientViewController: self,patientViewModel:PatientViewModel() )
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addPatientAction(_ sender: Any) {
        errorMessage.text = ""
        let newPatient = PatientUIObject(
            id:patientIdField.text ?? "" ,
            name: patientNameField.text ?? "",
            age: patientAgeField.text ?? "",
            diagnosis: diagnosisNameField.text ?? "")
        
        addPatientController.addNewPatient(newPatient:newPatient)
    }
    
    func showErrorMessage(message:String){
        errorMessage.text = message
    }
    
    func goBack(){
        self.navigationController?.popViewController(animated: true);
    }

    
}
