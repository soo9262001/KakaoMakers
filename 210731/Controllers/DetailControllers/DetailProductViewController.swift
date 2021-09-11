//
//  DetailViewController.swift
//  210731
//
//  Created by kms on 2021/08/22.
//

import UIKit
import Kingfisher

class DetailProductViewController: UIViewController {

    var id: String = ""
    
    var product : ProductModel?
//
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.register(UINib(nibName: "DetailProductTableViewCell", bundle: nil), forCellReuseIdentifier: "detailProductVC")
        tableView.register(UINib(nibName: "ReviewTableViewCell", bundle: nil), forCellReuseIdentifier: "reviewVC")
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
//            print("++++++++++++++++", product)
            print(product.name)
            self.product = product
            OperationQueue.main.addOperation {
                self.tableView.reloadData()
            }
//            self.nameLabel.text = product.name
//            self.priceLabel.text = "\(product.price)원"
//            self.imgView.kf.setImage(with: URL(string: "\(product.imageName)"))
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! ReviewViewController
        detailVC.id = id
    }
    
    @IBAction func backBtn(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func homeBtn(_ sender: UIBarButtonItem) {
        // 스토리 보드 객체 가져오기 (인자 : 이름, 읽어들일 위치)
//        let storyboard: UIStoryboard? = UIStoryboard(name: "StartSB", bundle: nil)
//        let story = UIStoryboard(name: "StartSB", bundle: nil)
        
        // 뷰 객체 얻어오기 (storyboard ID로 ViewController구분)
        guard let vc = self.storyboard?.instantiateViewController(identifier: "StartSB") else {
            return
        }
        // 화면 전환 애니메이션 설정
//        vc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        vc.modalPresentationStyle = .fullScreen
        
        self.present(vc, animated: true)
        
    }
}
extension DetailProductViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else if section == 1 {
            return 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let productInfoCell = tableView.dequeueReusableCell(withIdentifier: "detailProductVC") as! DetailProductTableViewCell
            productInfoCell.nameLabel.text = product?.name
            productInfoCell.priceLabel.text = "\(product?.price)"
            productInfoCell.infoLabel.text = product?.description
            productInfoCell.imgView.kf.setImage(with: URL(string: "\(product?.imageName ?? "")"))
            
            return productInfoCell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "reviewVC", for: indexPath) as! ReviewTableViewCell
            
            cell.reviewLabel.text = product?.reviews.first?.comment
            
            return cell
            
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 600
        }else {
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "리뷰"
        }else {
            return nil
        }
    }
    
}

