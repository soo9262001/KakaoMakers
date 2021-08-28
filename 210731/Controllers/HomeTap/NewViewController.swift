//
//  NewViewController.swift
//  210731
//
//  Created by kms on 2021/08/26.
//

import UIKit
import Kingfisher
import Moya

class NewViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var products = [ProductModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        ProductData()
        tableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "productCell")
        //tableView.estimatedRowHeight = UITableView.automaticDimension
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func ProductData() {
        ProductNetworkManager.getProductsData(completion: { products in
            print(products)
            self.products = products
            OperationQueue.main.addOperation {
                self.tableView.reloadData()
            }
        })

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let index = self.tableView.indexPathForSelectedRow
        let detailVC = segue.destination as! DetailProductViewController
        detailVC.id = products[index!.row].id
    }

}

extension NewViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let productVC = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as!
            ProductTableViewCell
     
        let product = products[indexPath.row]
        
        productVC.nameLabel.text = product.name
        productVC.overviewLabel.text = product.description
        productVC.imgView.kf.setImage(with: URL(string: "\(product.imageName)"))
        
        return productVC
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        performSegue(withIdentifier: "toDetail", sender: nil)
    }
    
}
