//
//  ProductTabViewController.swift
//  210731
//
//  Created by kms on 2021/08/08.
//

import UIKit
import Tabman
import Pageboy

class ProductTabViewController: TabmanViewController {

    private var menuTabs : Array<UIViewController> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "OOMakers"

        let firstVC = self.storyboard?.instantiateViewController(withIdentifier: "RecentVC") as! RecentViewController
        let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeTabViewController
        let thirdVC = self.storyboard?.instantiateViewController(withIdentifier: "OpenVC") as! OpenViewController
        let fourthVC = self.storyboard?.instantiateViewController(withIdentifier: "LikeVC") as!
            LikeViewController
        
        menuTabs.append(firstVC)
        menuTabs.append(secondVC)
        menuTabs.append(thirdVC)
        menuTabs.append(fourthVC)
        
        self.dataSource = self
        
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap
        bar.backgroundView.style = .blur(style: .light)
        bar.layout.contentInset = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 40)
        bar.layout.interButtonSpacing = 40
        bar.layout.contentMode = .intrinsic
        bar.indicator.weight = .light
        bar.indicator.tintColor = .black
        bar.buttons.customize { button in
            button.tintColor = .lightGray
            button.selectedTintColor = .black
        }
        addBar(bar, dataSource: self, at: .top)
    }
}

extension ProductTabViewController : PageboyViewControllerDataSource, TMBarDataSource {
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        menuTabs.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return menuTabs[index]
        
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        let item = TMBarItem(title: "")
        if index == 0 {
            item.title = "최근 본"
        }else if index == 1 {
            item.title = "홈"
        }else if index == 2{
            item.title = "오픈예정"
        }else {
            item.title = "좋아요"
        }
        return item
    }
    
    
}
