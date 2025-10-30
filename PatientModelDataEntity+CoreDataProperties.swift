//
//  PatientModelDataEntity+CoreDataProperties.swift
//  PatientManagementSystem
//
//  Created by Tihitinaw Buzuwek on 30/10/2025.
//
//

public import Foundation
public import CoreData


public typealias PatientModelDataEntityCoreDataPropertiesSet = NSSet

extension PatientModelDataEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PatientModelDataEntity> {
        return NSFetchRequest<PatientModelDataEntity>(entityName: "PatientModelDataEntity")
    }

    @NSManaged public var patientName: String?
    @NSManaged public var patientAge: Int32
    @NSManaged public var patientId: Int32
    @NSManaged public var patientDiagnosis: String?

}

extension PatientModelDataEntity : Identifiable {

}
