//
//  ProfileViewController.swift
//  210731
//
//  Created by kms on 2021/08/22.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getUserData()
    }
    
    func getUserData() {
        let token = UserDefaults.standard.string(forKey: "token")
        print(token!)
        APIManager.getProfile(token: token!) { user in
            print("____________________-",user.name)
        }
    }
}
