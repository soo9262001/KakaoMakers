//
//  DetailProfileViewController.swift
//  210731
//
//  Created by kms on 2021/08/23.
//

import UIKit

class DetailProfileViewController: UIViewController {
    
    var personalInfo = ["휴대폰 번호", "알림/광고 동의 관리"]
    var paymentInfo = ["현금영수증 정보 관리", "환불관리"]
    var appInfo = ["버전정보", "오픈소스 라이언스", "개인정보 처리방침", "도움말/문의", "친구에게 공유하기"]
    var authInfo = ["로그아웃", "카카오 쇼핑 안내"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self

    }
    


    @IBAction func backBtn(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension DetailProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else if section == 1 {
            return personalInfo.count
        }else if section == 2 {
            return paymentInfo.count
        }else if section == 3 {
            return appInfo.count
        }else {
            return authInfo.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let profileCell = tableView.dequeueReusableCell(withIdentifier: "firstcell", for: indexPath)
        let basicCell = tableView.dequeueReusableCell(withIdentifier: "secondcell", for: indexPath)
        let detailCell = tableView.dequeueReusableCell(withIdentifier: "thirdcell", for: indexPath)
        
        switch indexPath.section {
        case 0:
            profileCell.textLabel?.text = "김민수"
            return profileCell
        case 1:
            detailCell.textLabel?.text = personalInfo[indexPath.row]
            return detailCell
        case 2:
            detailCell.textLabel?.text = paymentInfo[indexPath.row]
            return detailCell
        case 3:
            detailCell.textLabel?.text = appInfo[indexPath.row]
            return detailCell
        case 4:
            detailCell.textLabel?.text = authInfo[indexPath.row]
            return detailCell
        default:
            return UITableViewCell()
        }
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 4:
        if indexPath.row == 0 {
            let logoutVC = UIAlertController(title: "정말로 로그아웃하시겠습니까?", message: "", preferredStyle: .actionSheet)
            let logoutBtn = UIAlertAction(title: "로그아웃", style: .default) { _ in
                /// 로그아웃 시 토큰 삭제
                UserDefaults.standard.removeObject(forKey: "token")
                let mainSB = UIStoryboard(name: "Main", bundle: nil)
                let startVC = mainSB.instantiateViewController(withIdentifier: "firstVC")
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(startVC, animated: true)
            }

            let cancelBtn = UIAlertAction(title: "취소", style: .cancel, handler: nil)
            logoutVC.addAction(logoutBtn)
            logoutVC.addAction(cancelBtn)
            present(logoutVC, animated: true, completion: nil)
            }
        default:
            0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        UIView().backgroundColor = .lightGray
        
        return 20
    }
    
}


