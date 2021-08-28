//
//  SignUpViewController.swift
//  210731
//
//  Created by kms on 2021/07/31.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var pwText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBtn(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signUpBtn(_ sender: UIButton) {
        if nameText.text! == "" || emailText.text! == "" || pwText.text! == "" {
            let error = UIAlertController(title: "Error", message: "빈칸을 입력하세요", preferredStyle: .alert)
            let okBtn = UIAlertAction(title: "확인", style: .cancel, handler: nil)
            
            error.addAction(okBtn)
            present(error, animated: true, completion: nil)
        }else{
            //print(nameText.text!)
            
            APIManager.authData(source: .register(name: nameText.text!, email: emailText.text!, password: pwText.text!), view: self) { user in
                print(user)
            }
            
            let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "loginVC")
            self.navigationController?.pushViewController(loginVC!, animated: true)
        }
    }
    
    @IBAction func goToLoginBtn(_ sender: Any) {
        let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "loginVC")
        self.navigationController?.pushViewController(loginVC!, animated: true)
    }
    
}
