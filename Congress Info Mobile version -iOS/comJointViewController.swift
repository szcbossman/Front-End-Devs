//
//  comJointViewController.swift
//  CongressInfo
//
//  Created by song zicheng daily use on 2016/11/30.
//  Copyright © 2016年 song zicheng. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SlideMenuControllerSwift
import SwiftSpinner
import Kingfisher

class comJointViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var rightBarBtn: UIBarButtonItem!
    @IBOutlet weak var TblJSON_comJoint: UITableView!
    
    var arrRes = [[String:AnyObject]]()
    var arrRes_comJoint = [[String:AnyObject]]()
    var arrRes_filtered = [[String:AnyObject]]()
    var tableLoaded = false
    
    @IBAction func showSearchBar(_ sender: UIBarButtonItem) {
        if self.view.viewWithTag(7)?.isHidden == true {
            self.view.viewWithTag(7)?.isHidden = false
            self.rightBarBtn.image = #imageLiteral(resourceName: "Cancel-50")
        }
        else if self.view.viewWithTag(7)?.isHidden == false {
            self.view.viewWithTag(7)?.isHidden = true
            self.rightBarBtn.image = #imageLiteral(resourceName: "Search-50")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        SwiftSpinner.show("Loading...")
        if self.tableLoaded == true {
            SwiftSpinner.hide()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.viewWithTag(7)?.isHidden = true //hide searchbar
        Alamofire.request("http://app102116-env.us-west-2.elasticbeanstalk.com/?committees").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                //print(swiftyJsonVar) //returned JSON
                
                if let resData = swiftyJsonVar["results"].arrayObject {
                    self.arrRes = resData as! [[String:AnyObject]]
                    for  var tempRes in self.arrRes {
                        if(tempRes["chamber"] as? String == "joint") {
                            self.arrRes_comJoint.append(tempRes)
                        }
                    }
                    
                    func positionSort(dict1: [String: AnyObject], dict2: [String: AnyObject]) -> Bool {
                        let lastName1 = dict1["name"] as? String
                        let lastName2 = dict2["name"] as? String
                        return lastName1! < lastName2!
                    }
                    self.arrRes_comJoint = self.arrRes_comJoint.sorted(by: positionSort)
                    self.arrRes_filtered = self.arrRes_comJoint
                }
                if self.arrRes.count > 0 {
                    self.tableLoaded = true
                    self.TblJSON_comJoint.reloadData()
                    SwiftSpinner.hide()
                }
            }
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "jsonCell_comJoint") as! CustomCell_Com
        var dict = arrRes_filtered[(indexPath as NSIndexPath).row]
        cell.comName.text = dict["name"] as? String
        cell.comID.text = dict["committee_id"] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrRes_filtered.count
    }
    
    //searchBarFuncs:
    func filterSearch(searchText: String)  {
        for  var tempRes in self.arrRes_comJoint {
            if((tempRes["name"] as? String)!.lowercased().contains(searchText.lowercased()) ) {
                self.arrRes_filtered.append(tempRes)
                //print(self.arrRes_filtered)
            }
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            self.arrRes_filtered = self.arrRes_comJoint
        }
        else {
            self.arrRes_filtered = []
            filterSearch(searchText: searchText)
        }
        self.TblJSON_comJoint.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //print(arrRes2Detail)
        let comDetailsView = segue.destination as! comDetailsViewController_joint
        let selectedRow = TblJSON_comJoint.indexPathForSelectedRow!.row
        if segue.identifier == "comJointJsonCell" {
            comDetailsView.recData = [arrRes_filtered[selectedRow]]
        }
    }

    @IBAction func backToComJointViewController(segue:UIStoryboardSegue) {
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
