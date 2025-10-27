//
//  PatientTests.swift
//  PatientManagementSystemTests
//
//  Created by Tihitinaw Buzuwek on 25/10/2025.
//

import XCTest
@testable import PatientManagementSystem
final class PatientTests: XCTestCase {
    var patientViewModel:PatientViewModel!
    var mockPatients: [PatientModel]!

    override func setUp(){
        super.setUp()
        patientViewModel = PatientViewModel()
        
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testAddPatient() throws {
        let newId = Int.random(in: 1000...9999)

        let patient3 = PatientModel(id: newId, name: "Abel Assefa", age: 25, diagnosis: "malnourishment")

        var initalPatientCount = patientViewModel.getPatientsList.count
        initalPatientCount+=1
        patientViewModel.addPatient(patient: patient3)
        
        XCTAssertEqual(patientViewModel.getPatientsList.count, initalPatientCount, "Adding patient functionality not working")
    }
    
    func testSearchPatientByID() throws{
           let exists = patientViewModel.checkIfIdExists(id: 2)
           XCTAssertTrue(exists, "Patient with ID 2 should exist")

           let notExists = patientViewModel.checkIfIdExists(id: 99)
           XCTAssertFalse(notExists, "Patient with ID 99 should not exist")
    }
    
    func testSearchPatientByName()throws {
        patientViewModel.searchPatients(key: "abdisa")
        XCTAssertEqual(patientViewModel.filteredPatientList.count, 1)
        XCTAssertEqual(patientViewModel.filteredPatientList.first?.name, "Abdisa wake")

        patientViewModel.searchPatients(key: "Solomon")
        XCTAssertEqual(patientViewModel.filteredPatientList.count, 1)
        XCTAssertEqual(patientViewModel.filteredPatientList.first?.name, "Solomon Bekele")
    }
    
    func testUpdateExistingPatientDetails() throws {
        var updatedPatient = patientViewModel.getPatientsList[0]
        updatedPatient.diagnosis = "Recovered"

        patientViewModel.updatePatient(patient: updatedPatient)

        let updated = patientViewModel.patientList.first(where: { $0.id == updatedPatient.id })

        XCTAssertTrue(updated != nil, "Updated patient should exist in the list")
        XCTAssertEqual(updated?.diagnosis, "Recovered", "Diagnosis should be updated correctly")
    }
    
    func testAddPatientTriggersClosure() throws {
           var closureCalled = false
           patientViewModel.onPatientAdded = {
               closureCalled = true
           }

           let newPatient = PatientModel(id: 401, name: "New p", age: 50, diagnosis: "Fever")
           patientViewModel.addPatient(patient: newPatient)

           XCTAssertTrue(closureCalled)
           XCTAssertTrue(patientViewModel.patientList.contains(where: { $0.id == 401 }))
    }
    
    func testUpdatePatientTriggersClosure() throws {
            var closureCalled = false
            patientViewModel.onPatientUpdated = {
                closureCalled = true
            }

            let updatedPatient = PatientModel(id: 2, name: "Solomon Updated", age: 26, diagnosis: "Recovered")
            patientViewModel.updatePatient(patient: updatedPatient)

            XCTAssertTrue(closureCalled)
            XCTAssertEqual(patientViewModel.patientList.first(where: { $0.id == 2 })?.name, "Solomon Updated")
        }
    
    
    func testValidateValidPatientFields() throws  {
            let newPatient = PatientModelTranserO(id: "10", name: "Valid Name", age: "45", diagnosis: "Test Diagnosis")
           let validationResult = patientViewModel.validatePatientFields(newPatient: newPatient, isAddNew: false)
        
           XCTAssertTrue(validationResult.isValid)

    }
    
    func testValidateEmptyPatientName() throws {
        let newPatient = PatientModelTranserO(id: "1034", name: "", age: "45", diagnosis: "Test Diagnosis")
        let validationResult = patientViewModel.validatePatientFields(newPatient: newPatient, isAddNew: false)
        
        XCTAssertFalse(validationResult.isValid)
        XCTAssertEqual(validationResult.errorMessage, "Patient Name is required")
    }
    
    func testValidateEmptyId() throws {
        let newPatient = PatientModelTranserO(id: "", name: "Guluma W.", age: "45", diagnosis: "Test Diagnosis")
        let validationResult = patientViewModel.validatePatientFields(newPatient: newPatient, isAddNew: false)
        
        XCTAssertFalse(validationResult.isValid)
        XCTAssertEqual(validationResult.errorMessage, "Patient ID is required")
    }
    
    func testValidateEmptyAge() throws {
        let newPatient = PatientModelTranserO(id: "1034", name: "Guluma W", age: "", diagnosis: "Test Diagnosis")
        let validationResult = patientViewModel.validatePatientFields(newPatient: newPatient, isAddNew: false)
        
        XCTAssertFalse(validationResult.isValid)
        XCTAssertEqual(validationResult.errorMessage, "Patient Age is required")
    }
    
    func testValidateEmptyDiagnosis() throws {
        let newPatient = PatientModelTranserO(id: "1034", name: "Guluma W", age: "45", diagnosis: "")
        let validationResult = patientViewModel.validatePatientFields(newPatient: newPatient, isAddNew: false)
        
        XCTAssertFalse(validationResult.isValid)
        XCTAssertEqual(validationResult.errorMessage, "Patient Diagnosis is required")
    }
    
    
    func testValidateNegativeAge() throws {
        let newPatient = PatientModelTranserO(id: "1034", name: "Guluma W", age: "-12", diagnosis: "test diagnosis")
        let validationResult = patientViewModel.validatePatientFields(newPatient: newPatient, isAddNew: false)
        
        XCTAssertFalse(validationResult.isValid)
        XCTAssertEqual(validationResult.errorMessage, "Patient Age should be postive number")
    }
    
    func testAddingDuplicatePatientShouldNotSucceed() {
        let patient = PatientModel(id: 100, name: "Alice", age: 30, diagnosis: "Flu")
        patientViewModel.addPatient(patient: patient)

        let patientListCount = patientViewModel.getPatientsList.count
        patientViewModel.addPatient(patient: patient)

        if patientViewModel.getPatientsList.count != patientListCount {
            XCTFail("Duplicate patient should not have been added!")
        }
    }

    

    

    

}
