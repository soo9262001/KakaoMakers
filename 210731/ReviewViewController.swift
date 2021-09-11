//
//  ReviewViewController.swift
//  210731
//
//  Created by kms on 2021/09/11.
//

import UIKit

class ReviewViewController: UIViewController {

    var id: String = ""
   
    @IBOutlet weak var ratingField: UITextField!
    
    @IBOutlet weak var commentField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(id)
        
    }
    
    func postReview() {
        print(ratingField.text!)
        print(commentField.text!)
//        let token = UserDefaults.standard.string(forKey: "token")
//        ProductNetworkManager.postReivew(source: .createReview(id: id, token: token!, rating: Float(ratingField.text!)!, comment: commentField.text!)) { result in
//            print(result)
//        }
        
    }

    @IBAction func backBtn(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
   
    @IBAction func postReviewBtn(_ sender: UIButton) {
        let token = UserDefaults.standard.string(forKey: "token")
        ProductNetworkManager.postReivew(source: .createReview(id: id, token: token!, rating: Int(ratingField.text!)!, comment: commentField.text!)) { result in
            if result == true {
                print("등록완료")
                self.navigationController?.popViewController(animated: true)
            }else {
                print("등록실패")
                //alert
            }
        }
    }
    
}
