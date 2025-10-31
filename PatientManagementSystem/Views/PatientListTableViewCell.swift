//
//  PatientListTableViewCell.swift
//  PatientManagementSystem
//
//  Created by Tihitinaw Buzuwek on 26/10/2025.
//

import UIKit

protocol PatientListTableViewCellDelgate{
    func editPatientData(patient:PatientModel)
    func deletePatientData(patient:PatientModel)
}

class PatientListTableViewCell: UITableViewCell {

    @IBOutlet weak var patientNameLabel: UILabel!
    
    @IBOutlet weak var editPatientButton: UIButton!
    
    @IBOutlet weak var deletePatientButton: UIButton!
    
    static let idenetifier = "PatientListTableViewCellIdentifier"
        
    var delegate:PatientListTableViewCellDelgate?
    
    var targetPatient:PatientModel! {
        didSet {
            patientNameLabel.text = targetPatient.name
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    @IBAction func editPatientAction(_ sender: Any) {
        delegate?.editPatientData(patient: targetPatient)
    }
    
    @IBAction func deletePatientAction(_ sender: Any) {
        delegate?.deletePatientData(patient: targetPatient)
    }
}
    