//
//  AllimViewController.swift
//  210731
//
//  Created by kms on 2021/08/26.
//

import UIKit

class AlarmViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

}

extension AlarmViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "alarmtablecell", for: indexPath) as! AlarmTableViewCell
            cell.titleLabel.text = "알림사항"
            cell.dateLabel.text = "2021.08.21"
            
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "recommendcell", for: indexPath) as!  RecommendTableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      if indexPath.section == 0 {
        return 150
      } else if indexPath.section == 1 {
        return 500
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
      if section == 1 {
        label.text = "추천상품"
      }
      return view
    }
    
}

