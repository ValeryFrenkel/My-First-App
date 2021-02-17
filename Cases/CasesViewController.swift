//
//  CasesViewController.swift
//  My First App
//
//  Created by Valery Frenkel on 11/3/20.
//

import UIKit

struct Cases: Codable {
    
    let country : String
    let infected : Int
    let recovered : Int?
    
    private enum CodingKeys: String, CodingKey {
                case infected, recovered, country
            }

    init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            infected = try container.decode(Int.self, forKey: .infected)
            country = try container.decode(String.self, forKey: .country)
            recovered = try? container.decode(Int.self, forKey: .recovered)
        }
}

class CasesViewController : UITableViewController {
    
    var cases:[Cases] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .darkGray
        
        guard let casesUrl = URL(string: "https://api.apify.com/v2/key-value-stores/tVaYRsPHLjNdNBu7S/records/LATEST?disableRedirect=true") else { return }
        
        let casesSession = URLSession.shared
        casesSession.dataTask(with: casesUrl) { (data, response, error) in
            
            if let response = response {
              print(response)
            }
            
            guard let data = data else { return }
            print(data)
            
            do {
                let decoder = JSONDecoder()
                self.cases = try decoder.decode([Cases].self , from: data)
                DispatchQueue.main.async {
                    [self] in
                    self.tableView.reloadData()
                }
            } catch{
                print(error)
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [.mutableContainers])
                let  jsonData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
                print(String(decoding: jsonData, as: UTF8.self))
            } catch {
                print(error)
            }
        }.resume()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = "\(cases[indexPath.row].country) Confirmed: \(cases[indexPath.row].infected) Deaths: \(cases[indexPath.row].recovered ?? 0)"
        
        cell.accessoryType = .disclosureIndicator
        
        return cell
        
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let casesDetails = storyboard.instantiateViewController(withIdentifier: "CasesDetails") as! CasesDetails
        casesDetails.navigationItem.title = cases[indexPath.row].country
        casesDetails.country = cases[indexPath.row]
        navigationController?.pushViewController(casesDetails, animated: true)
    }
}

