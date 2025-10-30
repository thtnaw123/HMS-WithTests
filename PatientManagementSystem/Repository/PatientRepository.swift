//
//  PatientRepository.swift
//  PatientManagementSystem
//
//  Created by Tihitinaw Buzuwek on 30/10/2025.
//

import Foundation


import Foundation
import CoreData

final class PatientDataRepository {
    private let context: NSManagedObjectContext
    static let shared = PatientDataRepository()
    
    private init(context: NSManagedObjectContext = CoreDataStack.shared.viewContext) {
        self.context = context
    }
    
    func getPatients() -> [PatientModel] {
           let request: NSFetchRequest<PatientModelDataEntity> = PatientModelDataEntity.fetchRequest()
           request.sortDescriptors = [NSSortDescriptor(key: "patientName", ascending: true)]

           do {
               let entities = try context.fetch(request)
               return entities.map { $0.toDomainModel() }
           } catch {
               print("Fetch error: \(error)")
               return []
           }
    }
    
    
    func addPatient(newPatient: PatientModel) {
        let patientModelDataEntity = PatientModelDataEntity(context: context)
        
        patientModelDataEntity.patientId = Int32(newPatient.id)
        patientModelDataEntity.patientName = newPatient.name
        patientModelDataEntity.patientAge = Int32(newPatient.age)
        patientModelDataEntity.patientDiagnosis = newPatient.diagnosis
        
        
        CoreDataStack.shared.saveContext(context: context)
    }
    
    
    func updatePatient(_ patient: PatientModel) {
            let request: NSFetchRequest<PatientModelDataEntity> = PatientModelDataEntity.fetchRequest()
            request.predicate = NSPredicate(format: "patientId == %d", patient.id)
            
            do {
                if let entity = try context.fetch(request).first {
                    entity.patientName = patient.name
                    entity.patientAge = Int32(patient.age)
                    entity.patientDiagnosis = patient.diagnosis
                    CoreDataStack.shared.saveContext(context: context)
                }
            } catch {
                print("Update error: \(error)")
            }
        }
    
    
    func deletePatient(_ patient: PatientModel) {
            let request: NSFetchRequest<PatientModelDataEntity> = PatientModelDataEntity.fetchRequest()
            request.predicate = NSPredicate(format: "patientId == %d", patient.id)

            do {
                if let entity = try context.fetch(request).first {
                    context.delete(entity)
                    CoreDataStack.shared.saveContext(context: context)
                }
            } catch {
                print("Delete error: \(error)")
            }
        }
    
    
    
    
    

}
