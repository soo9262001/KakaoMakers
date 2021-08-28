//
//  StartViewController.swift
//  210731
//
//  Created by kms on 2021/08/02.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "newproductcell", for: indexPath) as! NewProductTableViewCell
            return cell
        }else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "refreshcell", for: indexPath) as! RefreshTableViewCell
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "categorycell", for: indexPath) as! CategoryTableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      if indexPath.section == 0 {
        return 410
      } else if indexPath.section == 1 {
        return 80
      } else if indexPath.section == 2 {
        return 300
      }
      return 0
    }
    
    func tableView(
      _ tableView: UITableView,
      viewForHeaderInSection section: Int
    ) -> UIView? {
      let view = UIView(
        frame: CGRect(
          x: 0, y: 0,
          width: tableView.frame.width,
          height: 50))
      view.backgroundColor = .white
      let label = UILabel(
        frame: CGRect(
          x: 15, y: 4,
          width: view.bounds.size.width - 16,
          height: view.bounds.size.height - 3))
      label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
      label.font = UIFont.boldSystemFont(ofSize: 17)
      label.textColor = .black
      view.addSubview(label)
      if section == 0 {
        label.text = "금주 신규 제품"
      } else if section == 2 {
        label.text = "카테고리"
      }
      return view
    }
    
    
}
