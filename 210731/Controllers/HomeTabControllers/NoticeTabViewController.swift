//
//  NoticeTabViewController.swift
//  210731
//
//  Created by kms on 2021/08/26.
//

import UIKit
import Tabman
import Pageboy

class NoticeTabViewController: TabmanViewController {

    private var noticeTabs: Array<UIViewController> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let alarmVC = self.storyboard?.instantiateViewController(withIdentifier: "alarmVC") as! AlarmViewController
        
        let noticeVC = self.storyboard?.instantiateViewController(withIdentifier: "noticeVC") as! NoticeViewController
        
        noticeTabs.append(alarmVC)
        noticeTabs.append(noticeVC)
        
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

extension NoticeTabViewController: PageboyViewControllerDataSource, TMBarDataSource {
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        noticeTabs.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return noticeTabs[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        let item = TMBarItem(title: "")
        if index == 0 {
            item.title = "알림내역"
        }else {
            item.title = "공지사항"
        }
        return item
    }
    
    
}
