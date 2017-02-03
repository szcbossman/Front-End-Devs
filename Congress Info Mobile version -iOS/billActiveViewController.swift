//
//  billActiveViewController.swift
//  CongressInfo
//
//  Created by song zicheng daily use on 2016/11/29.
//  Copyright © 2016年 song zicheng. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SlideMenuControllerSwift
import SwiftSpinner
import Kingfisher

class billActiveViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var rightBarBtn: UIBarButtonItem!
    @IBOutlet weak var TblJSON_bilActive: UITableView!
    
    var arrRes = [[String:AnyObject]]()
    var arrRes_filtered = [[String:AnyObject]]()
    
    @IBAction func showSearchBar(_ sender: UIBarButtonItem) {
        if self.view.viewWithTag(3)?.isHidden == true {
            self.view.viewWithTag(3)?.isHidden = false
            self.rightBarBtn.image = #imageLiteral(resourceName: "Cancel-50")
        }
        else if self.view.viewWithTag(3)?.isHidden == false {
            self.view.viewWithTag(3)?.isHidden = true
            self.rightBarBtn.image = #imageLiteral(resourceName: "Search-50")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.viewWithTag(3)?.isHidden = true //hide searchbar
        Alamofire.request("http://app102116-env.us-west-2.elasticbeanstalk.com?billsActive").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                //print(swiftyJsonVar) //returned JSON
                
                if let resData = swiftyJsonVar["results"].arrayObject {
                    self.arrRes = resData as! [[String:AnyObject]]
                    /*
                    func positionSort(dict1: [String: AnyObject], dict2: [String: AnyObject]) -> Bool {
                        let lastName1 = dict1["last_name"] as? String
                        let lastName2 = dict2["last_name"] as? String
                        return lastName1! < lastName2!
                    }
                    self.arrRes = self.arrRes.sorted(by: positionSort)
                    */
                    self.arrRes_filtered = self.arrRes
                }
                if self.arrRes.count > 0 {
                    self.TblJSON_bilActive.reloadData()
                }
            }
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "jsonCell_billActive") as! CustomCell_Bill
        var dict = arrRes_filtered[(indexPath as NSIndexPath).row]
        cell.billTitle.text = (dict["bill_id"] as? String)!
        cell.BillText.text = dict["official_title"] as? String
        let date = (dict["introduced_on"] as? String)!
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let date_Date = formatter.date(from: date)
        formatter.dateStyle = .medium
        let date_Str = formatter.string(from: date_Date!)
        cell.BillDate.text = date_Str
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrRes_filtered.count
    }
    
    //searchBarFuncs:
    func filterSearch(searchText: String)  {
        for  var tempRes in self.arrRes {
            if((tempRes["bill_id"] as? String)!.lowercased().contains(searchText.lowercased()) ) {
                self.arrRes_filtered.append(tempRes)
                //print(self.arrRes_filtered)
            }
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            self.arrRes_filtered = self.arrRes
        }
        else {
            self.arrRes_filtered = []
            filterSearch(searchText: searchText)
        }
        self.TblJSON_bilActive.reloadData()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //print(arrRes2Detail)
        let bilDetailsView = segue.destination as! bilDetailsViewController_active
        let selectedRow = TblJSON_bilActive.indexPathForSelectedRow!.row
        if segue.identifier == "bilActiveJsonCell" {
            bilDetailsView.recData = [arrRes_filtered[selectedRow]]
        }
    }
    
    
    @IBAction func backToBilActiveViewController(segue:UIStoryboardSegue) {
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
