//
//  SecondViewController.swift
//  210731
//
//  Created by kms on 2021/08/14.
//

import UIKit

class OpenViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "OpenTableViewCell", bundle: nil), forCellReuseIdentifier: "opencell")
    }

    
}

extension OpenViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else if section == 1{
            return 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let titleCell = tableView.dequeueReusableCell(withIdentifier: "opentitlecell", for: indexPath) as! OpenTitleTableViewCell
            titleCell.titleLabel.text = "곧 오픈합니다"
            titleCell.contentLabel.text = "기다려지는 제품을 찾으셨나요?\n주문이 시작되면 알려드려요."
            return titleCell
        }else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "opencell", for: indexPath) as! OpenTableViewCell
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
          return 130.0
        } else if indexPath.section == 1 {
          return 585.0
        } 
        return 0
    }
}
