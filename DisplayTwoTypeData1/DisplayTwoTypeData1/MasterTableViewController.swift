//
//  MasterTableViewController.swift
//  DisplayTwoTypeData1
//
//  Created by duycuong on 11/1/18.
//  Copyright © 2018 duycuong. All rights reserved.
//

import UIKit

class MasterTableViewController: UITableViewController {

    @IBOutlet weak var noDataImageView: UIImageView!
    @IBOutlet var blackView: UIView!
    
    @IBOutlet weak var switchOutlet: UISwitch!
    
    let dataNumbers = DataSourceNumbers()
    let dataNames = DataSourceNames()
    
    var noData: Bool = true {
        didSet {
            noData ? (tableView.tableFooterView = noDataImageView) : (tableView.tableFooterView = blackView)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataNumbers
        
        dataNumbers.delegateInt = self
        dataNames.delegateString = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        noData = switchOutlet.isOn ? (dataNumbers.numbers.count == 0) : (dataNames.listNames.count == 0)
        tableView.reloadData()
        print("em da dc goi")
    }
    
    @IBAction func changedSwitch(_ sender: UISwitch) {
        //sender.isOn ? (tableView.dataSource = dataNumbers) : (tableView.dataSource = dataNames)
        switchOutlet.isOn ? (tableView.dataSource = dataNumbers) : (tableView.dataSource = dataNames)
//        if switchOutlet.isOn {
//            if dataNumbers.numbers.count == 0 {
//                tableView.tableFooterView = noDataImageView
//            } else {
//                tableView.tableFooterView = blackView
//            }
//        } else {
//            if dataNames.listNames.count == 0 {
//                tableView.tableFooterView = noDataImageView
//            } else {
//                tableView.tableFooterView = blackView
//            }
//        }
        
        switchOutlet.isOn ? (noData = (dataNumbers.numbers.count == 0)) : (noData = dataNames.listNames.count == 0)
        
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let sentData = segue.destination as? ViewController {
            if let indexPath = tableView.indexPathForSelectedRow {
                if switchOutlet.isOn {
                    sentData.dataText = String(dataNumbers.numbers[indexPath.row])
                } else {
                    sentData.dataText = dataNames.listNames[indexPath.row]
                }
            }
        }
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        if let sourceData = unwindSegue.source as? ViewController {
            if let indexPath = tableView.indexPathForSelectedRow {
                if switchOutlet.isOn {
                    dataNumbers.numbers[indexPath.row] = Int(sourceData.dataText ?? "") ?? 0
                } else {
                    dataNames.listNames[indexPath.row] = sourceData.dataText!
                }
            } else {
                if switchOutlet.isOn {
                    dataNumbers.numbers.append(Int(sourceData.dataText ?? "") ?? 0)
                } else {
                    dataNames.listNames.append(sourceData.dataText!)
                }
            }
        }
        tableView.reloadData()
    }
    
    // MARK: - Table view data source



    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
