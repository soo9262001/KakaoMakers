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
    
    @IBOutlet weak var autoBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pwText.isSecureTextEntry = true
    }
    
    
    @IBAction func autoBtn(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func backBtn(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func loginBtnTab(_ sender: Any) {
        if emailText.text == "" || pwText.text == "" {
            let alert = UIAlertController(title: "", message: "빈칸을 입력해주세요", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .cancel, handler: nil))
            present(alert, animated: true)
        }else {
        APIManager.authData(source: .login(email: emailText.text!, password: pwText.text!), view: self) { user in

            /// 로그인 시 토큰 저장
//            UserDefaults.standard.setValue(user.token, forKey: "token")
            print(user)
            // 자동로그인
            if self.autoBtn.isSelected == true {
                UserDefaults.standard.setValue(user.token, forKey: "token")}else{

                }
            
            let startSB = UIStoryboard(name: "StartSB", bundle: nil)
            let mainVC = startSB.instantiateViewController(withIdentifier: "StartSB")
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainVC, animated: true)
        }
        
    }
    
}
   

}
