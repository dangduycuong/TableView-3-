//
//  DataSourceNames.swift
//  DisplayTwoTypeData1
//
//  Created by duycuong on 11/1/18.
//  Copyright © 2018 duycuong. All rights reserved.
//

import UIKit

class DataSourceNames: NSObject, UITableViewDataSource {
    
    var listNames = ["Mai", "Lan", "Cuc", "Truc"]
    var delegateString: MasterTableViewController?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listNames.count
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = listNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            listNames.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            delegateString?.noData = (listNames.count == 0)
        }
    }
    
}
