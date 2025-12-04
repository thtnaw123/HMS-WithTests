//
//  PatientViewModel.swift
//  PatientManagementSystem
//
//  Created by Tihitinaw Buzuwek on 25/10/2025.
//

import UIKit


class PatientViewModel{
    var patientRepository = YapRepository()
    
    private var patientList:[PatientModel] = []
    var filteredPatientList:[PatientModel] = []
    
    var getPatientsList:[PatientModel] {patientRepository.getPatients()}

    var onPatientChanged: (()-> Void)?
    let validator = Validator()


    init(){
        initRepository()
    }
    
    func initRepository(){
        patientList = getPatientsList
        filteredPatientList = patientList
    }
    
    func checkIfIdExists(id:Int)-> Bool{
        return getPatientsList.contains{$0.id == id }
    }
    
    func addPatient(patient:PatientModel){
        let res = validatePatientFields(newPatient: PatientUIObject(id: String(patient.id), name: patient.name, age: String(patient.age), diagnosis: patient.diagnosis), isAddNew: false)
       
        guard !checkIfIdExists(id: patient.id), res.isValid else{
            return
        }
        patientList.append(patient)
        filteredPatientList = patientList
        patientRepository.addPatient(newPatient: patient)
        onPatientChanged?()
        
        
    }
    
    func updatePatient(patient:PatientModel){
        guard checkIfIdExists(id: patient.id) else{
            return
        }
//        if let _ = patientList.firstIndex(where: {$0.id == patient.id}){
//            patientList[targetPatientIndex] = patient
//            filteredPatientList = patientList
            patientRepository.updatePatient(patient)
//        }
        onPatientChanged?()

    }
    
    func deletePatient(patientToBeDeleted:PatientModel){
        guard checkIfIdExists(id: patientToBeDeleted.id) else{
            return
        }
        
//        let newFilterList = patientList.filter{$0.id != patientToBeDeleted.id}
//        patientList = newFilterList
//        filteredPatientList = patientList
        patientRepository.deletePatient(patientToBeDeleted)
        onPatientChanged?()
    }
    
    func searchPatients(key:String){
        filteredPatientList = key.isEmpty
                    ? getPatientsList
                    : getPatientsList.filter { $0.name.lowercased().contains(key.lowercased()) }
        onPatientChanged?()
    }
    
    
    func validatePatientFields(
        newPatient:PatientUIObject, isAddNew:Bool
    ) -> (isValid: Bool, validatedPatientDetail:PatientModel?, errorMessage: String) {
        //id
        let idResult = validateNumbers(number: newPatient.id, fieldName: "Patient ID")
        
        if !idResult.isValid {
            return (false, nil, idResult.errorMessage)
        }
 
        if isAddNew {
            if checkIfIdExists(id: idResult.number) {
                return (false, nil, "Patient ID already exists")
            }
        }
        // Name
        let nameResult = validateTexts(text: newPatient.name, fieldName: "Name")

        if !nameResult.isValid {
            return (false, nil, nameResult.errorMessage)
        }
        
        // Age
        let ageResult = validateNumbers(number: newPatient.age, fieldName: "Patient Age")
        if !ageResult.isValid {
            return (false,nil, ageResult.errorMessage)
        }
        
        // Diagnosis
        let diagnosisResult = validateTexts(text: newPatient.diagnosis, fieldName: "Diagnosis")
        if !diagnosisResult.isValid {
            return (false, nil,diagnosisResult.errorMessage)
        }

        let validPatientDetail = PatientModel(id: idResult.number, name: newPatient.name, age: ageResult.number, diagnosis: newPatient.diagnosis)

        return (true, validPatientDetail , "")
    }
    
    
    
    func validateTexts(text:String, fieldName:String)
    -> (isValid:Bool,errorMessage:String){
        let textResult = validator.checkIfEmpty(name: text, fieldName: fieldName)

        if !textResult.isValid {
            return (false, textResult.errorMessage)
        }
        if !validator.checkIfOnlyCharAndSpace(text) {
            return (false, "\(fieldName) should be only letters and spaces")
        }
        return (true,"")
    }

    func validateNumbers(number:String, fieldName:String) ->
    (isValid:Bool,number:Int,errorMessage:String){
        let numberResult = validator.checkIfEmpty(name: number, fieldName: fieldName)
        if !numberResult.isValid {
            return (false,0, numberResult.errorMessage)
        }
        guard let validNum = validator.validatePostiveNumbers(age: number) else {
            return (false, 0, "\(fieldName) should be postive number")
        }
        return (true, validNum,"")
    }


    
    


       
}
