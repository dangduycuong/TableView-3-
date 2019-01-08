//
//  ViewController.swift
//  PassingDataByNotificationCenter1
//
//  Created by duycuong on 11/7/18.
//  Copyright © 2018 duycuong. All rights reserved.
//

import UIKit

//extension Notification.Name {
//    static let dataText1 = Notification.Name("keyForDataText1")
//    //static let datatext2 = Notification.Name("key2")
//}

extension Notification.Name {
    static let dataText1 = Notification.Name("key1")
}

class DangKyViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    var phat : PhatViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        NotificationCenter.default.addObserver(self, selector: #selector(dangKy(notification:)), name: .dataText1, object: nil)
    }
    
    
    //add o dau thi remove o day nho chua anh Hoang
    deinit {
        NotificationCenter.default.removeObserver(self)
        print("Tao chet roi")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

//    @objc func dangKy(notification: NSNotification) {
//        nameLabel.text = notification.object as? String
//    }
    
    @objc func dangKy(notification: NSNotification) {
        nameLabel.text = notification.object as? String
    }
        // MARK: Navigation

}




