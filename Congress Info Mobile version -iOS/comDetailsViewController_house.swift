//
//  comDetailsViewController_house.swift
//  CongressInfo
//
//  Created by song zicheng daily use on 2016/11/30.
//  Copyright © 2016年 song zicheng. All rights reserved.
//

import UIKit

class comDetailsViewController_house: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var comName: UITextView!
    @IBOutlet weak var tblJSON_comHouseDetail: UITableView!
    
    var recData = [[String:AnyObject]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print((recData[0]["committee_id"] as? String)!)
        self.comName.text = (recData[0]["name"] as? String)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell_0 = tableView.dequeueReusableCell(withIdentifier: "jsonCell_comHouse_1") as! CustomCell_Com_Detail
            cell_0.text1_L.text = "ID"
            cell_0.text1_R.text = (recData[0]["committee_id"] as? String)!
            return cell_0
        }
        else if indexPath.section == 1 {
            let cell_1 = tableView.dequeueReusableCell(withIdentifier: "jsonCell_comHouse_1") as! CustomCell_Com_Detail
            cell_1.text1_L.text = "Parent ID"
            var parentID_Str = ""
            if let parentID = (recData[0]["parent_committee_id"] as? String) {
                parentID_Str = parentID
            }
            else {
                parentID_Str = "N.A."
            }
            cell_1.text1_R.text = parentID_Str
            return cell_1
        }
        else if indexPath.section == 2 {
            let cell_2 = tableView.dequeueReusableCell(withIdentifier: "jsonCell_comHouse_1") as! CustomCell_Com_Detail
            cell_2.text1_L.text = "Chamber"
            cell_2.text1_R.text = (recData[0]["chamber"] as? String)!
            return cell_2
        }
        else if indexPath.section == 3 {
            let cell_3 = tableView.dequeueReusableCell(withIdentifier: "jsonCell_comHouse_1") as! CustomCell_Com_Detail
            cell_3.text1_L.text = "Office"
            var office_Str = ""
            if let office = (recData[0]["office"] as? String) {
                office_Str = office
            }
            else {
                office_Str = "N.A."
            }
            cell_3.text1_R.text = office_Str
            return cell_3
        }
        else {
            let cell_4 = tableView.dequeueReusableCell(withIdentifier: "jsonCell_comHouse_1") as! CustomCell_Com_Detail
            cell_4.text1_L.text = "Contact"
            var contact_Str = ""
            if let contact = (recData[0]["phone"] as? String) {
                contact_Str = contact
            }
            else {
                contact_Str = "N.A."
            }
            cell_4.text1_R.text = contact_Str
            return cell_4
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else if section == 1 {
            return 1
        }
        else if section == 2 {
            return 1
        }
        else if section == 3 {
            return 1
        }
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
