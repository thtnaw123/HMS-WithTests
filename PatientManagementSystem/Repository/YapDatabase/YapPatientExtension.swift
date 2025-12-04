//
//  YapPatientExtension.swift
//  PatientManagementSystem
//
//  Created by Tihitinaw Buzuwek on 26/11/2025.
//

import Foundation
import YapDatabase

enum YapPatientExtension {
    static let viewName = "patientsSortedView"
    
    static func register(in db: YapDatabase) {
        
        let grouping = YapDatabaseViewGrouping.withObjectBlock {
            (transaction, collection, key, object) -> String? in
            return "all"
        }
        
        let sorting = YapDatabaseViewSorting.withObjectBlock {
            (transaction, group,
             collection1, key1, obj1,
             collection2, key2, obj2) -> ComparisonResult in
            
            guard let p1 = obj1 as? PatientModel,
                  let p2 = obj2 as? PatientModel else {
                return .orderedSame
            }
            
            return p1.name.localizedCaseInsensitiveCompare(p2.name)
        }
        
        let view = YapDatabaseAutoView(
            grouping: grouping,
            sorting: sorting,
            versionTag: "v1"
        )
        
        db.register(view, withName: viewName)
    }
}


