//
//  PatientRepository.swift
//  PatientManagementSystem
//
//  Created by Tihitinaw Buzuwek on 26/10/2025.
//

import Foundation

class PatientRepository{
    static let shared = PatientRepository()
    let userDefaults = UserDefaults.standard

    private init(){}
    
    let patient1 = PatientModel(id: 1, name: "Guluma Wakuma", age: 25, diagnosis: "malnourishment")
    let patient2 = PatientModel(id: 2, name: "Lelisa Benti", age: 25, diagnosis: "malnourishment")
    let patient3 = PatientModel(id: 3, name: "Abel Assefa", age: 25, diagnosis: "malnourishment")

    lazy var patientListSeedData = [patient1, patient2, patient3]
        
    func initList(patientList: [PatientModel]) {
        let encoder = JSONEncoder()
        do{
            let encoded = try encoder.encode(patientList)
            PrintDebug.printDebug("init patient list")
            UserDefaults.standard.set(encoded, forKey: "patientList")
        }catch{
            print("error saving data")
        }
    }
    
    func savePatient(_ patient:PatientModel){
        var patientList = getPatients()
        patientList.append(patient)
        PrintDebug.printDebug("save patient")
        initList(patientList: patientList)
    }
    
    func savePatientList(_ patients:[PatientModel]){
        PrintDebug.printDebug("saving all patients")
        initList(patientList:patients)
    }
    
    func getPatients() -> [PatientModel] {
        if let data = UserDefaults.standard.data(forKey: "patientList") {
            let decoder = JSONDecoder()
            do {
                let decoded = try decoder.decode([PatientModel].self, from: data)
                PrintDebug.printDebug("getting patients")
                return decoded
            } catch {
                print("Decoding failed:", error)
                return []
            }
        }
        return []
    }
    
    func getPatientById(id:Int) -> PatientModel? {
        let patientList = getPatients()
        return patientList.first{$0.id == id}
    }
    
    
}
