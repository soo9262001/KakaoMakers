//
//  LoginViewController.swift
//  210731
//
//  Created by kms on 2021/07/31.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var pwText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func backBtn(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func loginBtnTab(_ sender: Any) {
        APIManager.authData(source: .login(email: emailText.text!, password: pwText.text!), view: self) { user in

            /// 로그인 시 토큰 저장
            UserDefaults.standard.setValue(user.token, forKey: "token")
            print(user)
            let startSB = UIStoryboard(name: "StartSB", bundle: nil)
            let mainVC = startSB.instantiateViewController(withIdentifier: "StartSB")
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainVC, animated: true)
        }
        
    }
    
}
   

