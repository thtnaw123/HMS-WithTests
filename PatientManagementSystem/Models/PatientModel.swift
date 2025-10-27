//
//  PatientModel.swift
//  PatientManagementSystem
//
//  Created by Tihitinaw Buzuwek on 25/10/2025.
//

import Foundation

struct PatientModel:Codable, Equatable{
    var id:Int
    var name:String
    var age:Int
    var diagnosis:String
}
