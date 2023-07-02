//
//  TabBarViewController.swift
//  ContactList
//
//  Created by Matvei Khlestov on 22.06.2022.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    private let persons = Person.getPersons()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let contactListVC = viewControllers?.first as? ContactListTableViewController else { return }
        contactListVC.persons = persons
        
        guard let sectionVC = viewControllers?.last as? SectionTableViewController else { return }
        sectionVC.persons = persons
    }
}
