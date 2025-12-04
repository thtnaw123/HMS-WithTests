//
//  PatientViewController+UITableViewDataSource.swift
//  PatientManagementSystem
//
//  Created by Tihitinaw Buzuwek on 26/10/2025.
//

import UIKit

extension PatientListViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearchActive
        ? patientViewModel.filteredPatientList.count
                    : patientViewModel.getPatientsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PatientListTableViewCell.idenetifier ,for:indexPath) as?
                PatientListTableViewCell else{
            return UITableViewCell()
        }
        let patient = isSearchActive ? patientViewModel.filteredPatientList[indexPath.row] : patientViewModel.getPatientsList[indexPath.row]
        cell.delegate = self
        cell.targetPatient = patient
        return cell
    }
    
    // MARK: - Swipe Actions
    func tableView(_ tableView: UITableView,
                                trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath)
                                -> UISwipeActionsConfiguration? {
            

            let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, completion in
//                self.data.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
                completion(true)
            }
            let editAction = UIContextualAction(style: .normal, title: "Edit") { _, _, completion in
                self.showEditAlert(for: indexPath)
                completion(true)
            }
            editAction.backgroundColor = .systemBlue
            
            let config = UISwipeActionsConfiguration(actions: [deleteAction, editAction])
            return config
        }
    
    
    // MARK: - Edit Helper
        func showEditAlert(for indexPath: IndexPath) {
            let alert = UIAlertController(title: "Edit Item",
                                          message: "Change the name:",
                                          preferredStyle: .alert)
//            alert.addTextField { textField in
//                textField.text = self.data[indexPath.row]
//            }
//            
//            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
//            alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { _ in
//                if let newText = alert.textFields?.first?.text, !newText.isEmpty {
//                    self.data[indexPath.row] = newText
//                    self.tableView.reloadRows(at: [indexPath], with: .automatic)
//                }
//            }))
            
            present(alert, animated: true)
        }
    
    
}
