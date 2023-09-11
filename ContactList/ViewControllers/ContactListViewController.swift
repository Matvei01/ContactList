//
//  ContactListViewController.swift
//  ContactList
//
//  Created by Matvei Khlestov on 22.06.2022.
//

import UIKit

final class ContactListViewController: UITableViewController {
    
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
extension ContactListViewController {
    private func configure() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        title = "Contact List"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

// MARK: - Table view data source
extension ContactListViewController {
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        persons.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(
            withIdentifier: cellID,
            for: indexPath
        )
        
        var content = cell.defaultContentConfiguration()
        let contact = persons[indexPath.row]
        
        content.text = contact.fullName
        
        cell.contentConfiguration = content
        
        return cell
    }
}

// MARK: - Table view delegate
extension ContactListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = DetailsViewController()
        let persons = persons[indexPath.row]
        detailsVC.persons = persons
        
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}
