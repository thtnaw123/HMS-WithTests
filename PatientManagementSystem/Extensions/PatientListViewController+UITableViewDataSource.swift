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
    
    
}
