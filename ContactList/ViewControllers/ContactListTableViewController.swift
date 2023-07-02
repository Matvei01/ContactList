//
//  ContactListTableViewController.swift
//  ContactList
//
//  Created by Matvei Khlestov on 22.06.2022.
//

import UIKit

class ContactListTableViewController: UITableViewController {
    
    var persons: [Person] = []
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        persons.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "contactListCell",
            for: indexPath
        )
        
        var content = cell.defaultContentConfiguration()
        let contact = persons[indexPath.row]
        
        content.text = contact.fullname
        
        cell.contentConfiguration = content
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            guard let detailVC = segue.destination as? DetailInformationViewController else { return }
            detailVC.persons = persons[indexPath.row]
        }
    }
}
