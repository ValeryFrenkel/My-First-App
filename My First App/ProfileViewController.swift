//
//  ProfileViewController.swift
//  My First App
//
//  Created by Valery Frenkel on 11/3/20.
//

import UIKit

class ProfileViewController : UIViewController {

    @IBOutlet weak var usernameValue: UILabel!
    @IBOutlet weak var logoutButton: UIButton!
    
    var textLabel = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .yellow
      
        usernameValue.text = textLabel
    }
    
    @IBAction func logoutButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
