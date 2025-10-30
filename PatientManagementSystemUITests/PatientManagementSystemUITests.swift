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
    func testAppAddNewPatient() throws {
            let app = XCUIApplication()
            app.activate()
            app/*@START_MENU_TOKEN@*/.buttons["AddNewPatientButtonId"]/*[[".otherElements",".buttons[\"add\"]",".buttons[\"AddNewPatientButtonId\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch.tap()
            app/*@START_MENU_TOKEN@*/.textFields["IdTextFieldId"]/*[[".otherElements",".textFields[\"Add Patient Id\"]",".textFields[\"IdTextFieldId\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch.tap()
            app/*@START_MENU_TOKEN@*/.textFields["IdTextFieldId"]/*[[".otherElements",".textFields[\"98233\"]",".textFields[\"Add Patient Id\"]",".textFields[\"IdTextFieldId\"]"],[[[-1,3],[-1,2],[-1,1],[-1,0,1]],[[-1,3],[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch.typeText("89432")
            
            let element = app/*@START_MENU_TOKEN@*/.textFields["NameFieldId"]/*[[".otherElements",".textFields[\"Add Patient Name\"]",".textFields[\"NameFieldId\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch
            element.tap()
            element.tap()
            app/*@START_MENU_TOKEN@*/.textFields["NameFieldId"]/*[[".otherElements",".textFields[\"John Wic\"]",".textFields[\"Add Patient Name\"]",".textFields[\"NameFieldId\"]"],[[[-1,3],[-1,2],[-1,1],[-1,0,1]],[[-1,3],[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch.typeText("John Wick")
            
            let element2 = app/*@START_MENU_TOKEN@*/.textFields["AgeFieldId"]/*[[".otherElements",".textFields[\"Add Patient Age\"]",".textFields[\"AgeFieldId\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch
            element2.tap()
            element2.tap()
            app/*@START_MENU_TOKEN@*/.textFields["AgeFieldId"]/*[[".otherElements",".textFields[\"44\"]",".textFields[\"Add Patient Age\"]",".textFields[\"AgeFieldId\"]"],[[[-1,3],[-1,2],[-1,1],[-1,0,1]],[[-1,3],[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch.typeText("44")
            
            let element3 = app/*@START_MENU_TOKEN@*/.textFields["DiagnosisFieldId"]/*[[".otherElements",".textFields[\"Add Patient Diagnosis\"]",".textFields[\"DiagnosisFieldId\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch
            element3.tap()
            element3.tap()
            app/*@START_MENU_TOKEN@*/.textFields["DiagnosisFieldId"]/*[[".otherElements",".textFields[\"Diabets\"]",".textFields[\"Add Patient Diagnosis\"]",".textFields[\"DiagnosisFieldId\"]"],[[[-1,3],[-1,2],[-1,1],[-1,0,1]],[[-1,3],[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch.typeText("Diabets")
            app.buttons["AddPatientButtonId"].firstMatch.tap()
          
        }
  
   
    @MainActor
    func testAppSearchExistingPatients() throws {
        let app = XCUIApplication()
        app.activate()
        app/*@START_MENU_TOKEN@*/.searchFields["Search"].firstMatch/*[[".otherElements.searchFields[\"Search\"].firstMatch",".searchFields",".containing(.image, identifier: \"magnifyingglass\").firstMatch",".firstMatch",".searchFields[\"Search\"].firstMatch"],[[[-1,4],[-1,1,1],[-1,0]],[[-1,3],[-1,2]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.searchFields["Search"].firstMatch/*[[".otherElements.searchFields[\"Search\"].firstMatch",".searchFields",".containing(.button, identifier: \"Clear text\").firstMatch",".containing(.image, identifier: \"magnifyingglass\").firstMatch",".firstMatch",".searchFields[\"Search\"].firstMatch"],[[[-1,5],[-1,1,1],[-1,0]],[[-1,4],[-1,3],[-1,2]]],[0]]@END_MENU_TOKEN@*/.typeText("Guluma Wakuma")
    
    }
    
    @MainActor
    func testNavigation() throws {
      
        let app = XCUIApplication()
        app.activate()
        app/*@START_MENU_TOKEN@*/.buttons["AddNewPatientButtonId"]/*[[".otherElements",".buttons[\"add\"]",".buttons[\"AddNewPatientButtonId\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch.tap()
        
        let element = app/*@START_MENU_TOKEN@*/.buttons["BackButton"]/*[[".navigationBars",".buttons",".buttons[\"Back\"]",".buttons[\"BackButton\"]"],[[[-1,3],[-1,2],[-1,0,1]],[[-1,3],[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch
        element.tap()
        app.buttons.matching(identifier: "EditPatientButton").element(boundBy: 1).tap()
        element.tap()
    }
    
    @MainActor
    func testAppAddNewPatientWithEmptyName() throws {
        let app = XCUIApplication()
        app.activate()
        app/*@START_MENU_TOKEN@*/.buttons["AddNewPatientButtonId"]/*[[".otherElements",".buttons[\"add\"]",".buttons[\"AddNewPatientButtonId\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch.tap()
        app/*@START_MENU_TOKEN@*/.textFields["IdTextFieldId"]/*[[".otherElements",".textFields[\"Add Patient Id\"]",".textFields[\"IdTextFieldId\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch.tap()
        app/*@START_MENU_TOKEN@*/.textFields["IdTextFieldId"]/*[[".otherElements",".textFields[\"44343\"]",".textFields[\"Add Patient Id\"]",".textFields[\"IdTextFieldId\"]"],[[[-1,3],[-1,2],[-1,1],[-1,0,1]],[[-1,3],[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch.typeText("44343")
        app/*@START_MENU_TOKEN@*/.buttons["AddPatientButtonId"]/*[[".buttons.containing(.staticText, identifier: \"Add Patient\")",".otherElements",".buttons[\"Add Patient\"]",".buttons[\"AddPatientButtonId\"]"],[[[-1,3],[-1,2],[-1,1,1],[-1,0]],[[-1,3],[-1,2]]],[0]]@END_MENU_TOKEN@*/.firstMatch.tap()

    }
    
    
    @MainActor
    func testUpdatePatient() throws {
        
        let app = XCUIApplication()
        app.launch()
        app.buttons.matching(identifier: "EditPatientButton").element(boundBy: 0).tap()
        app/*@START_MENU_TOKEN@*/.textFields["NameFieldId"]/*[[".otherElements",".textFields[\"vast east\"]",".textFields[\"Add Patient Name\"]",".textFields[\"NameFieldId\"]"],[[[-1,3],[-1,2],[-1,1],[-1,0,1]],[[-1,3],[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch.doubleTap()
        app/*@START_MENU_TOKEN@*/.textFields["NameFieldId"]/*[[".otherElements",".textFields[\"vast\"]",".textFields[\"Add Patient Name\"]",".textFields[\"NameFieldId\"]"],[[[-1,3],[-1,2],[-1,1],[-1,0,1]],[[-1,3],[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch.typeKey(.delete, modifierFlags:[])
        app/*@START_MENU_TOKEN@*/.textFields["NameFieldId"]/*[[".otherElements",".textFields[\"vas\"]",".textFields[\"Add Patient Name\"]",".textFields[\"NameFieldId\"]"],[[[-1,3],[-1,2],[-1,1],[-1,0,1]],[[-1,3],[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch.typeKey(.delete, modifierFlags:[])
        app/*@START_MENU_TOKEN@*/.textFields["NameFieldId"]/*[[".otherElements",".textFields[\"va\"]",".textFields[\"Add Patient Name\"]",".textFields[\"NameFieldId\"]"],[[[-1,3],[-1,2],[-1,1],[-1,0,1]],[[-1,3],[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch.typeKey(.delete, modifierFlags:[])
        
        let element = app/*@START_MENU_TOKEN@*/.textFields["NameFieldId"]/*[[".otherElements",".textFields[\"v\"]",".textFields[\"Add Patient Name\"]",".textFields[\"NameFieldId\"]"],[[[-1,3],[-1,2],[-1,1],[-1,0,1]],[[-1,3],[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch
        element.typeKey(.delete, modifierFlags:[])
        element.typeKey(.delete, modifierFlags:[])
        
        let element2 = app/*@START_MENU_TOKEN@*/.textFields["NameFieldId"]/*[[".otherElements",".textFields[\"Add Patient Name\"]",".textFields[\"NameFieldId\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch
        element2.typeKey(.delete, modifierFlags:[])
        element2.typeKey(.delete, modifierFlags:[])
        element2.typeKey(.delete, modifierFlags:[])
        app/*@START_MENU_TOKEN@*/.textFields["NameFieldId"]/*[[".otherElements",".textFields[\"John Wick\"]",".textFields[\"Add Patient Name\"]",".textFields[\"NameFieldId\"]"],[[[-1,3],[-1,2],[-1,1],[-1,0,1]],[[-1,3],[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch.typeText("Updated Name")
        app/*@START_MENU_TOKEN@*/.buttons["UpdatePatientButtonId"]/*[[".buttons.containing(.staticText, identifier: \"Update Patient\")",".otherElements",".buttons[\"Update Patient\"]",".buttons[\"UpdatePatientButtonId\"]"],[[[-1,3],[-1,2],[-1,1,1],[-1,0]],[[-1,3],[-1,2]]],[0]]@END_MENU_TOKEN@*/.firstMatch.tap()

    }
    
    @MainActor
    func testDeletePatient() throws {
        let app = XCUIApplication()
        app.activate()
        app.buttons.matching(identifier: "DeletePatientButton").element(boundBy: 0).tap()
        app/*@START_MENU_TOKEN@*/.buttons["Delete"]/*[[".otherElements.buttons[\"Delete\"]",".buttons[\"Delete\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.firstMatch.tap()
        
    }
    
    
    
    @MainActor
    func testChangeTheme() throws {
        let app = XCUIApplication()
        app.activate()
        app/*@START_MENU_TOKEN@*/.buttons["ChangeThemeButtonId"]/*[[".otherElements",".buttons[\"do not disturb\"]",".buttons[\"ChangeThemeButtonId\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch.tap()
        app/*@START_MENU_TOKEN@*/.buttons["AddNewPatientButtonId"]/*[[".otherElements",".buttons[\"add\"]",".buttons[\"AddNewPatientButtonId\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch.tap()
        
        let element = app/*@START_MENU_TOKEN@*/.buttons["BackButton"]/*[[".navigationBars",".buttons",".buttons[\"Back\"]",".buttons[\"BackButton\"]"],[[[-1,3],[-1,2],[-1,0,1]],[[-1,3],[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch
        element.tap()
        app.buttons.matching(identifier: "EditPatientButton").element(boundBy: 0).tap()
        element.tap()
    }
    
}
