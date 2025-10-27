//
//  Validator.swift
//  PatientManagementSystem
//
//  Created by Tihitinaw Buzuwek on 25/10/2025.
//

import Foundation

class Validator{
    
    func validatePostiveNumbers(age: String) -> Int? {
        guard let numberAge = Int(age), numberAge > 0 else {
            return nil
        }
        return numberAge
    }

    func checkIfEmpty(name: String, fieldName: String) -> (isValid: Bool, errorMessage: String) {
        var pName = name.trimmingCharacters(in: .whitespaces)
        guard  !pName.isEmpty else {
            return (false, "\(fieldName) is required")
        }
        return (true, "")
    }


    
    func checkIfOnlyCharAndSpace(_ input: String?) -> Bool {
        guard let input = input, !input.isEmpty else { return false }
        let allowedNames = CharacterSet.letters.union(.whitespaces)
        return input.rangeOfCharacter(from: allowedNames.inverted) == nil
    }

    
}
