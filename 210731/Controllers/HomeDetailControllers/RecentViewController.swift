//
//  firstViewController.swift
//  210731
//
//  Created by kms on 2021/08/14.
//

import UIKit
import Kingfisher

class RecentViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var products = [ProductModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: "RecentTableViewCell", bundle: nil), forCellReuseIdentifier: "recentcell")
        getData()
    }
    

    private func getData() {
        ProductNetworkManager.getProductsData { result in
            self.products = result
            OperationQueue.main.addOperation {
                self.tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let index = self.tableView.indexPathForSelectedRow
        let detailVC = segue.destination as! DetailProductViewController
        detailVC.id = products[index!.row].id
    }

}

extension RecentViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recentcell", for: indexPath) as! RecentTableViewCell
        let product = products[indexPath.row]
        let processor = ResizingImageProcessor(referenceSize: CGSize(width: 100.0 , height: 100.0))
        let img = URL(string: "\(product.imageName)")
        
        cell.imageView?.kf.setImage(with: img, options: [.processor(processor)])
        cell.nameLabel.text = product.name
        cell.priceLabel.text = "\(product.price ?? 0.0) 원"
        cell.countLabel.text = "재고 \(product.countInStock)개"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: nil)
    }
}
