//
//  SectionTableViewController.swift
//  ContactList
//
//  Created by Matvei Khlestov on 22.06.2022.
//

import UIKit

class SectionTableViewController: UITableViewController {

    var persons: [Person] = []
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        persons.count
    }
    
    override func tableView(_ tableView: UITableView,
                            viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: CGRect(
            x: 0,
            y: 0,
            width: view.frame.size.width,
            height: 100)
        )
        
        header.backgroundColor = .secondarySystemBackground

        let headerLabel = UILabel(frame: CGRect(
            x: 10,
            y: 5,
            width: 200,
            height: 22)
        )
        
        header.addSubview(headerLabel)
        headerLabel.font = .boldSystemFont(ofSize: 20)
        headerLabel.text = "\(persons[section].fullname)"
        
        return header
    }

    override func tableView(_ tableView: UITableView,
                            heightForHeaderInSection section: Int) -> CGFloat {
        33
    }
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        
        2
    }

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "sectionContactCell",
            for: indexPath
        )

        var content = cell.defaultContentConfiguration()
        let contact = persons[indexPath.section]
        
        if indexPath.row == 0 {
            content.text = contact.phone
            content.image = UIImage(named: "phone")
        } else {
            content.text = contact.email
            content.image = UIImage(named: "email")
        }
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
