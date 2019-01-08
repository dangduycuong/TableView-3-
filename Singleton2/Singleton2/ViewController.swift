//
//  ViewController.swift
//  Singleton2
//
//  Created by duycuong on 11/5/18.
//  Copyright © 2018 duycuong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viewTextField: UITextField!
    
    var index: IndexPath?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let indexPath = index {
            print(indexPath)
            viewTextField.text = String(DataService.shared.numbers[indexPath.row])
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func detailDone(_ sender: Any) {
        guard let number = Int(viewTextField.text ?? "") else { return }
        
        if index != nil {
            DataService.shared.editNumber(at: index!, with: number)
        } else {
            DataService.shared.addNumber(with: number)
        }
        navigationController?.popViewController(animated: true)
    }
}


