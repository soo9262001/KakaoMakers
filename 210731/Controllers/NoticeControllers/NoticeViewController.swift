//
//  NoticeViewController.swift
//  210731
//
//  Created by kms on 2021/08/25.
//

import UIKit

struct Noti {
    let title: String
    let date: Date
}

class NoticeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var notiData = [
        Noti(
            title: "[안내] 공지사항",
            date: Date()),
        ]
    
    let formmater: DateFormatter = {
       let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "ko")
        dateFormatter.dateFormat = "yyyy.MM.dd"
        return dateFormatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "NoticeTableViewCell", bundle: nil), forCellReuseIdentifier: "noticecell")
        tableView.rowHeight = UITableView.automaticDimension
    }
    


}

extension NoticeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notiData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noticecell", for: indexPath) as! NoticeTableViewCell
        let noti = notiData[indexPath.row]
        let date = formmater.string(from: noti.date)
        
        cell.titleLabel.text = noti.title
        cell.dateLabel.text = date
        return cell
    }
    
    
}
