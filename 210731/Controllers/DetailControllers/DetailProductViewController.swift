//
//  DetailViewController.swift
//  210731
//
//  Created by kms on 2021/08/22.
//

import UIKit

class DetailProductViewController: UIViewController {

    var id: String = ""
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(id)
        parseData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "제품 정보"
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func parseData() {
        ProductNetworkManager.getDetailProductsData(id: id) { product in
            print(product.name)
            self.nameLabel.text = product.name
            self.priceLabel.text = "\(product.price)원"
            self.imgView.kf.setImage(with: URL(string: "\(product.imageName)"))
        }
    }
    
    @IBAction func backBtn(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
}
