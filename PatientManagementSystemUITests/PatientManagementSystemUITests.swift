//
//  PatientManagementSystemUITests.swift
//  PatientManagementSystemUITests
//
//  Created by Tihitinaw Buzuwek on 25/10/2025.
//

import XCTest

final class PatientManagementSystemUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    @MainActor
    func testLaunchPerformance() throws {
        // This measures how long it takes to launch your application.
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
    
    
    @MainActor
    func testAppLaunch() throws {
        let app = XCUIApplication()
        app.activate()
    }
    
    @MainActor
    func testAppAddNewPatientWithEmptyId() throws {
        let app = XCUIApplication()
        app.activate()
        app/*@START_MENU_TOKEN@*/.buttons["AddNewPatientButtonId"]/*[[".otherElements",".buttons[\"add\"]",".buttons[\"AddNewPatientButtonId\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch.tap()
        app/*@START_MENU_TOKEN@*/.buttons["AddPatientButtonId"]/*[[".buttons.containing(.staticText, identifier: \"Add Patient\")",".otherElements",".buttons[\"Add Patient\"]",".buttons[\"AddPatientButtonId\"]"],[[[-1,3],[-1,2],[-1,1,1],[-1,0]],[[-1,3],[-1,2]]],[0]]@END_MENU_TOKEN@*/.firstMatch.tap()
      
        let message = app.staticTexts["Patient ID is required"]
        XCTAssertTrue(message.exists)
        
    }
    
    @MainActor
    func testAppAddNewPatientWithEmptyName() throws {
        let app = XCUIApplication()
        app.activate()
        app/*@START_MENU_TOKEN@*/.buttons["AddNewPatientButtonId"]/*[[".otherElements",".buttons[\"add\"]",".buttons[\"AddNewPatientButtonId\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch.tap()
        app/*@START_MENU_TOKEN@*/.textFields["IdTextFieldId"]/*[[".otherElements",".textFields[\"Add Patient Id\"]",".textFields[\"IdTextFieldId\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch.tap()
        app/*@START_MENU_TOKEN@*/.textFields["IdTextFieldId"]/*[[".otherElements",".textFields[\"783\"]",".textFields[\"Add Patient Id\"]",".textFields[\"IdTextFieldId\"]"],[[[-1,3],[-1,2],[-1,1],[-1,0,1]],[[-1,3],[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch.typeText("7834")
        
        let element = app/*@START_MENU_TOKEN@*/.textFields["NameFieldId"]/*[[".otherElements",".textFields[\"Add Patient Name\"]",".textFields[\"NameFieldId\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch
        element.tap()
        element.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Add Patient"]/*[[".buttons",".staticTexts",".staticTexts[\"Add Patient\"]"],[[[-1,2],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch.tap()
        
        let message = app.staticTexts["Patient Name is required"]
        XCTAssertTrue(message.exists)
  
    }
    
    
    
    
    @MainActor
    func testAppAddNewPatient() throws {
        let app = XCUIApplication()
        app.launch()
        app.buttons["AddNewPatientButtonId"].firstMatch.tap()
        app/*@START_MENU_TOKEN@*/.textFields["IdTextFieldId"]/*[[".otherElements",".textFields[\"Add Patient Id\"]",".textFields[\"IdTextFieldId\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch.tap()
        app/*@START_MENU_TOKEN@*/.textFields["IdTextFieldId"]/*[[".otherElements",".textFields[\"185\"]",".textFields[\"Add Patient Id\"]",".textFields[\"IdTextFieldId\"]"],[[[-1,3],[-1,2],[-1,1],[-1,0,1]],[[-1,3],[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch.typeText("1854")
        
        let element = app/*@START_MENU_TOKEN@*/.textFields["NameFieldId"]/*[[".otherElements",".textFields[\"Add Patient Name\"]",".textFields[\"NameFieldId\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch
        element.typeText("\t")
        element.tap()
        app/*@START_MENU_TOKEN@*/.textFields["NameFieldId"]/*[[".otherElements",".textFields[\"John Isac\"]",".textFields[\"Add Patient Name\"]",".textFields[\"NameFieldId\"]"],[[[-1,3],[-1,2],[-1,1],[-1,0,1]],[[-1,3],[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch.typeText("John Isack")
        
        let element2 = app/*@START_MENU_TOKEN@*/.textFields["AgeFieldId"]/*[[".otherElements",".textFields[\"Add Patient Age\"]",".textFields[\"AgeFieldId\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch
        element2.tap()
        element2.typeText("\t")
        element2.tap()
        app/*@START_MENU_TOKEN@*/.textFields["AgeFieldId"]/*[[".otherElements",".textFields[\"34\"]",".textFields[\"Add Patient Age\"]",".textFields[\"AgeFieldId\"]"],[[[-1,3],[-1,2],[-1,1],[-1,0,1]],[[-1,3],[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch.typeText("34")
        
        let element3 = app/*@START_MENU_TOKEN@*/.textFields["DiagnosisFieldId"]/*[[".otherElements",".textFields[\"Add Patient Diagnosis\"]",".textFields[\"DiagnosisFieldId\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch
        element3.typeText("\t")
        element3.tap()
        app/*@START_MENU_TOKEN@*/.textFields["DiagnosisFieldId"]/*[[".otherElements",".textFields[\"Head Ache\"]",".textFields[\"Add Patient Diagnosis\"]",".textFields[\"DiagnosisFieldId\"]"],[[[-1,3],[-1,2],[-1,1],[-1,0,1]],[[-1,3],[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch.typeText("Head Ache")
        app/*@START_MENU_TOKEN@*/.buttons["AddPatientButtonId"]/*[[".buttons.containing(.staticText, identifier: \"Add Patient\")",".otherElements",".buttons[\"Add Patient\"]",".buttons[\"AddPatientButtonId\"]"],[[[-1,3],[-1,2],[-1,1,1],[-1,0]],[[-1,3],[-1,2]]],[0]]@END_MENU_TOKEN@*/.firstMatch.tap()
       
        let newPatientCell=app.staticTexts["John Isack"]
        XCTAssertTrue(newPatientCell.exists)
    }
    
    @MainActor
    func testAppSearchExistingPatients() throws {
        
        let app = XCUIApplication()
        app.activate()
        app/*@START_MENU_TOKEN@*/.searchFields["Search"].firstMatch/*[[".otherElements.searchFields[\"Search\"].firstMatch",".searchFields",".containing(.button, identifier: \"Clear text\").firstMatch",".containing(.image, identifier: \"magnifyingglass\").firstMatch",".firstMatch",".searchFields[\"Search\"].firstMatch"],[[[-1,5],[-1,1,1],[-1,0]],[[-1,4],[-1,3],[-1,2]]],[0]]@END_MENU_TOKEN@*/.typeText("Guluma")
        app/*@START_MENU_TOKEN@*/.buttons["close"]/*[[".otherElements.buttons[\"close\"]",".buttons[\"close\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.firstMatch.tap()
        
        let newPatientCell=app.staticTexts["Guluma"]
        XCTAssertTrue(newPatientCell.exists)

    }
   
    
    
    
    
}
