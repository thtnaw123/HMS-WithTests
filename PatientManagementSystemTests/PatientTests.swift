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

        let newPatient = PatientUIObject(id: "\(newId)", name: "Abel Assefa", age: "25", diagnosis: "malnourishment")
        let validationResult = patientViewModel.validatePatientFields(newPatient: newPatient, isAddNew: true)
        
        guard let validPatientDetail:PatientModel = validationResult.validatedPatientDetail else {
            XCTFail("Invalid patient detail \(validationResult.errorMessage)")
            return
        }
        var initalPatientCount = patientViewModel.getPatientsList.count
        initalPatientCount+=1
        
        patientViewModel.addPatient(patient: validPatientDetail)
        
        let newPatientExists = patientViewModel.getPatientsList.contains(where: {$0.id == validPatientDetail.id})
        

        XCTAssertEqual(patientViewModel.getPatientsList.count, initalPatientCount, "Adding patient functionality not working")
        XCTAssertTrue(newPatientExists, "new patient doesn't exist in the list")
    }
    
    func testValidateValidPatientFields() throws  {
          let newId = Int.random(in: 1000...9999)
        
          let newPatient = PatientUIObject(id: "\(newId)", name: "Valid Name", age: "45", diagnosis: "Test Diagnosis")
          let validationResult = patientViewModel.validatePatientFields(newPatient: newPatient, isAddNew: false)
        
           XCTAssertTrue(validationResult.isValid)
    }
    
    func testValidateEmptyPatientName() throws {
        let newPatient = PatientUIObject(id: "1034", name: "", age: "45", diagnosis: "Test Diagnosis")
        let validationResult = patientViewModel.validatePatientFields(newPatient: newPatient, isAddNew: false)
        
        XCTAssertFalse(validationResult.isValid)
        XCTAssertEqual(validationResult.errorMessage, "Name is required")
        
       
        XCTAssertNil(validationResult.validatedPatientDetail,"validatedPatientDetail should be nil when validation fails, but got: \(String(describing: validationResult.validatedPatientDetail))" )
    }
    
    func testValidateInvalidPatientName() throws {
        let newPatient = PatientUIObject(id: "1034", name: "invalid $name", age: "45", diagnosis: "Test Diagnosis")
        let validationResult = patientViewModel.validatePatientFields(newPatient: newPatient, isAddNew: false)
        
        XCTAssertFalse(validationResult.isValid)
        XCTAssertEqual(validationResult.errorMessage, "Name should be only letters and spaces")
        
        if let validatedDetail = validationResult.validatedPatientDetail { XCTFail("validatedPatientDetail should be nil when validation fails, but got: \(validatedDetail)")
        }
    }
    
    func testValidateEmptyId() throws {
        let newPatient = PatientUIObject(id: "", name: "Guluma W", age: "45", diagnosis: "Test Diagnosis")
        let validationResult = patientViewModel.validatePatientFields(newPatient: newPatient, isAddNew: false)
        
        XCTAssertFalse(validationResult.isValid)
        XCTAssertEqual(validationResult.errorMessage, "Patient ID is required")
        
        if let validatedDetail = validationResult.validatedPatientDetail { XCTFail("validatedPatientDetail should be nil when validation fails, but got: \(validatedDetail)")
        }
    }
    
    
    func testValidateEmptyAge() throws {
        let newPatient = PatientUIObject(id: "1034", name: "Guluma W", age: "", diagnosis: "Test Diagnosis")
        let validationResult = patientViewModel.validatePatientFields(newPatient: newPatient, isAddNew: false)
        
        XCTAssertFalse(validationResult.isValid)
        XCTAssertEqual(validationResult.errorMessage, "Patient Age is required")
        if let validatedDetail = validationResult.validatedPatientDetail { XCTFail("validatedPatientDetail should be nil when validation fails, but got: \(validatedDetail)")
        }
    }
    
    func testValidateNegativeAge() throws {
        let newPatient = PatientUIObject(id: "1034", name: "Guluma W", age: "-12", diagnosis: "test diagnosis")
        let validationResult = patientViewModel.validatePatientFields(newPatient: newPatient, isAddNew: false)
        
        XCTAssertFalse(validationResult.isValid)
        XCTAssertEqual(validationResult.errorMessage, "Patient Age should be postive number")
        if let validatedDetail = validationResult.validatedPatientDetail { XCTFail("validatedPatientDetail should be nil when validation fails, but got: \(validatedDetail)")
        }
    }
    
    
    func testValidateAgeWithText() throws {
        let newPatient = PatientUIObject(id: "1034", name: "Guluma W", age: "Twelve", diagnosis: "test diagnosis")
        let validationResult = patientViewModel.validatePatientFields(newPatient: newPatient, isAddNew: false)
        
        XCTAssertFalse(validationResult.isValid)
        XCTAssertEqual(validationResult.errorMessage, "Patient Age should be postive number")
        if let validatedDetail = validationResult.validatedPatientDetail { XCTFail("validatedPatientDetail should be nil when validation fails, but got: \(validatedDetail)")
        }
    }
    
    
    func testValidateEmptyDiagnosis() throws {
        let newPatient = PatientUIObject(id: "1034", name: "Guluma W", age: "45", diagnosis: "")
        let validationResult = patientViewModel.validatePatientFields(newPatient: newPatient, isAddNew: false)
        
        XCTAssertFalse(validationResult.isValid)
        XCTAssertEqual(validationResult.errorMessage, "Diagnosis is required")
        XCTAssertNil(validationResult.validatedPatientDetail,"validatedPatientDetail should be nil when validation fails, but got: \(String(describing: validationResult.validatedPatientDetail))" )
    }
    
    func testValidateInvalidDiagnosis() throws {
        let newPatient = PatientUIObject(id: "1034", name: "Guluma W", age: "45", diagnosis: "RR $$")
        let validationResult = patientViewModel.validatePatientFields(newPatient: newPatient, isAddNew: true)
        
        XCTAssertFalse(validationResult.isValid)
        XCTAssertEqual(validationResult.errorMessage, "Diagnosis should be only letters and spaces")
        XCTAssertNil(validationResult.validatedPatientDetail,"validatedPatientDetail should be nil when validation fails, but got: \(String(describing: validationResult.validatedPatientDetail))" )
    }
    
    
    func testAddingDuplicatePatientShouldNotSucceed() {
        guard let firstPatient = patientViewModel.getPatientsList.first else {
            return
        }
        let patientListCount = patientViewModel.getPatientsList.count
        patientViewModel.addPatient(patient: firstPatient)

        if patientViewModel.getPatientsList.count != patientListCount {
            XCTFail("Duplicate patient should not have been added!")
        }
    }
    
    
    func testRemovePatient() throws {
        guard let firstPatient = patientViewModel.getPatientsList.first else {
            return
        }
        patientViewModel.deletePatient(patientToBeDeleted: firstPatient)
        let deletedPatientExists = patientViewModel.getPatientsList.contains(where: { $0.id == firstPatient.id })
        XCTAssertFalse(deletedPatientExists, "deleted patient exists")
        
    }
    
    func testCheckPatientExistsByID() throws {
     guard let lastPatient = patientViewModel.getPatientsList.last else {
        return
     }
     let exists = patientViewModel.checkIfIdExists(id: lastPatient.id)
     let notExists = patientViewModel.checkIfIdExists(id: 99)

     XCTAssertTrue(exists, "Patient with ID \(lastPatient.id) should exist in the list.")
     XCTAssertFalse(notExists, "Patient with ID 99 should not exist in the list.")
        
    }

    
    func testSearchPatientByName() throws {
        guard let lastPatient = patientViewModel.getPatientsList.first else {
           XCTFail("No patients found in the list to test with.")
           return
        }
        
        patientViewModel.searchPatients(key: lastPatient.name.lowercased())
        var searchedPatientExists = patientViewModel.filteredPatientList.contains(where: {$0.name == lastPatient.name})
        XCTAssertTrue(searchedPatientExists, "searched patient doen't exist")

        patientViewModel.searchPatients(key: lastPatient.name)
        searchedPatientExists = patientViewModel.filteredPatientList.contains(where: {$0.name == lastPatient.name})
        XCTAssertTrue(searchedPatientExists, "searched patient doen't exist")
        
        patientViewModel.searchPatients(key: "non existant name")
        XCTAssertEqual(patientViewModel.filteredPatientList.count, 0, "filtered patient should be empty")
    }
    
    
    func testUpdateExistingPatientDetails() throws {
        guard var patientToBeUpdated = patientViewModel.getPatientsList.first else {
           return
        }
        
        patientToBeUpdated.diagnosis = "Recovered"

        patientViewModel.updatePatient(patient: patientToBeUpdated)

        let updated = patientViewModel.getPatientsList.first(where: { $0.id == patientToBeUpdated.id })

        XCTAssertTrue(updated != nil, "Updated patient should exist in the list")
        XCTAssertEqual(updated?.diagnosis, "Recovered", "Diagnosis should be updated correctly")
    }
    
    func testAddPatientTriggersClosure() throws {
           var closureCalled = false
           patientViewModel.onPatientChanged = {
               closureCalled = true
           }
           let newId = Int.random(in: 1000...9999)

           let newPatient = PatientModel(id: newId, name: "New patient", age: 50, diagnosis: "Fever")
           patientViewModel.addPatient(patient: newPatient)

           XCTAssertTrue(closureCalled, "add patient closure not called")
           XCTAssertTrue(patientViewModel.getPatientsList.contains(where: { $0.id == newPatient.id }))
    }
    
    func testUpdatePatientTriggersClosure() throws {
            var closureCalled = false
            patientViewModel.onPatientChanged = {
                closureCalled = true
            }
        
            guard var patientToBeUpdated = patientViewModel.getPatientsList.first else {
               XCTFail("No patients found in the list to test with.")
               return
            }

            patientToBeUpdated.name="updated name"
            patientViewModel.updatePatient(patient: patientToBeUpdated)

            XCTAssertTrue(closureCalled, "on updated reload closure not called")
            let updatedPatientName = patientViewModel.getPatientsList.first(where: { $0.id == patientToBeUpdated.id })?.name
        
            XCTAssertEqual(updatedPatientName, patientToBeUpdated.name, "patient name not updated")
        }

    

}
