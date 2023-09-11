//
//  TabBarController.swift
//  ContactList
//
//  Created by Matvei Khlestov on 22.06.2022.
//

import UIKit

final class TabBarController: UITabBarController {
    
    private let persons = Person.getPersons()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
    }
    
    private func generateTabBar() {
        let contactListVC = ContactListViewController()
        contactListVC.persons = persons
        
        let sectionVC = SectionViewController()
        sectionVC.persons = persons
        
        let navContactListVC = UINavigationController(rootViewController: contactListVC)
        let navSectionVC = UINavigationController(rootViewController: sectionVC)
        
        
        viewControllers = [
            generateVC(
                viewController: navContactListVC,
                title: "Contact List",
                image: UIImage(systemName: "person.crop.circle.fill")
            ),
            generateVC(
                viewController: navSectionVC,
                title: "Contacts",
                image: UIImage(systemName: "phone.circle.fill")
            )
        ]
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        
        return viewController
    }
}
