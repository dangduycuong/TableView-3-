//
//  PhatViewController.swift
//  PassingDataByNotificationCenter1
//
//  Created by duycuong on 11/7/18.
//  Copyright © 2018 duycuong. All rights reserved.
//

import UIKit

class PhatViewController: UIViewController {
    
    @IBOutlet weak var phatTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
//    deinit {
//        NotificationCenter.default.removeObserver(self)
//        print("da giai phong")
//    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func phatButton(_sender: Any) {
        NotificationCenter.default.post(name: .dataText1, object: phatTextField.text)
        navigationController?.popViewController(animated: true)
        //UserDefaults.standard
    }

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
