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

struct DataPost {
    var result: ResultUpdate?
    var text: String?
}

enum ResultUpdate {
    case success
    case failure
    case other
}

extension Notification.Name {
    static let dataText1 = Notification.Name("key1")
    
    static var testKey: Notification.Name {
        return .init(rawValue: "testKey")
    }
}

class DangKyViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        NotificationCenter.default.addObserver(self, selector: #selector(dangKy(notification:)), name: .dataText1, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(receivedNotifi(notification:)), name: .testKey, object: nil)
        if let navigationBar = navigationController?.navigationBar {
//            navigationBar.barTintColor = .green
            navigationBar.tintColor = .white
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        title = "Register Notification"
    }
    
    @objc func receivedNotifi(notification: Notification) {
        if let data = notification.object as? DataPost {
            if data.result == .success {
                nameLabel.text = data.text
            } else {
                nameLabel.text = "Chua nhap gi"
            }
        }
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
    
    
    @IBAction func tapRegisterNotification(_ sender: Any) {
        title = ""
        let vc = storyboard?.instantiateViewController(identifier: "PhatViewController") as! PhatViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
}




