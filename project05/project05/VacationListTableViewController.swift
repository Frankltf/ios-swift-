//
//  VacationListTableViewController.swift
//  project05
//
//  Created by admin on 2017/5/12.
//  Copyright © 2017年 admin. All rights reserved.
//

import UIKit

class VacationListTableViewController: UITableViewController {
    //度假地数组
    var vacationList=[Vacation]();
    func loadInitData() {
        let vacation1=Vacation();
        vacation1.place="芒市";
        vacationList.append(vacation1)
        
        let vacation2=Vacation();
        vacation2.place="稻城";
        vacationList.append(vacation2)
        
        let vacation3=Vacation();
        vacation3.place="阳朔";
        vacationList.append(vacation3)
        
        let vacation4=Vacation();
        vacation4.place="兰溪";
        vacationList.append(vacation4)
        
        let vacation5=Vacation();
        vacation5.place="竹海";
        vacationList.append(vacation5)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.editButtonItem;
        
        
        loadInitData();
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: true);
        tableView.setEditing(editing, animated: true);
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == UITableViewCellEditingStyle.delete){
            vacationList.remove(at: indexPath.row);
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.top);
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return vacationList.count;
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Pcell", for: indexPath)
        cell.textLabel?.text=vacationList[indexPath.row].place;
        
         //Configure the cell...
        let v2=vacationList[indexPath.row]
        print(7777)
        if (v2.visited){
            cell.accessoryType=UITableViewCellAccessoryType.checkmark;
        }else{
            cell.accessoryType=UITableViewCellAccessoryType.none;
        }

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let v1=vacationList[indexPath.row];
        v1.visited = !v1.visited;
        tableView.deselectRow(at: indexPath, animated: false);
        print(6666)
        tableView.reloadData();
    }

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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func unwindToList (segue:UIStoryboardSegue){
        let source=segue.source as! AddVacationViewController;
        let v4=source.vacation;
        if v4.place != "" {
            vacationList.append(v4);
            tableView.reloadData();
        }
    }

}
