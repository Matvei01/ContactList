//
//  Person.swift
//  ContactList
//
//  Created by Matvei Khlestov on 22.06.2022.
//

struct Person {
    let name: String
    let surname: String
    let email: String
    let phone: String
    
    var fullname: String {
        "\(name) \(surname)"
    }
    
    static func getPersons() -> [Person] {
        
        var persons = [Person]()
        
        let names = DataManager.shared.names.shuffled()
        let surnames = DataManager.shared.surnames.shuffled()
        let emails = DataManager.shared.emails.shuffled()
        let phones = DataManager.shared.phones.shuffled()
        
        let itarationCount = min(
            names.count,
            surnames.count,
            emails.count,
            phones.count
        )
        
        for index in 0..<itarationCount {
            let person = Person(
                name: names[index],
                surname: surnames[index],
                email: emails[index],
                phone: phones[index]
            )
            
            persons.append(person)
        }
        
        return persons
    }
}
