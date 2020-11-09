//
//  File.swift
//  My First App
//
//  Created by Valery Frenkel on 11/9/20.
//

import UIKit

class CasesDetails: UIViewController {
    
    @IBOutlet weak var confirmedLabel: UILabel!
    @IBOutlet weak var deathLabel: UILabel!
    var country: Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        confirmedLabel.text = " Confirmed: \(country!.latest.confirmed)"
        deathLabel.text = "Death: \(country!.latest.deaths)"
        
    }
    
}


