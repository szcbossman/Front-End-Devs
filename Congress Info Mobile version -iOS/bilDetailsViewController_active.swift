//
//  bilDetailsViewController_active.swift
//  CongressInfo
//
//  Created by song zicheng daily use on 2016/11/30.
//  Copyright © 2016年 song zicheng. All rights reserved.
//

import UIKit

class bilDetailsViewController_active: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var bill_officialTitle: UITextView!
    @IBOutlet weak var tblJSON_bilActiveDetail: UITableView!
    var recData = [[String:AnyObject]]()
    var pdfURL = ""
    
    @IBAction func openPDF(_ sender: UIButton) {
        UIApplication.shared.openURL(URL(string: pdfURL)!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print((recData[0]["bill_id"] as? String)!)
        //print(recData[0]["last_action_at"])
        self.bill_officialTitle.text = (recData[0]["official_title"] as? String)!
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell_0 = tableView.dequeueReusableCell(withIdentifier: "jsonCell_bilActive_1") as! CustomCell_Bill_ActiveDetail
            cell_0.text1_L.text = "Bill ID"
            cell_0.text1_R.text = (recData[0]["bill_id"] as? String)!
            return cell_0
        }
        else if indexPath.section == 1 {
            let cell_1 = tableView.dequeueReusableCell(withIdentifier: "jsonCell_bilActive_1") as! CustomCell_Bill_ActiveDetail
            cell_1.text1_L.text = "Bill Type"
            cell_1.text1_R.text = (recData[0]["bill_type"] as? String)!
            return cell_1
        }
        else if indexPath.section == 2 {
            let cell_2 = tableView.dequeueReusableCell(withIdentifier: "jsonCell_bilActive_1") as! CustomCell_Bill_ActiveDetail
            cell_2.text1_L.text = "Sponsor"
            let sponsor = recData[0]["sponsor"]
            cell_2.text1_R.text = (sponsor?["title"] as? String)! + " " + (sponsor?["first_name"] as? String)! + " " + (sponsor?["last_name"] as? String)!
            return cell_2
        }
        else if indexPath.section == 3 {
            let cell_3 = tableView.dequeueReusableCell(withIdentifier: "jsonCell_bilActive_1") as! CustomCell_Bill_ActiveDetail
            cell_3.text1_L.text = "Last Action"
            var date_Str = ""
            if let date_raw = (recData[0]["last_action_at"] as? String) {
                let index = date_raw.index(date_raw.startIndex, offsetBy: 10)
                let date = date_raw.substring(to: index)
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd"
                let date_Date = formatter.date(from: date)
                formatter.dateStyle = .medium
                date_Str = formatter.string(from: date_Date!)
            }
            else {
                date_Str = "N.A."
            }
            cell_3.text1_R.text = date_Str
            return cell_3
        }
        else if indexPath.section == 4 {
            let cell_4 = tableView.dequeueReusableCell(withIdentifier: "jsonCell_bilActive_2") as! CustomCell_Bill_ActiveDetail
            cell_4.text2_L.text = "PDF"
            var PDFStr = ""
            let PDFurl = (recData[0]["last_version"]!["urls"] as! [String:Any])["pdf"]!
            if (PDFurl as? String) != nil {
                PDFStr = "PDF Link"
                self.pdfURL = PDFurl as! String
            }
            else {
                PDFStr = "N.A."
            }
            cell_4.btn2_R.setTitle(PDFStr, for: .normal)
            return cell_4
        }
        else if indexPath.section == 5 {
            let cell_5 = tableView.dequeueReusableCell(withIdentifier: "jsonCell_bilActive_1") as! CustomCell_Bill_ActiveDetail
            cell_5.text1_L.text = "Chamber"
            cell_5.text1_R.text = (recData[0]["chamber"] as? String)!
            return cell_5
        }
        else if indexPath.section == 6{
            let cell_6 = tableView.dequeueReusableCell(withIdentifier: "jsonCell_bilActive_1") as! CustomCell_Bill_ActiveDetail
            cell_6.text1_L.text = "Last Vote"
            var voteStr = ""
            if let vote_raw = (recData[0]["last_vote_at"] as? String) {
                let index = vote_raw.index(vote_raw.startIndex, offsetBy: 10)
                let vote = vote_raw.substring(to: index)
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd"
                let vote_Date = formatter.date(from: vote)
                formatter.dateStyle = .medium
                voteStr = formatter.string(from: vote_Date!)
            }
            else {
                voteStr = "N.A."
            }
            cell_6.text1_R.text = voteStr
            return cell_6
        }
        else {
            let cell_7 = tableView.dequeueReusableCell(withIdentifier: "jsonCell_bilActive_1") as! CustomCell_Bill_ActiveDetail
            cell_7.text1_L.text = "Status"
            var statusStr = ""
            let history = recData[0]["history"]
            if history?["active"] as? String == "false" {
                statusStr = "New"
            }
            else {
                statusStr = "Active"
            }
            cell_7.text1_R.text = statusStr
            return cell_7
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
        else if section == 4 {
            return 1
        }
        else if section == 5 {
            return 1
        }
        else if section == 6 {
            return 1
        }
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 8
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
