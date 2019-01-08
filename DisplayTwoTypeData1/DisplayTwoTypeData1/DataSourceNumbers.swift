//
//  DataSourceNumbers.swift
//  DisplayTwoTypeData1
//
//  Created by duycuong on 11/1/18.
//  Copyright © 2018 duycuong. All rights reserved.
//

import UIKit

class DataSourceNumbers: NSObject, UITableViewDataSource {
    
    var numbers = [Int](0...3)
    //uy quyen MasterTableViewController
    var delegateInt: MasterTableViewController?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(numbers[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            numbers.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            delegateInt?.noData = (numbers.count == 0)
        } else {
            //insert something
        }
        
    }
}
