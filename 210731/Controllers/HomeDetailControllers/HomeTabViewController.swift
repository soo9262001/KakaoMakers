//
//  HomeViewController.swift
//  210731
//
//  Created by kms on 2021/08/26.
//

import UIKit
import Tabman
import Pageboy

class HomeTabViewController: TabmanViewController {

    private var productTabs: Array<UIViewController> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let productVC = self.storyboard?.instantiateViewController(withIdentifier: "productVC") as! ProductViewController
        let newVC = self.storyboard?.instantiateViewController(withIdentifier: "newVC") as! NewViewController
        let categoryVC = self.storyboard?.instantiateViewController(withIdentifier: "categoryVC") as! CategoryViewController
        
        productTabs.append(productVC)
        productTabs.append(newVC)
        productTabs.append(categoryVC)
        
        self.dataSource = self
        
        let bar = TMBar.ButtonBar()
        bar.backgroundView.style = .blur(style: .light)
        bar.backgroundColor = .white
        
        bar.layout.contentMode = .intrinsic
        bar.layout.contentInset = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 55)
        bar.layout.interButtonSpacing = 25
        bar.layout.transitionStyle = .snap
        bar.indicator.weight = .light
        bar.indicator.tintColor = .clear
        bar.buttons.customize { (button) in
         
          button.font = UIFont.systemFont(ofSize: 16)
          button.selectedTintColor = .blue
        }
        addBar(bar, dataSource: self, at: .top)
      }
    }

    extension HomeTabViewController:
      PageboyViewControllerDataSource,
      TMBarDataSource {
      func numberOfViewControllers(
        in pageboyViewController: PageboyViewController
      ) -> Int {
        return productTabs.count
      }
      
      func viewController(
        for pageboyViewController: PageboyViewController,
        at index: PageboyViewController.PageIndex
      ) -> UIViewController? {
        return productTabs[index]
      }
      
      func defaultPage(
        for pageboyViewController: PageboyViewController
      ) -> PageboyViewController.Page? {
        return nil
      }
      
      func barItem(
        for bar: TMBar,
        at index: Int
      ) -> TMBarItemable {
        let item = TMBarItem(title: "")
        if (index == 0) {
          item.title = "전체"
        } else if (index == 1) {
          item.title = "신규"
        } else if (index == 2) {
          item.title = "카테고리"
        }
        return item
      }
    }

    




