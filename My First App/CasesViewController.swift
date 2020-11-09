//
//  CasesViewController.swift
//  My First App
//
//  Created by Valery Frenkel on 11/3/20.
//

import UIKit

struct Country: Codable{
    
    var country : String
    var latest : Latest
}

struct Latest: Codable {
    
    var confirmed: Int
    var deaths: Int
}

class CasesViewController : UITableViewController {
    
    let countries = [
        Country(country: "Belarus", latest: Latest(confirmed: 1000, deaths: 10)),
        Country(country: "USA", latest: Latest(confirmed: 5000, deaths: 20))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .darkGray
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = "\(countries[indexPath.row].country) Confirmed: \(countries[indexPath.row].latest.confirmed) Deaths: \(countries[indexPath.row].latest.deaths)"
        
        cell.accessoryType = .disclosureIndicator
        
        return cell
        
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let casesDetails = storyboard.instantiateViewController(withIdentifier: "CasesDetails") as! CasesDetails
        casesDetails.navigationItem.title = countries[indexPath.row].country
        casesDetails.country = countries[indexPath.row]
        navigationController?.pushViewController(casesDetails, animated: true)
    }
}

