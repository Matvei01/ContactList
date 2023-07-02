//
//  DetailInformationViewController.swift
//  ContactList
//
//  Created by Matvei Khlestov on 22.06.2022.
//

import UIKit

class DetailInformationViewController: UIViewController {
    
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var persons: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = persons.fullname
        
        phoneLabel.text = "Phone: \(persons.phone)"
        emailLabel.text = "Email: \(persons.email)"
    }
}
