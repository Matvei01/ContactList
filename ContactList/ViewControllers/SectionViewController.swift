//
//  SectionViewController.swift
//  ContactList
//
//  Created by Matvei Khlestov on 22.06.2022.
//

import UIKit

final class SectionViewController: UITableViewController {
    
    // MARK: - Public Properties
    var persons: [Person] = []
    
    // MARK: - Private Properties
    private let cellID = "contactID"
    
    // MARK: - Life cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

// MARK: - Private Methods
extension SectionViewController {
    private func configure() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        title = "Contacts"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

// MARK: - Table view data source
extension SectionViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        persons.count
    }
    
    override func tableView(_ tableView: UITableView,
                            viewForHeaderInSection section: Int) -> UIView? {
        
        let headerLabel = UILabel(frame: CGRect(
            x: 10,
            y: 0,
            width: tableView.frame.width,
            height: 35)
        )
        
        headerLabel.font = .boldSystemFont(ofSize: 20)
        headerLabel.text = "\(persons[section].fullName)"
        
        let header = UIView()
        header.backgroundColor = .secondarySystemBackground
        header.addSubview(headerLabel)
        
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
            withIdentifier: cellID,
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
}

// MARK: - Table view delegate
extension SectionViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
