//
//  DetailsViewController.swift
//  ContactList
//
//  Created by Matvei Khlestov on 22.06.2022.
//

import UIKit

final class DetailsViewController: UIViewController {
    
    // MARK: - Public Properties
    var persons: Person!
    
    // MARK: - UI Elements
    private lazy var contactDetailStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 16
        
        return stackView
    }()
    
    private lazy var phoneLabel: UILabel = {
        createLabel(title: "Phone: \(persons.phone)")
    }()
    
    private lazy var emailLabel: UILabel = {
        createLabel(title: "Email: \(persons.email)")
    }()
    
    // MARK: - Life cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

// MARK: - Private Methods
extension DetailsViewController {
    private func configure() {
        view.backgroundColor = .white
        
        setupSubviews()
        
        setupNavigationBar()
        
        setConstraints()
    }
    
    private func setupSubviews() {
        view.addSubview(contactDetailStackView)
        
        setupSubviewsForStackView(phoneLabel, emailLabel)
    }
    
    private func setupSubviewsForStackView(_ subviews: UIView... ) {
        for subview in subviews {
            contactDetailStackView.addArrangedSubview(subview)
        }
    }
    
    private func setupNavigationBar() {
        title = persons.fullName
    }
    
    private func createLabel(title: String) -> UILabel {
        let label = UILabel()
        label.text = title
        label.font = .systemFont(ofSize: 20)
        
        return label
    }
}

// MARK: - Constraints
extension DetailsViewController {
    private func setConstraints() {
        contactDetailStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [
                contactDetailStackView.topAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.topAnchor,
                    constant: 69
                ),
                contactDetailStackView.leadingAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                    constant: 16
                ),
                contactDetailStackView.trailingAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                    constant: -16
                )
            ]
        )
    }
}
