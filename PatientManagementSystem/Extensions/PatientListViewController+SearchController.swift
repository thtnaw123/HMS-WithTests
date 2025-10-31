//
//  PatientListViewController+SearchController.swift
//  PatientManagementSystem
//
//  Created by Tihitinaw Buzuwek on 26/10/2025.
//

import UIKit

extension PatientListViewController{
    func setUpSearchController() {
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
    }
}


extension PatientListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let text = searchController.searchBar.text ?? ""
        patientViewModel.searchPatients(key: text)
    }
}
