//
//  legSenateViewController.swift
//  CongressInfo
//
//  Created by song zicheng daily use on 2016/11/25.
//  Copyright © 2016年 song zicheng. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SlideMenuControllerSwift
import SwiftSpinner
import Kingfisher

class legSenateViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate {

    @IBOutlet weak var legSenateTabBarItem: UITabBarItem!
    @IBOutlet weak var rightBarButton: UIBarButtonItem!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var TblJSON_legSenate: UITableView!
    
    var arrRes = [[String:AnyObject]]()
    var arrRes_legSenate = [[String:AnyObject]]()
    var arrRes_filtered = [[String:AnyObject]]()
    var tableLoaded = false

    @IBAction func showSearchBar(_ sender: UIBarButtonItem) {
        if self.view.viewWithTag(2)?.isHidden == true {
            self.view.viewWithTag(2)?.isHidden = false
            self.rightBarButton.image = #imageLiteral(resourceName: "Cancel-50")
        }
        else if self.view.viewWithTag(2)?.isHidden == false {
            self.view.viewWithTag(2)?.isHidden = true
            self.rightBarButton.image = #imageLiteral(resourceName: "Search-50")
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
        self.view.viewWithTag(2)?.isHidden = true
        let attributes = [NSFontAttributeName:UIFont(name: "Arial", size: 20)]
        self.legSenateTabBarItem.setTitleTextAttributes(attributes, for: .normal)
        Alamofire.request("http://app102116-env.us-west-2.elasticbeanstalk.com/?legislators").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                //print(swiftyJsonVar) //returned JSON
                
                if let resData = swiftyJsonVar["results"].arrayObject {
                    self.arrRes = resData as! [[String:AnyObject]]
                    for  var tempRes in self.arrRes {
                        if(tempRes["chamber"] as? String == "senate") {
                            self.arrRes_legSenate.append(tempRes)
                        }
                    }
                    
                    func positionSort(dict1: [String: AnyObject], dict2: [String: AnyObject]) -> Bool {
                        let lastName1 = dict1["last_name"] as? String
                        let lastName2 = dict2["last_name"] as? String
                        return lastName1! < lastName2!
                    }
                    self.arrRes_legSenate = self.arrRes_legSenate.sorted(by: positionSort)
                    self.arrRes_filtered = self.arrRes_legSenate
                }
                if self.arrRes.count > 0 {
                    self.tableLoaded = true
                    self.TblJSON_legSenate.reloadData()
                    SwiftSpinner.hide()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "jsonCell_legSenate")!
        var dict = arrRes_filtered[(indexPath as NSIndexPath).row]
        cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
        cell.detailTextLabel?.text = dict["state_name"] as? String
        let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
        let image = #imageLiteral(resourceName: "placeHolder")
        cell.imageView!.kf.setImage(with: url, placeholder: image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrRes_filtered.count
    }

    
    func filterSearch(searchText: String)  {
        for  var tempRes in self.arrRes_legSenate {
            if((tempRes["last_name"] as? String)!.lowercased().contains(searchText.lowercased()) ) {
                self.arrRes_filtered.append(tempRes)
                //print(self.arrRes_filtered)
            }
        }
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            self.arrRes_filtered = self.arrRes_legSenate
        }
        else {
            self.arrRes_filtered = []
            filterSearch(searchText: searchText)
        }
        self.TblJSON_legSenate.reloadData()
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //print(arrRes2Detail)
        let legDetailsView = segue.destination as! legDetailsViewController_senate
        let selectedRow = TblJSON_legSenate.indexPathForSelectedRow!.row
        if segue.identifier == "legSenateJsonCell" {
            legDetailsView.recData = [arrRes_filtered[selectedRow]]
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func backToLegSenateViewController(segue:UIStoryboardSegue) {
    }
}
