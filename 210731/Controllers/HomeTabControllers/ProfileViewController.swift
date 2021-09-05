//
//  ProfileViewController.swift
//  210731
//
//  Created by kms on 2021/08/22.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getUserData()
    }
    
    func getUserData() {
        let token = UserDefaults.standard.string(forKey: "token")
        print(token!)
        APIManager.getProfile(token: token!) { user in
            print("____________________-",user.name)
            
            self.nameLabel.text = user.name
            self.emailLabel.text = user.email
        }
    }
    
    
}


