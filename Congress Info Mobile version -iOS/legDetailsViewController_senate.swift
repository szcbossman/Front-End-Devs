//
//  legDetailsViewController_senate.swift
//  CongressInfo
//
//  Created by song zicheng daily use on 2016/11/28.
//  Copyright © 2016年 song zicheng. All rights reserved.
//

import UIKit

class legDetailsViewController_senate: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tblJSON_legSenateDetail: UITableView!
    @IBOutlet weak var legSenateAvatar: UIImageView!
    var recData = [[String:AnyObject]]()
    var twitterURL = ""
    var webSiteURL = ""
    var twitterBool = false
    var webSiteBool = false
    
    @IBAction func openTwitter(_ sender: UIButton) {
        if twitterBool == true {
            UIApplication.shared.openURL(URL(string: twitterURL)!)
        }
    }
    @IBAction func openWebsite(_ sender: UIButton) {
        if webSiteBool == true {
            UIApplication.shared.openURL(URL(string: webSiteURL)!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print((recData[0]["last_name"] as? String)!)
        let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (recData[0]["bioguide_id"] as? String)! + ".jpg")
        let data = try? Data(contentsOf: url!)
        self.legSenateAvatar.image = UIImage(data: data!)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell_0 = tableView.dequeueReusableCell(withIdentifier: "jsonCell_legSenate_1") as! CustomCell
            cell_0.text1_L.text = "First Name"
            cell_0.text1_R.text = (recData[0]["first_name"] as? String)!
            return cell_0
        }
        else if indexPath.section == 1 {
            let cell_1 = tableView.dequeueReusableCell(withIdentifier: "jsonCell_legSenate_1") as! CustomCell
            cell_1.text1_L.text = "Last Name"
            cell_1.text1_R.text = (recData[0]["last_name"] as? String)!
            return cell_1
        }
        else if indexPath.section == 2 {
            let cell_2 = tableView.dequeueReusableCell(withIdentifier: "jsonCell_legSenate_1") as! CustomCell
            cell_2.text1_L.text = "State"
            cell_2.text1_R.text = (recData[0]["state_name"] as? String)!
            return cell_2
        }
        else if indexPath.section == 3 {
            let cell_3 = tableView.dequeueReusableCell(withIdentifier: "jsonCell_legSenate_1") as! CustomCell
            cell_3.text1_L.text = "Birth Date"
            let date = (recData[0]["birthday"] as? String)!
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            let date_Date = formatter.date(from: date)
            formatter.dateStyle = .medium
            let date_Str = formatter.string(from: date_Date!)
            cell_3.text1_R.text = date_Str
            return cell_3
        }
        else if indexPath.section == 4 {
            let cell_4 = tableView.dequeueReusableCell(withIdentifier: "jsonCell_legSenate_1") as! CustomCell
            cell_4.text1_L.text = "Gender"
            var genderStr = ""
            let gender = (recData[0]["gender"] as? String)!
            if gender == "M" {
                genderStr = "Male"
            }
            else {
                genderStr = "Female"
            }
            cell_4.text1_R.text = genderStr
            return cell_4
        }
        else if indexPath.section == 5 {
            let cell_5 = tableView.dequeueReusableCell(withIdentifier: "jsonCell_legSenate_1") as! CustomCell
            cell_5.text1_L.text = "Chamber"
            cell_5.text1_R.text = (recData[0]["chamber"] as? String)!
            return cell_5
        }
        else if indexPath.section == 6{
            let cell_6 = tableView.dequeueReusableCell(withIdentifier: "jsonCell_legSenate_1") as! CustomCell
            cell_6.text1_L.text = "Fax No."
            var faxStr = ""
            if let fax = (recData[0]["fax"] as? String) {
                faxStr = fax
            }
            else {
                faxStr = "N.A."
            }
            cell_6.text1_R.text = faxStr
            return cell_6
        }
        else if indexPath.section == 7 {
            let cell_7 = tableView.dequeueReusableCell(withIdentifier: "jsonCell_legSenate_2") as! CustomCell
            cell_7.text2_L.text = "Twitter"
            var twiStr = ""
            if (recData[0]["twitter_id"] as? String) != nil {
                twiStr = "Twitter Link"
                self.twitterBool = true
                self.twitterURL = "https://www.twitter.com/" + (recData[0]["twitter_id"] as? String)!
            }
            else {
                twiStr = "N.A."
            }
            cell_7.btn2_R.setTitle(twiStr, for: .normal)
            return cell_7
        }
        else if indexPath.section == 8 {
            let cell_8 = tableView.dequeueReusableCell(withIdentifier: "jsonCell_legSenate_3") as! CustomCell
            cell_8.text3_L.text = "Website"
            var webStr = ""
            if (recData[0]["website"] as? String) != nil {
                webStr = "Website Link"
                self.webSiteBool = true
                self.webSiteURL = (recData[0]["website"] as? String)!
            }
            else {
                webStr = "N.A."
            }
            cell_8.btn3_R.setTitle(webStr, for: .normal)
            return cell_8
        }
        else if indexPath.section == 9 {
            let cell_9 = tableView.dequeueReusableCell(withIdentifier: "jsonCell_legSenate_1") as! CustomCell
            cell_9.text1_L.text = "Office No."
            cell_9.text1_R.text = (recData[0]["office"] as? String)!
            return cell_9
        }
        else  {
            let cell_10 = tableView.dequeueReusableCell(withIdentifier: "jsonCell_legSenate_1") as! CustomCell
            cell_10.text1_L.text = "Term Ends On"
            cell_10.text1_L.text = "Term Ends On"
            let term = (recData[0]["term_end"] as? String)!
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            let term_Date = formatter.date(from: term)
            formatter.dateStyle = .medium
            let term_Str = formatter.string(from: term_Date!)
            cell_10.text1_R.text = term_Str
            return cell_10
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
        else if section == 7 {
            return 1
        }
        else if section == 8 {
            return 1
        }
        else if section == 9 {
            return 1
        }
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 11
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
