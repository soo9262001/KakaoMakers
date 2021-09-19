//
//  ProfileViewController.swift
//  210731
//
//  Created by kms on 2021/08/22.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var users : LoggedUser?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        getUserData()
    }
    
    func getUserData() {
        let token = UserDefaults.standard.string(forKey: "token")
        print(token!)
        APIManager.getProfile(token: token!) { user in
            print("____________________-",user.name)
            self.users = user
        }
    }
    
    
}


extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath)
            
            return cell
        }else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "secondCell", for: indexPath)
            return cell
        }else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 2 {
            return 500
        }else {
            return 44
        }
    }
    
}
