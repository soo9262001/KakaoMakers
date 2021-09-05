//
//  ProfileUpdateViewController.swift
//  210731
//
//  Created by kms on 2021/09/04.
//

import UIKit

class ProfileUpdateViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let token = UserDefaults.standard.string(forKey: "token")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parseData()
        // Do any additional setup after loading the view.
    }
    
    private func parseData() {
        
        APIManager.getProfile(token: token!) { user in
            self.nameTextField.text = user.name
            self.emailTextField.text = user.email
            self.passwordTextField.text = user.password
        }
    }
    
    @IBAction func updateBtn(_ sender: UIButton) {
        APIManager.updateUser(name: nameTextField.text!, email: emailTextField.text!, password: passwordTextField.text!, token: self.token!) { result in
            if result == true {
                self.navigationController?.popViewController(animated: true)
            }else {
                print("업데이트 실패")
            }
        }
    }
    
}
