//
//  ViewController.swift
//  210731
//
//  Created by kms on 2021/07/31.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }


    @IBAction func goToSignBtn(_ sender: UIButton) {
        let signUpVC = self.storyboard?.instantiateViewController(withIdentifier: "signupVC")
        
        self.navigationController?.pushViewController(signUpVC!, animated: true)
    }
    
    @IBAction func goToLoginBtn(_ sender: UIButton) {
        let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "loginVC")
    
        self.navigationController?.pushViewController(loginVC!, animated: true)
    }
    
}

