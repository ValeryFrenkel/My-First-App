//
//  ProfileViewController.swift
//  My First App
//
//  Created by Valery Frenkel on 11/3/20.
//

import UIKit
import Contacts

class ProfileViewController : UIViewController, UITableViewDataSource, UITextViewDelegate{

    @IBOutlet weak var usernameValue: UILabel!
    @IBOutlet weak var logoutButton: UIButton!
    
    var textLabel = ""
    
    var contacts = [FetchedContacts]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .yellow
      
        usernameValue.text = UserManager.username
        
        self.view.addSubview(self.tableView)
        self.tableView.dataSource = self
        
        self.fetchContacts()
    }
    
    @IBAction func logoutButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = contacts[indexPath.row].firstName + " " + contacts[indexPath.row].lastName
        cell.detailTextLabel?.text = contacts[indexPath.row].email

        return cell
    }
    
    private func fetchContacts() {
    
        let store = CNContactStore()
        store.requestAccess(for: .contacts) { (granted, error) in
            if let error = error {
                print("failed to request access", error)
                return
            }
            if granted {
                
                let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey]
                let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
                do {
                    
                    try store.enumerateContacts(with: request, usingBlock: { (contact, stopPointer) in
                        self.contacts.append(FetchedContacts(firstName: contact.givenName, lastName: contact.familyName, email: contact.phoneNumbers.first?.value.stringValue ?? ""))
                        print(contact)
                    })
                    self.tableView.reloadData()
                } catch let error {
                    print("Failed to enumerate contact", error)
                }
            } else {
                print("access denied")
            }
        }
    }
    
}
