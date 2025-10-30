//
//  PatientDataEntity+CoreDataProperties.swift
//  PatientManagementSystem
//
//  Created by Tihitinaw Buzuwek on 30/10/2025.
//
//

public import Foundation
public import CoreData


public typealias PatientDataEntityCoreDataPropertiesSet = NSSet

extension PatientDataEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PatientDataEntity> {
        return NSFetchRequest<PatientDataEntity>(entityName: "PatientDataEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var id: Int16
    @NSManaged public var diagnosis: String?

}

extension PatientDataEntity : Identifiable {

}
