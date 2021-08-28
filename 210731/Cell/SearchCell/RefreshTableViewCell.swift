//
//  RfreshTableViewCell.swift
//  210731
//
//  Created by kms on 2021/08/26.
//

import UIKit

class RefreshTableViewCell: UITableViewCell {

    @IBOutlet weak var refreshBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        refreshBtn.layer.borderWidth = 2
        refreshBtn.layer.borderColor = UIColor.lightGray.cgColor
    }

    @IBAction func refreshBtn(_ sender: UIButton) {
        print("새로고침")
    }
}
