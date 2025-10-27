//
//  ViewController.swift
//  PatientManagementSystem
//
//  Created by Tihitinaw Buzuwek on 25/10/2025.
//

import UIKit

class PatientListViewController: UIViewController {
    
    @IBOutlet weak var patientListTableView: UITableView!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    let patientViewModel = PatientViewModel()
    
    var isSearchActive: Bool {
         return searchController.isActive && !(searchController.searchBar.text?.isEmpty ?? true)
    }
    
    var allPatients:[PatientModel] {patientViewModel.getPatientsList}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        setupSearchController()

    }
    
    
    @IBAction func addPatientAction(_ sender: Any) {
        if let destinationVC = routeToPage(identifier: "AddPatientViewController") as? AddPatientViewController{
            destinationVC.addPatientController.patientViewModel = self.patientViewModel
            
            destinationVC.addPatientController.patientViewModel
                .onPatientAdded = { [weak self] in
                self?.patientListTableView.reloadData()
            }
            navigationController?.pushViewController(destinationVC, animated: true)
        }
    }
    
    func setUpTableView(){
        let nib = UINib(nibName: "PatientListTableViewCell", bundle: nil)
        patientListTableView.register(nib, forCellReuseIdentifier: PatientListTableViewCell.idenetifier)
        patientListTableView.dataSource = self
        patientListTableView.delegate = self
    }
    
    
    func routeToPage(identifier:String) -> UIViewController? {
        if let destinationVC = storyboard?.instantiateViewController(withIdentifier: identifier){
            return destinationVC
        }
        return nil
    }

}

