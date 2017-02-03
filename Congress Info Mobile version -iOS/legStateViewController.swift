//
//  ViewController.swift
//  CongressInfo
//
//  Created by song zicheng daily use on 2016/11/23.
//  Copyright © 2016年 song zicheng. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SlideMenuControllerSwift
import SwiftSpinner
import Kingfisher

class legStateViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var stateTabBatItem: UITabBarItem!
    @IBOutlet weak var tblJSON: UITableView!
    var arrRes = [[String:AnyObject]]()
    var arrResA = [[String:AnyObject]]()
    var arrResC = [[String:AnyObject]]()
    var arrResD = [[String:AnyObject]]()
    var arrResF = [[String:AnyObject]]()
    var arrResG = [[String:AnyObject]]()
    var arrResH = [[String:AnyObject]]()
    var arrResI = [[String:AnyObject]]()
    var arrResK = [[String:AnyObject]]()
    var arrResL = [[String:AnyObject]]()
    var arrResM = [[String:AnyObject]]()
    var arrResN = [[String:AnyObject]]()
    var arrResO = [[String:AnyObject]]()
    var arrResP = [[String:AnyObject]]()
    var arrResR = [[String:AnyObject]]()
    var arrResS = [[String:AnyObject]]()
    var arrResT = [[String:AnyObject]]()
    var arrResU = [[String:AnyObject]]()
    var arrResV = [[String:AnyObject]]()
    var arrResW = [[String:AnyObject]]()
    var sections = 19
    var pickerSelected:String = ""
    var arrRes_Alabama = [[String:AnyObject]]()
    var arrRes_Alaska = [[String:AnyObject]]()
    var arrRes_AmericanSamoa = [[String:AnyObject]]()
    var arrRes_Arizona = [[String:AnyObject]]()
    var arrRes_Arkansas = [[String:AnyObject]]()
    var arrRes_California = [[String:AnyObject]]()
    var arrRes_Colorado = [[String:AnyObject]]()
    var arrRes_Connecticut = [[String:AnyObject]]()
    var arrRes_Delaware = [[String:AnyObject]]()
    var arrRes_DistrictofColumbia = [[String:AnyObject]]()
    var arrRes_Florida = [[String:AnyObject]]()
    var arrRes_Georgia = [[String:AnyObject]]()
    var arrRes_Guam = [[String:AnyObject]]()
    var arrRes_Hawaii = [[String:AnyObject]]()
    var arrRes_Idaho = [[String:AnyObject]]()
    var arrRes_Illinois = [[String:AnyObject]]()
    var arrRes_Indiana = [[String:AnyObject]]()
    var arrRes_Iowa = [[String:AnyObject]]()
    var arrRes_Kansas = [[String:AnyObject]]()
    var arrRes_Kentucky = [[String:AnyObject]]()
    var arrRes_Louisiana = [[String:AnyObject]]()
    var arrRes_Maine = [[String:AnyObject]]()
    var arrRes_Maryland = [[String:AnyObject]]()
    var arrRes_Massachusetts = [[String:AnyObject]]()
    var arrRes_Michigan = [[String:AnyObject]]()
    var arrRes_Minnesota = [[String:AnyObject]]()
    var arrRes_Mississippi = [[String:AnyObject]]()
    var arrRes_Missouri = [[String:AnyObject]]()
    var arrRes_Montana = [[String:AnyObject]]()
    var arrRes_Nebraska = [[String:AnyObject]]()
    var arrRes_Nevada = [[String:AnyObject]]()
    var arrRes_NewHampshire = [[String:AnyObject]]()
    var arrRes_NewJersey = [[String:AnyObject]]()
    var arrRes_NewMexico = [[String:AnyObject]]()
    var arrRes_NewYork = [[String:AnyObject]]()
    var arrRes_NorthCarolina = [[String:AnyObject]]()
    var arrRes_NorthDakota = [[String:AnyObject]]()
    var arrRes_NorthernMarianaIslands = [[String:AnyObject]]()
    var arrRes_Ohio = [[String:AnyObject]]()
    var arrRes_Oklahoma = [[String:AnyObject]]()
    var arrRes_Oregan = [[String:AnyObject]]()
    var arrRes_Pennsylvania = [[String:AnyObject]]()
    var arrRes_PuertoRico = [[String:AnyObject]]()
    var arrRes_RhodeIsland = [[String:AnyObject]]()
    var arrRes_SouthCarolina = [[String:AnyObject]]()
    var arrRes_SouthDakota = [[String:AnyObject]]()
    var arrRes_Tennessee = [[String:AnyObject]]()
    var arrRes_Texas = [[String:AnyObject]]()
    var arrRes_USVirginIslands = [[String:AnyObject]]()
    var arrRes_Utah = [[String:AnyObject]]()
    var arrRes_Vermont = [[String:AnyObject]]()
    var arrRes_Virginia = [[String:AnyObject]]()
    var arrRes_Washington = [[String:AnyObject]]()
    var arrRes_WestVirginia = [[String:AnyObject]]()
    var arrRes_Wisconsin = [[String:AnyObject]]()
    var arrRes_Wyoming = [[String:AnyObject]]()
    let headers:[String] = ["A","C","D","F","G","H","I","K","L","M","N","O","P","R","S","T","U","V","W"]
    let headers_A:[String] = ["A"]
    let headers_C:[String] = ["C"]
    let headers_D:[String] = ["D"]
    let headers_F:[String] = ["F"]
    let headers_G:[String] = ["G"]
    let headers_H:[String] = ["H"]
    let headers_I:[String] = ["I"]
    let headers_K:[String] = ["K"]
    let headers_L:[String] = ["L"]
    let headers_M:[String] = ["M"]
    let headers_N:[String] = ["N"]
    let headers_O:[String] = ["O"]
    let headers_P:[String] = ["P"]
    let headers_R:[String] = ["R"]
    let headers_S:[String] = ["S"]
    let headers_T:[String] = ["T"]
    let headers_U:[String] = ["U"]
    let headers_V:[String] = ["V"]
    let headers_W:[String] = ["W"]
    let pickers:[String] = ["All States","Alabama","Alaska","American Samoa","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","District of Columbia","Florida","Georgia","Guam","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Carolina","North Dakota","Northern Mariana Islands","Ohio","Oklahoma","Oregan","Pennsylvania","Puerto Rico","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","US Virgin Islands","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"]
    
    @IBAction func btnForPickerWillSelect(_ sender: Any) {
        self.view.viewWithTag(333)?.isHidden = true
        self.view.viewWithTag(33)?.isHidden = false
    }

    /*
    override func viewWillAppear(_ animated: Bool) {
        self.tblJSON.reloadData()
    }
    */
    
    override func viewWillAppear(_ animated: Bool) {
        //SwiftSpinner.show("Loading...")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.viewWithTag(33)?.isHidden = true //hide picker
        let attributes = [NSFontAttributeName:UIFont(name: "Arial", size: 20)]
        self.stateTabBatItem.setTitleTextAttributes(attributes, for: .normal)
        Alamofire.request("http://app102116-env.us-west-2.elasticbeanstalk.com/?legislators").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                //print(swiftyJsonVar) //returned JSON
                
                if let resData = swiftyJsonVar["results"].arrayObject {
                    self.arrRes = resData as! [[String:AnyObject]]
                    
                    for  var tempRes in self.arrRes {
                        if(tempRes["state_name"]?.substring(to: 1) == "A") {
                            self.arrResA.append(tempRes)
                        }
                        else if(tempRes["state_name"]?.substring(to: 1) == "C") {
                            self.arrResC.append(tempRes)
                        }
                        else if(tempRes["state_name"]?.substring(to: 1) == "D") {
                            self.arrResD.append(tempRes)
                        }
                        else if(tempRes["state_name"]?.substring(to: 1) == "F") {
                            self.arrResF.append(tempRes)
                        }
                        else if(tempRes["state_name"]?.substring(to: 1) == "G") {
                            self.arrResG.append(tempRes)
                        }
                        else if(tempRes["state_name"]?.substring(to: 1) == "H") {
                            self.arrResH.append(tempRes)
                        }
                        else if(tempRes["state_name"]?.substring(to: 1) == "I") {
                            self.arrResI.append(tempRes)
                        }
                        else if(tempRes["state_name"]?.substring(to: 1) == "K") {
                            self.arrResK.append(tempRes)
                        }
                        else if(tempRes["state_name"]?.substring(to: 1) == "L") {
                            self.arrResL.append(tempRes)
                        }
                        else if(tempRes["state_name"]?.substring(to: 1) == "M") {
                            self.arrResM.append(tempRes)
                        }
                        else if(tempRes["state_name"]?.substring(to: 1) == "N") {
                            self.arrResN.append(tempRes)
                        }
                        else if(tempRes["state_name"]?.substring(to: 1) == "O") {
                            self.arrResO.append(tempRes)
                        }
                        else if(tempRes["state_name"]?.substring(to: 1) == "P") {
                            self.arrResP.append(tempRes)
                        }
                        else if(tempRes["state_name"]?.substring(to: 1) == "R") {
                            self.arrResR.append(tempRes)
                        }
                        else if(tempRes["state_name"]?.substring(to: 1) == "S") {
                            self.arrResS.append(tempRes)
                        }
                        else if(tempRes["state_name"]?.substring(to: 1) == "T") {
                            self.arrResT.append(tempRes)
                        }
                        else if(tempRes["state_name"]?.substring(to: 1) == "U") {
                            self.arrResU.append(tempRes)
                        }
                        else if(tempRes["state_name"]?.substring(to: 1) == "V") {
                            self.arrResV.append(tempRes)
                        }
                        else if(tempRes["state_name"]?.substring(to: 1) == "W") {
                            self.arrResW.append(tempRes)
                        }
                    }
                    //print(self.arrResA)
                    func positionSort(dict1: [String: AnyObject], dict2: [String: AnyObject]) -> Bool {
                        let lastName1 = dict1["last_name"] as? String
                        let lastName2 = dict2["last_name"] as? String
                        return lastName1! < lastName2!
                    }
                    self.arrResA = self.arrResA.sorted(by: positionSort)
                    self.arrResC = self.arrResC.sorted(by: positionSort)
                    self.arrResD = self.arrResD.sorted(by: positionSort)
                    self.arrResF = self.arrResF.sorted(by: positionSort)
                    self.arrResG = self.arrResG.sorted(by: positionSort)
                    self.arrResH = self.arrResH.sorted(by: positionSort)
                    self.arrResI = self.arrResI.sorted(by: positionSort)
                    self.arrResK = self.arrResK.sorted(by: positionSort)
                    self.arrResL = self.arrResL.sorted(by: positionSort)
                    self.arrResM = self.arrResM.sorted(by: positionSort)
                    self.arrResN = self.arrResN.sorted(by: positionSort)
                    self.arrResO = self.arrResO.sorted(by: positionSort)
                    self.arrResP = self.arrResP.sorted(by: positionSort)
                    self.arrResR = self.arrResR.sorted(by: positionSort)
                    self.arrResS = self.arrResS.sorted(by: positionSort)
                    self.arrResT = self.arrResT.sorted(by: positionSort)
                    self.arrResU = self.arrResU.sorted(by: positionSort)
                    self.arrResV = self.arrResV.sorted(by: positionSort)
                    self.arrResW = self.arrResW.sorted(by: positionSort)
                }
                if self.arrRes.count > 0 {
                    self.tblJSON.reloadData()
                }
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "jsonCell")!
        
        if self.sections == 19 {
            if(indexPath.section == 0) {
                var dict = arrResA[(indexPath as NSIndexPath).row]
                cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                cell.detailTextLabel?.text = dict["state_name"] as? String
                let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                let image = #imageLiteral(resourceName: "placeHolder")
                cell.imageView!.kf.setImage(with: url, placeholder: image)
            }
            else if(indexPath.section == 1) {
                var dict = arrResC[(indexPath as NSIndexPath).row]
                cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                cell.detailTextLabel?.text = dict["state_name"] as? String
                let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                let image = #imageLiteral(resourceName: "placeHolder")
                cell.imageView!.kf.setImage(with: url, placeholder: image)
            }
            else if(indexPath.section == 2) {
                var dict = arrResD[(indexPath as NSIndexPath).row]
                cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                cell.detailTextLabel?.text = dict["state_name"] as? String
                let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                let image = #imageLiteral(resourceName: "placeHolder")
                cell.imageView!.kf.setImage(with: url, placeholder: image)
            }
            else if(indexPath.section == 3) {
                var dict = arrResF[(indexPath as NSIndexPath).row]
                cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                cell.detailTextLabel?.text = dict["state_name"] as? String
                let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                let image = #imageLiteral(resourceName: "placeHolder")
                cell.imageView!.kf.setImage(with: url, placeholder: image)
            }
            else if(indexPath.section == 4) {
                var dict = arrResG[(indexPath as NSIndexPath).row]
                cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                cell.detailTextLabel?.text = dict["state_name"] as? String
                let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                let image = #imageLiteral(resourceName: "placeHolder")
                cell.imageView!.kf.setImage(with: url, placeholder: image)
            }
            else if(indexPath.section == 5) {
                var dict = arrResH[(indexPath as NSIndexPath).row]
                cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                cell.detailTextLabel?.text = dict["state_name"] as? String
                let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                let image = #imageLiteral(resourceName: "placeHolder")
                cell.imageView!.kf.setImage(with: url, placeholder: image)
            }
            else if(indexPath.section == 6) {
                var dict = arrResI[(indexPath as NSIndexPath).row]
                cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                cell.detailTextLabel?.text = dict["state_name"] as? String
                let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                let image = #imageLiteral(resourceName: "placeHolder")
                cell.imageView!.kf.setImage(with: url, placeholder: image)
            }
            else if(indexPath.section == 7) {
                var dict = arrResK[(indexPath as NSIndexPath).row]
                cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                cell.detailTextLabel?.text = dict["state_name"] as? String
                let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                let image = #imageLiteral(resourceName: "placeHolder")
                cell.imageView!.kf.setImage(with: url, placeholder: image)
            }
            else if(indexPath.section == 8) {
                var dict = arrResL[(indexPath as NSIndexPath).row]
                cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                cell.detailTextLabel?.text = dict["state_name"] as? String
                let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                let image = #imageLiteral(resourceName: "placeHolder")
                cell.imageView!.kf.setImage(with: url, placeholder: image)
            }
            else if(indexPath.section == 9) {
                var dict = arrResM[(indexPath as NSIndexPath).row]
                cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                cell.detailTextLabel?.text = dict["state_name"] as? String
                let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                let image = #imageLiteral(resourceName: "placeHolder")
                cell.imageView!.kf.setImage(with: url, placeholder: image)
            }
            else if(indexPath.section == 10) {
                var dict = arrResN[(indexPath as NSIndexPath).row]
                cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                cell.detailTextLabel?.text = dict["state_name"] as? String
                let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                let image = #imageLiteral(resourceName: "placeHolder")
                cell.imageView!.kf.setImage(with: url, placeholder: image)
            }
            else if(indexPath.section == 11) {
                var dict = arrResO[(indexPath as NSIndexPath).row]
                cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                cell.detailTextLabel?.text = dict["state_name"] as? String
                let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                let image = #imageLiteral(resourceName: "placeHolder")
                cell.imageView!.kf.setImage(with: url, placeholder: image)
            }
            else if(indexPath.section == 12) {
                var dict = arrResP[(indexPath as NSIndexPath).row]
                cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                cell.detailTextLabel?.text = dict["state_name"] as? String
                let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                let image = #imageLiteral(resourceName: "placeHolder")
                cell.imageView!.kf.setImage(with: url, placeholder: image)
            }
            else if(indexPath.section == 13) {
                var dict = arrResR[(indexPath as NSIndexPath).row]
                cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                cell.detailTextLabel?.text = dict["state_name"] as? String
                let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                let image = #imageLiteral(resourceName: "placeHolder")
                cell.imageView!.kf.setImage(with: url, placeholder: image)
            }
            else if(indexPath.section == 14) {
                var dict = arrResS[(indexPath as NSIndexPath).row]
                cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                cell.detailTextLabel?.text = dict["state_name"] as? String
                let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                let image = #imageLiteral(resourceName: "placeHolder")
                cell.imageView!.kf.setImage(with: url, placeholder: image)
            }
            else if(indexPath.section == 15) {
                var dict = arrResT[(indexPath as NSIndexPath).row]
                cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                cell.detailTextLabel?.text = dict["state_name"] as? String
                let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                let image = #imageLiteral(resourceName: "placeHolder")
                cell.imageView!.kf.setImage(with: url, placeholder: image)
            }
            else if(indexPath.section == 16) {
                var dict = arrResU[(indexPath as NSIndexPath).row]
                cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                cell.detailTextLabel?.text = dict["state_name"] as? String
                let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                let image = #imageLiteral(resourceName: "placeHolder")
                cell.imageView!.kf.setImage(with: url, placeholder: image)
            }
            else if(indexPath.section == 17) {
                var dict = arrResV[(indexPath as NSIndexPath).row]
                cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                cell.detailTextLabel?.text = dict["state_name"] as? String
                let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                let image = #imageLiteral(resourceName: "placeHolder")
                cell.imageView!.kf.setImage(with: url, placeholder: image)
            }
            else if(indexPath.section == 18) {
                var dict = arrResW[(indexPath as NSIndexPath).row]
                cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                cell.detailTextLabel?.text = dict["state_name"] as? String
                let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                let image = #imageLiteral(resourceName: "placeHolder")
                cell.imageView!.kf.setImage(with: url, placeholder: image)
            }

        }
        else if self.sections == 1 {
            if self.pickerSelected == pickers[1] {
                if indexPath.section == 0 {
                    var dict = arrRes_Alabama[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[2] {
                if indexPath.section == 0 {
                    var dict = arrRes_Alaska[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[3] {
                if indexPath.section == 0 {
                    var dict = arrRes_AmericanSamoa[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[4] {
                if indexPath.section == 0 {
                    var dict = arrRes_Arizona[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[5] {
                if indexPath.section == 0 {
                    var dict = arrRes_Arkansas[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[6] {
                if indexPath.section == 0 {
                    var dict = arrRes_California[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[7] {
                if indexPath.section == 0 {
                    var dict = arrRes_Colorado[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[8] {
                if indexPath.section == 0 {
                    var dict = arrRes_Connecticut[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[9] {
                if indexPath.section == 0 {
                    var dict = arrRes_Delaware[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[10] {
                if indexPath.section == 0 {
                    var dict = arrRes_DistrictofColumbia[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[11] {
                if indexPath.section == 0 {
                    var dict = arrRes_Florida[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[12] {
                if indexPath.section == 0 {
                    var dict = arrRes_Georgia[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[13] {
                if indexPath.section == 0 {
                    var dict = arrRes_Guam[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[14] {
                if indexPath.section == 0 {
                    var dict = arrRes_Hawaii[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[15] {
                if indexPath.section == 0 {
                    var dict = arrRes_Idaho[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[16] {
                if indexPath.section == 0 {
                    var dict = arrRes_Illinois[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[17] {
                if indexPath.section == 0 {
                    var dict = arrRes_Indiana[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[18] {
                if indexPath.section == 0 {
                    var dict = arrRes_Iowa[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[19] {
                if indexPath.section == 0 {
                    var dict = arrRes_Kansas[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[20] {
                if indexPath.section == 0 {
                    var dict = arrRes_Kentucky[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[21] {
                if indexPath.section == 0 {
                    var dict = arrRes_Louisiana[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[22] {
                if indexPath.section == 0 {
                    var dict = arrRes_Maine[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[23] {
                if indexPath.section == 0 {
                    var dict = arrRes_Maryland[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[24] {
                if indexPath.section == 0 {
                    var dict = arrRes_Massachusetts[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[25] {
                if indexPath.section == 0 {
                    var dict = arrRes_Michigan[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[26] {
                if indexPath.section == 0 {
                    var dict = arrRes_Minnesota[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[27] {
                if indexPath.section == 0 {
                    var dict = arrRes_Mississippi[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[28] {
                if indexPath.section == 0 {
                    var dict = arrRes_Missouri[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[29] {
                if indexPath.section == 0 {
                    var dict = arrRes_Montana[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[30] {
                if indexPath.section == 0 {
                    var dict = arrRes_Nebraska[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[31] {
                if indexPath.section == 0 {
                    var dict = arrRes_Nevada[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[32] {
                if indexPath.section == 0 {
                    var dict = arrRes_NewHampshire[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[33] {
                if indexPath.section == 0 {
                    var dict = arrRes_NewJersey[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[34] {
                if indexPath.section == 0 {
                    var dict = arrRes_NewMexico[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[35] {
                if indexPath.section == 0 {
                    var dict = arrRes_NewYork[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[36] {
                if indexPath.section == 0 {
                    var dict = arrRes_NorthCarolina[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[37] {
                if indexPath.section == 0 {
                    var dict = arrRes_NorthDakota[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[38] {
                if indexPath.section == 0 {
                    var dict = arrRes_NorthernMarianaIslands[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[39] {
                if indexPath.section == 0 {
                    var dict = arrRes_Ohio[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[40] {
                if indexPath.section == 0 {
                    var dict = arrRes_Oklahoma[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[41] {
                if indexPath.section == 0 {
                    var dict = arrRes_Oregan[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[42] {
                if indexPath.section == 0 {
                    var dict = arrRes_Pennsylvania[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[43] {
                if indexPath.section == 0 {
                    var dict = arrRes_PuertoRico[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[44] {
                if indexPath.section == 0 {
                    var dict = arrRes_RhodeIsland[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[45] {
                if indexPath.section == 0 {
                    var dict = arrRes_SouthCarolina[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[46] {
                if indexPath.section == 0 {
                    var dict = arrRes_SouthDakota[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[47] {
                if indexPath.section == 0 {
                    var dict = arrRes_Tennessee[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[48] {
                if indexPath.section == 0 {
                    var dict = arrRes_Texas[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[49] {
                if indexPath.section == 0 {
                    var dict = arrRes_USVirginIslands[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[50] {
                if indexPath.section == 0 {
                    var dict = arrRes_Utah[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[51] {
                if indexPath.section == 0 {
                    var dict = arrRes_Vermont[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[52] {
                if indexPath.section == 0 {
                    var dict = arrRes_Virginia[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[53] {
                if indexPath.section == 0 {
                    var dict = arrRes_Washington[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[54] {
                if indexPath.section == 0 {
                    var dict = arrRes_WestVirginia[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[55] {
                if indexPath.section == 0 {
                    var dict = arrRes_Wisconsin[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
            else if self.pickerSelected == pickers[56] {
                if indexPath.section == 0 {
                    var dict = arrRes_Wyoming[(indexPath as NSIndexPath).row]
                    cell.textLabel?.text = (dict["last_name"] as? String)! + " " + (dict["first_name"] as? String)!
                    cell.detailTextLabel?.text = dict["state_name"] as? String
                    let url = URL(string: "https://theunitedstates.io/images/congress/original/" + (dict["bioguide_id"] as? String)! + ".jpg")
                    let image = #imageLiteral(resourceName: "placeHolder")
                    cell.imageView!.kf.setImage(with: url, placeholder: image)
                }
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return arrRes.count
        if self.sections == 19 {
            if(section == 0) {
                return arrResA.count
            }
            else if(section == 1) {
                return arrResC.count
            }
            else if(section == 2) {
                return arrResD.count
            }
            else if(section == 3) {
                return arrResF.count
            }
            else if(section == 4) {
                return arrResG.count
            }
            else if(section == 5) {
                return arrResH.count
            }
            else if(section == 6) {
                return arrResI.count
            }
            else if(section == 7) {
                return arrResK.count
            }
            else if(section == 8) {
                return arrResL.count
            }
            else if(section == 9) {
                return arrResM.count
            }
            else if(section == 10) {
                return arrResN.count
            }
            else if(section == 11) {
                return arrResO.count
            }
            else if(section == 12) {
                return arrResP.count
            }
            else if(section == 13) {
                return arrResR.count
            }
            else if(section == 14) {
                return arrResS.count
            }
            else if(section == 15) {
                return arrResT.count
            }
            else if(section == 16) {
                return arrResU.count
            }
            else if(section == 17) {
                return arrResV.count
            }
            else if(section == 18) {
                return arrResW.count
            }
        }
        else if self.sections == 1 {
            if self.pickerSelected == pickers[1] {
                if section == 0 {
                    return arrRes_Alabama.count
                }
            }
            else if self.pickerSelected == pickers[2] {
                if section == 0 {
                    return arrRes_Alaska.count
                }
            }
            else if self.pickerSelected == pickers[3] {
                if section == 0 {
                    return arrRes_AmericanSamoa.count
                }
            }
            else if self.pickerSelected == pickers[4] {
                if section == 0 {
                    return arrRes_Arizona.count
                }
            }
            else if self.pickerSelected == pickers[5] {
                if section == 0 {
                    return arrRes_Arkansas.count
                }
            }
            else if self.pickerSelected == pickers[6] {
                if section == 0 {
                    return arrRes_California.count
                }
            }
            else if self.pickerSelected == pickers[7] {
                if section == 0 {
                    return arrRes_Colorado.count
                }
            }
            else if self.pickerSelected == pickers[8] {
                if section == 0 {
                    return arrRes_Connecticut.count
                }
            }
            else if self.pickerSelected == pickers[9] {
                if section == 0 {
                    return arrRes_Delaware.count
                }
            }
            else if self.pickerSelected == pickers[10] {
                if section == 0 {
                    return arrRes_DistrictofColumbia.count
                }
            }
            else if self.pickerSelected == pickers[11] {
                if section == 0 {
                    return arrRes_Florida.count
                }
            }
            else if self.pickerSelected == pickers[12] {
                if section == 0 {
                    return arrRes_Georgia.count
                }
            }
            else if self.pickerSelected == pickers[13] {
                if section == 0 {
                    return arrRes_Guam.count
                }
            }
            else if self.pickerSelected == pickers[14] {
                if section == 0 {
                    return arrRes_Hawaii.count
                }
            }
            else if self.pickerSelected == pickers[15] {
                if section == 0 {
                    return arrRes_Idaho.count
                }
            }
            else if self.pickerSelected == pickers[16] {
                if section == 0 {
                    return arrRes_Illinois.count
                }
            }
            else if self.pickerSelected == pickers[17] {
                if section == 0 {
                    return arrRes_Indiana.count
                }
            }
            else if self.pickerSelected == pickers[18] {
                if section == 0 {
                    return arrRes_Iowa.count
                }
            }
            else if self.pickerSelected == pickers[19] {
                if section == 0 {
                    return arrRes_Kansas.count
                }
            }
            else if self.pickerSelected == pickers[20] {
                if section == 0 {
                    return arrRes_Kentucky.count
                }
            }
            else if self.pickerSelected == pickers[21] {
                if section == 0 {
                    return arrRes_Louisiana.count
                }
            }
            else if self.pickerSelected == pickers[22] {
                if section == 0 {
                    return arrRes_Maine.count
                }
            }
            else if self.pickerSelected == pickers[23] {
                if section == 0 {
                    return arrRes_Maryland.count
                }
            }
            else if self.pickerSelected == pickers[24] {
                if section == 0 {
                    return arrRes_Massachusetts.count
                }
            }
            else if self.pickerSelected == pickers[25] {
                if section == 0 {
                    return arrRes_Michigan.count
                }
            }
            else if self.pickerSelected == pickers[26] {
                if section == 0 {
                    return arrRes_Minnesota.count
                }
            }
            else if self.pickerSelected == pickers[27] {
                if section == 0 {
                    return arrRes_Mississippi.count
                }
            }
            else if self.pickerSelected == pickers[28] {
                if section == 0 {
                    return arrRes_Missouri.count
                }
            }
            else if self.pickerSelected == pickers[29] {
                if section == 0 {
                    return arrRes_Montana.count
                }
            }
            else if self.pickerSelected == pickers[30] {
                if section == 0 {
                    return arrRes_Nebraska.count
                }
            }
            else if self.pickerSelected == pickers[31] {
                if section == 0 {
                    return arrRes_Nevada.count
                }
            }
            else if self.pickerSelected == pickers[32] {
                if section == 0 {
                    return arrRes_NewHampshire.count
                }
            }
            else if self.pickerSelected == pickers[33] {
                if section == 0 {
                    return arrRes_NewJersey.count
                }
            }
            else if self.pickerSelected == pickers[34] {
                if section == 0 {
                    return arrRes_NewMexico.count
                }
            }
            else if self.pickerSelected == pickers[35] {
                if section == 0 {
                    return arrRes_NewYork.count
                }
            }
            else if self.pickerSelected == pickers[36] {
                if section == 0 {
                    return arrRes_NorthCarolina.count
                }
            }
            else if self.pickerSelected == pickers[37] {
                if section == 0 {
                    return arrRes_NorthDakota.count
                }
            }
            else if self.pickerSelected == pickers[38] {
                if section == 0 {
                    return arrRes_NorthernMarianaIslands.count
                }
            }
            else if self.pickerSelected == pickers[39] {
                if section == 0 {
                    return arrRes_Ohio.count
                }
            }
            else if self.pickerSelected == pickers[40] {
                if section == 0 {
                    return arrRes_Oklahoma.count
                }
            }
            else if self.pickerSelected == pickers[41] {
                if section == 0 {
                    return arrRes_Oregan.count
                }
            }
            else if self.pickerSelected == pickers[42] {
                if section == 0 {
                    return arrRes_Pennsylvania.count
                }
            }
            else if self.pickerSelected == pickers[43] {
                if section == 0 {
                    return arrRes_PuertoRico.count
                }
            }
            else if self.pickerSelected == pickers[44] {
                if section == 0 {
                    return arrRes_RhodeIsland.count
                }
            }
            else if self.pickerSelected == pickers[45] {
                if section == 0 {
                    return arrRes_SouthCarolina.count
                }
            }
            else if self.pickerSelected == pickers[46] {
                if section == 0 {
                    return arrRes_SouthDakota.count
                }
            }
            else if self.pickerSelected == pickers[47] {
                if section == 0 {
                    return arrRes_Tennessee.count
                }
            }
            else if self.pickerSelected == pickers[48] {
                if section == 0 {
                    return arrRes_Texas.count
                }
            }
            else if self.pickerSelected == pickers[49] {
                if section == 0 {
                    return arrRes_USVirginIslands.count
                }
            }
            else if self.pickerSelected == pickers[50] {
                if section == 0 {
                    return arrRes_Utah.count
                }
            }
            else if self.pickerSelected == pickers[51] {
                if section == 0 {
                    return arrRes_Vermont.count
                }
            }
            else if self.pickerSelected == pickers[52] {
                if section == 0 {
                    return arrRes_Virginia.count
                }
            }
            else if self.pickerSelected == pickers[53] {
                if section == 0 {
                    return arrRes_Washington.count
                }
            }
            else if self.pickerSelected == pickers[54] {
                if section == 0 {
                    return arrRes_WestVirginia.count
                }
            }
            else if self.pickerSelected == pickers[55] {
                if section == 0 {
                    return arrRes_Wisconsin.count
                }
            }
            else if self.pickerSelected == pickers[56] {
                if section == 0 {
                    return arrRes_Wyoming.count
                }
            }
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if self.sections == 19 {
            if(section == 0) {
                return "A"
            }
            else if(section == 1) {
                return "C"
            }
            else if(section == 2) {
                return "D"
            }
            else if(section == 3) {
                return "F"
            }
            else if(section == 4) {
                return "G"
            }
            else if(section == 5) {
                return "H"
            }
            else if(section == 6) {
                return "I"
            }
            else if(section == 7) {
                return "K"
            }
            else if(section == 8) {
                return "L"
            }
            else if(section == 9) {
                return "M"
            }
            else if(section == 10) {
                return "N"
            }
            else if(section == 11) {
                return "O"
            }
            else if(section == 12) {
                return "P"
            }
            else if(section == 13) {
                return "R"
            }
            else if(section == 14) {
                return "S"
            }
            else if(section == 15) {
                return "T"
            }
            else if(section == 16) {
                return "U"
            }
            else if(section == 17) {
                return "V"
            }
            else if(section == 18) {
                return "W"
            }
        }
        else if self.sections == 1 {
            if self.pickerSelected == pickers[1] {
                if section == 0 {
                    return "A"
                }
            }
            else if self.pickerSelected == pickers[2] {
                if section == 0 {
                    return "A"
                }
            }
            else if self.pickerSelected == pickers[3] {
                if section == 0 {
                    return "A"
                }
            }
            else if self.pickerSelected == pickers[4] {
                if section == 0 {
                    return "A"
                }
            }
            else if self.pickerSelected == pickers[5] {
                if section == 0 {
                    return "A"
                }
            }
            else if self.pickerSelected == pickers[6] {
                if section == 0 {
                    return "C"
                }
            }
            else if self.pickerSelected == pickers[7] {
                if section == 0 {
                    return "C"
                }
            }
            else if self.pickerSelected == pickers[8] {
                if section == 0 {
                    return "C"
                }
            }
            else if self.pickerSelected == pickers[9] {
                if section == 0 {
                    return "D"
                }
            }
            else if self.pickerSelected == pickers[10] {
                if section == 0 {
                    return "D"
                }
            }
            else if self.pickerSelected == pickers[11] {
                if section == 0 {
                    return "F"
                }
            }
            else if self.pickerSelected == pickers[12] {
                if section == 0 {
                    return "G"
                }
            }
            else if self.pickerSelected == pickers[13] {
                if section == 0 {
                    return "G"
                }
            }
            else if self.pickerSelected == pickers[14] {
                if section == 0 {
                    return "H"
                }
            }
            else if self.pickerSelected == pickers[15] {
                if section == 0 {
                    return "I"
                }
            }
            else if self.pickerSelected == pickers[16] {
                if section == 0 {
                    return "I"
                }
            }
            else if self.pickerSelected == pickers[17] {
                if section == 0 {
                    return "I"
                }
            }
            else if self.pickerSelected == pickers[18] {
                if section == 0 {
                    return "I"
                }
            }
            else if self.pickerSelected == pickers[19] {
                if section == 0 {
                    return "K"
                }
            }
            else if self.pickerSelected == pickers[20] {
                if section == 0 {
                    return "K"
                }
            }
            else if self.pickerSelected == pickers[21] {
                if section == 0 {
                    return "L"
                }
            }
            else if self.pickerSelected == pickers[22] {
                if section == 0 {
                    return "M"
                }
            }
            else if self.pickerSelected == pickers[23] {
                if section == 0 {
                    return "M"
                }
            }
            else if self.pickerSelected == pickers[24] {
                if section == 0 {
                    return "M"
                }
            }
            else if self.pickerSelected == pickers[25] {
                if section == 0 {
                    return "M"
                }
            }
            else if self.pickerSelected == pickers[26] {
                if section == 0 {
                    return "M"
                }
            }
            else if self.pickerSelected == pickers[27] {
                if section == 0 {
                    return "M"
                }
            }
            else if self.pickerSelected == pickers[28] {
                if section == 0 {
                    return "M"
                }
            }
            else if self.pickerSelected == pickers[29] {
                if section == 0 {
                    return "M"
                }
            }
            else if self.pickerSelected == pickers[30] {
                if section == 0 {
                    return "N"
                }
            }
            else if self.pickerSelected == pickers[31] {
                if section == 0 {
                    return "N"
                }
            }
            else if self.pickerSelected == pickers[32] {
                if section == 0 {
                    return "N"
                }
            }
            else if self.pickerSelected == pickers[33] {
                if section == 0 {
                    return "N"
                }
            }
            else if self.pickerSelected == pickers[34] {
                if section == 0 {
                    return "N"
                }
            }
            else if self.pickerSelected == pickers[35] {
                if section == 0 {
                    return "N"
                }
            }
            else if self.pickerSelected == pickers[36] {
                if section == 0 {
                    return "N"
                }
            }
            else if self.pickerSelected == pickers[37] {
                if section == 0 {
                    return "N"
                }
            }
            else if self.pickerSelected == pickers[38] {
                if section == 0 {
                    return "N"
                }
            }
            else if self.pickerSelected == pickers[39] {
                if section == 0 {
                    return "O"
                }
            }
            else if self.pickerSelected == pickers[40] {
                if section == 0 {
                    return "O"
                }
            }
            else if self.pickerSelected == pickers[41] {
                if section == 0 {
                    return "O"
                }
            }
            else if self.pickerSelected == pickers[42] {
                if section == 0 {
                    return "P"
                }
            }
            else if self.pickerSelected == pickers[43] {
                if section == 0 {
                    return "P"
                }
            }
            else if self.pickerSelected == pickers[44] {
                if section == 0 {
                    return "R"
                }
            }
            else if self.pickerSelected == pickers[45] {
                if section == 0 {
                    return "S"
                }
            }
            else if self.pickerSelected == pickers[46] {
                if section == 0 {
                    return "S"
                }
            }
            else if self.pickerSelected == pickers[47] {
                if section == 0 {
                    return "T"
                }
            }
            else if self.pickerSelected == pickers[48] {
                if section == 0 {
                    return "T"
                }
            }
            else if self.pickerSelected == pickers[49] {
                if section == 0 {
                    return "U"
                }
            }
            else if self.pickerSelected == pickers[50] {
                if section == 0 {
                    return "U"
                }
            }
            else if self.pickerSelected == pickers[51] {
                if section == 0 {
                    return "V"
                }
            }
            else if self.pickerSelected == pickers[52] {
                if section == 0 {
                    return "V"
                }
            }
            else if self.pickerSelected == pickers[53] {
                if section == 0 {
                    return "W"
                }
            }
            else if self.pickerSelected == pickers[54] {
                if section == 0 {
                    return "W"
                }
            }
            else if self.pickerSelected == pickers[55] {
                if section == 0 {
                    return "W"
                }
            }
            else if self.pickerSelected == pickers[56] {
                if section == 0 {
                    return "W"
                }
            }
        }
        return "temp"
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        if self.sections == 19 {
            return headers
        }
        else if self.sections == 1 {
            if self.pickerSelected == pickers[1] {
                return headers_A
            }
            else if self.pickerSelected == pickers[2] {
                return headers_A
            }
            else if self.pickerSelected == pickers[3] {
                return headers_A
            }
            else if self.pickerSelected == pickers[4] {
                return headers_A
            }
            else if self.pickerSelected == pickers[5] {
                return headers_A
            }
            else if self.pickerSelected == pickers[6] {
                return headers_C
            }
            else if self.pickerSelected == pickers[7] {
                return headers_C
            }
            else if self.pickerSelected == pickers[8] {
                return headers_C
            }
            else if self.pickerSelected == pickers[9] {
                return headers_D
            }
            else if self.pickerSelected == pickers[10] {
                return headers_D
            }
            else if self.pickerSelected == pickers[11] {
                return headers_F
            }
            else if self.pickerSelected == pickers[12] {
                return headers_G
            }
            else if self.pickerSelected == pickers[13] {
                return headers_G
            }
            else if self.pickerSelected == pickers[14] {
                return headers_H
            }
            else if self.pickerSelected == pickers[15] {
                return headers_I
            }
            else if self.pickerSelected == pickers[16] {
                return headers_I
            }
            else if self.pickerSelected == pickers[17] {
                return headers_I
            }
            else if self.pickerSelected == pickers[18] {
                return headers_I
            }
            else if self.pickerSelected == pickers[19] {
                return headers_K
            }
            else if self.pickerSelected == pickers[20] {
                return headers_K
            }
            else if self.pickerSelected == pickers[21] {
                return headers_L
            }
            else if self.pickerSelected == pickers[22] {
                return headers_M
            }
            else if self.pickerSelected == pickers[23] {
                return headers_M
            }
            else if self.pickerSelected == pickers[24] {
                return headers_M
            }
            else if self.pickerSelected == pickers[25] {
                return headers_M
            }
            else if self.pickerSelected == pickers[26] {
                return headers_M
            }
            else if self.pickerSelected == pickers[27] {
                return headers_M
            }
            else if self.pickerSelected == pickers[28] {
                return headers_M
            }
            else if self.pickerSelected == pickers[29] {
                return headers_M
            }
            else if self.pickerSelected == pickers[30] {
                return headers_N
            }
            else if self.pickerSelected == pickers[31] {
                return headers_N
            }
            else if self.pickerSelected == pickers[32] {
                return headers_N
            }
            else if self.pickerSelected == pickers[33] {
                return headers_N
            }
            else if self.pickerSelected == pickers[34] {
                return headers_N
            }
            else if self.pickerSelected == pickers[35] {
                return headers_N
            }
            else if self.pickerSelected == pickers[36] {
                return headers_N
            }
            else if self.pickerSelected == pickers[37] {
                return headers_N
            }
            else if self.pickerSelected == pickers[38] {
                return headers_N
            }
            else if self.pickerSelected == pickers[39] {
                return headers_O
            }
            else if self.pickerSelected == pickers[40] {
                return headers_O
            }
            else if self.pickerSelected == pickers[41] {
                return headers_O
            }
            else if self.pickerSelected == pickers[42] {
                return headers_P
            }
            else if self.pickerSelected == pickers[43] {
                return headers_P
            }
            else if self.pickerSelected == pickers[44] {
                return headers_R
            }
            else if self.pickerSelected == pickers[45] {
                return headers_S
            }
            else if self.pickerSelected == pickers[46] {
                return headers_S
            }
            else if self.pickerSelected == pickers[47] {
                return headers_T
            }
            else if self.pickerSelected == pickers[48] {
                return headers_T
            }
            else if self.pickerSelected == pickers[49] {
                return headers_U
            }
            else if self.pickerSelected == pickers[50] {
                return headers_U
            }
            else if self.pickerSelected == pickers[51] {
                return headers_V
            }
            else if self.pickerSelected == pickers[52] {
                return headers_V
            }
            else if self.pickerSelected == pickers[53] {
                return headers_W
            }
            else if self.pickerSelected == pickers[54] {
                return headers_W
            }
            else if self.pickerSelected == pickers[55] {
                return headers_W
            }
            else if self.pickerSelected == pickers[56] {
                return headers_W
            }
        }
        return headers
    }
    
    //PickerView Funcs:
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickers.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickers[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if self.pickers[row] == "All States" {
            //self.pickerSelected = "All States"
            self.sections = 19
        }
        else {
            self.sections = 1
            if self.pickers[row] == pickers[1] {
                self.pickerSelected = pickers[1]
                if self.arrRes_Alabama.isEmpty == true {
                    for  var tempRes in self.arrResA {
                        if(tempRes["state_name"] as? String == pickers[1]) {
                            self.arrRes_Alabama.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[2] {
                self.pickerSelected = pickers[2]
                if self.arrRes_Alaska.isEmpty == true {
                    for  var tempRes in self.arrResA {
                        if(tempRes["state_name"] as? String == pickers[2]) {
                            self.arrRes_Alaska.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[3] {
                self.pickerSelected = pickers[3]
                if self.arrRes_AmericanSamoa.isEmpty == true {
                    for  var tempRes in self.arrResA {
                        if(tempRes["state_name"] as? String == pickers[3]) {
                            self.arrRes_AmericanSamoa.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[4] {
                self.pickerSelected = pickers[4]
                if self.arrRes_Arizona.isEmpty == true {
                    for  var tempRes in self.arrResA {
                        if(tempRes["state_name"] as? String == pickers[4]) {
                            self.arrRes_Arizona.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[5] {
                self.pickerSelected = pickers[5]
                if self.arrRes_Arkansas.isEmpty == true {
                    for  var tempRes in self.arrResA {
                        if(tempRes["state_name"] as? String == pickers[5]) {
                            self.arrRes_Arkansas.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[6] {
                self.pickerSelected = pickers[6]
                if self.arrRes_California.isEmpty == true {
                    for  var tempRes in self.arrResC {
                        if(tempRes["state_name"] as? String == pickers[6]) {
                            self.arrRes_California.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[7] {
                self.pickerSelected = pickers[7]
                if self.arrRes_Colorado.isEmpty == true {
                    for  var tempRes in self.arrResC {
                        if(tempRes["state_name"] as? String == pickers[7]) {
                            self.arrRes_Colorado.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[8] {
                self.pickerSelected = pickers[8]
                if self.arrRes_Connecticut.isEmpty == true {
                    for  var tempRes in self.arrResC {
                        if(tempRes["state_name"] as? String == pickers[8]) {
                            self.arrRes_Connecticut.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[9] {
                self.pickerSelected = pickers[9]
                if self.arrRes_Delaware.isEmpty == true {
                    for  var tempRes in self.arrResD {
                        if(tempRes["state_name"] as? String == pickers[9]) {
                            self.arrRes_Delaware.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[10] {
                self.pickerSelected = pickers[10]
                if self.arrRes_DistrictofColumbia.isEmpty == true {
                    for  var tempRes in self.arrResD {
                        if(tempRes["state_name"] as? String == pickers[10]) {
                            self.arrRes_DistrictofColumbia.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[11] {
                self.pickerSelected = pickers[11]
                if self.arrRes_Florida.isEmpty == true {
                    for  var tempRes in self.arrResF {
                        if(tempRes["state_name"] as? String == pickers[11]) {
                            self.arrRes_Florida.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[12] {
                self.pickerSelected = pickers[12]
                if self.arrRes_Georgia.isEmpty == true {
                    for  var tempRes in self.arrResG {
                        if(tempRes["state_name"] as? String == pickers[12]) {
                            self.arrRes_Georgia.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[13] {
                self.pickerSelected = pickers[13]
                if self.arrRes_Guam.isEmpty == true {
                    for  var tempRes in self.arrResG {
                        if(tempRes["state_name"] as? String == pickers[13]) {
                            self.arrRes_Guam.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[14] {
                self.pickerSelected = pickers[14]
                if self.arrRes_Hawaii.isEmpty == true {
                    for  var tempRes in self.arrResH {
                        if(tempRes["state_name"] as? String == pickers[14]) {
                            self.arrRes_Hawaii.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[15] {
                self.pickerSelected = pickers[15]
                if self.arrRes_Idaho.isEmpty == true {
                    for  var tempRes in self.arrResI {
                        if(tempRes["state_name"] as? String == pickers[15]) {
                            self.arrRes_Idaho.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[16] {
                self.pickerSelected = pickers[16]
                if self.arrRes_Illinois.isEmpty == true {
                    for  var tempRes in self.arrResI {
                        if(tempRes["state_name"] as? String == pickers[16]) {
                            self.arrRes_Illinois.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[17] {
                self.pickerSelected = pickers[17]
                if self.arrRes_Indiana.isEmpty == true {
                    for  var tempRes in self.arrResI {
                        if(tempRes["state_name"] as? String == pickers[17]) {
                            self.arrRes_Indiana.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[18] {
                self.pickerSelected = pickers[18]
                if self.arrRes_Iowa.isEmpty == true {
                    for  var tempRes in self.arrResI {
                        if(tempRes["state_name"] as? String == pickers[18]) {
                            self.arrRes_Iowa.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[19] {
                self.pickerSelected = pickers[19]
                if self.arrRes_Kansas.isEmpty == true {
                    for  var tempRes in self.arrResK {
                        if(tempRes["state_name"] as? String == pickers[19]) {
                            self.arrRes_Kansas.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[20] {
                self.pickerSelected = pickers[20]
                if self.arrRes_Kentucky.isEmpty == true {
                    for  var tempRes in self.arrResK {
                        if(tempRes["state_name"] as? String == pickers[20]) {
                            self.arrRes_Kentucky.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[21] {
                self.pickerSelected = pickers[21]
                if self.arrRes_Louisiana.isEmpty == true {
                    for  var tempRes in self.arrResL {
                        if(tempRes["state_name"] as? String == pickers[21]) {
                            self.arrRes_Louisiana.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[22] {
                self.pickerSelected = pickers[22]
                if self.arrRes_Maine.isEmpty == true {
                    for  var tempRes in self.arrResM {
                        if(tempRes["state_name"] as? String == pickers[22]) {
                            self.arrRes_Maine.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[23] {
                self.pickerSelected = pickers[23]
                if self.arrRes_Maryland.isEmpty == true {
                    for  var tempRes in self.arrResM {
                        if(tempRes["state_name"] as? String == pickers[23]) {
                            self.arrRes_Maryland.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[24] {
                self.pickerSelected = pickers[24]
                if self.arrRes_Massachusetts.isEmpty == true {
                    for  var tempRes in self.arrResM {
                        if(tempRes["state_name"] as? String == pickers[24]) {
                            self.arrRes_Massachusetts.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[25] {
                self.pickerSelected = pickers[25]
                if self.arrRes_Michigan.isEmpty == true {
                    for  var tempRes in self.arrResM {
                        if(tempRes["state_name"] as? String == pickers[25]) {
                            self.arrRes_Michigan.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[26] {
                self.pickerSelected = pickers[26]
                if self.arrRes_Minnesota.isEmpty == true {
                    for  var tempRes in self.arrResM {
                        if(tempRes["state_name"] as? String == pickers[26]) {
                            self.arrRes_Minnesota.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[27] {
                self.pickerSelected = pickers[27]
                if self.arrRes_Mississippi.isEmpty == true {
                    for  var tempRes in self.arrResM {
                        if(tempRes["state_name"] as? String == pickers[27]) {
                            self.arrRes_Mississippi.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[28] {
                self.pickerSelected = pickers[28]
                if self.arrRes_Missouri.isEmpty == true {
                    for  var tempRes in self.arrResM {
                        if(tempRes["state_name"] as? String == pickers[28]) {
                            self.arrRes_Missouri.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[29] {
                self.pickerSelected = pickers[29]
                if self.arrRes_Montana.isEmpty == true {
                    for  var tempRes in self.arrResM {
                        if(tempRes["state_name"] as? String == pickers[29]) {
                            self.arrRes_Montana.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[30] {
                self.pickerSelected = pickers[30]
                if self.arrRes_Nebraska.isEmpty == true {
                    for  var tempRes in self.arrResN {
                        if(tempRes["state_name"] as? String == pickers[30]) {
                            self.arrRes_Nebraska.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[31] {
                self.pickerSelected = pickers[31]
                if self.arrRes_Nevada.isEmpty == true {
                    for  var tempRes in self.arrResN {
                        if(tempRes["state_name"] as? String == pickers[31]) {
                            self.arrRes_Nevada.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[32] {
                self.pickerSelected = pickers[32]
                if self.arrRes_NewHampshire.isEmpty == true {
                    for  var tempRes in self.arrResN {
                        if(tempRes["state_name"] as? String == pickers[32]) {
                            self.arrRes_NewHampshire.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[33] {
                self.pickerSelected = pickers[33]
                if self.arrRes_NewJersey.isEmpty == true {
                    for  var tempRes in self.arrResN {
                        if(tempRes["state_name"] as? String == pickers[33]) {
                            self.arrRes_NewJersey.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[34] {
                self.pickerSelected = pickers[34]
                if self.arrRes_NewMexico.isEmpty == true {
                    for  var tempRes in self.arrResN {
                        if(tempRes["state_name"] as? String == pickers[34]) {
                            self.arrRes_NewMexico.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[35] {
                self.pickerSelected = pickers[35]
                if self.arrRes_NewYork.isEmpty == true {
                    for  var tempRes in self.arrResN {
                        if(tempRes["state_name"] as? String == pickers[35]) {
                            self.arrRes_NewYork.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[36] {
                self.pickerSelected = pickers[36]
                if self.arrRes_NorthCarolina.isEmpty == true {
                    for  var tempRes in self.arrResN {
                        if(tempRes["state_name"] as? String == pickers[36]) {
                            self.arrRes_NorthCarolina.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[37] {
                self.pickerSelected = pickers[37]
                if self.arrRes_NorthDakota.isEmpty == true {
                    for  var tempRes in self.arrResN {
                        if(tempRes["state_name"] as? String == pickers[37]) {
                            self.arrRes_NorthDakota.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[38] {
                self.pickerSelected = pickers[38]
                if self.arrRes_NorthernMarianaIslands.isEmpty == true {
                    for  var tempRes in self.arrResN {
                        if(tempRes["state_name"] as? String == pickers[38]) {
                            self.arrRes_NorthernMarianaIslands.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[39] {
                self.pickerSelected = pickers[39]
                if self.arrRes_Ohio.isEmpty == true {
                    for  var tempRes in self.arrResO {
                        if(tempRes["state_name"] as? String == pickers[39]) {
                            self.arrRes_Ohio.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[40] {
                self.pickerSelected = pickers[40]
                if self.arrRes_Oklahoma.isEmpty == true {
                    for  var tempRes in self.arrResO {
                        if(tempRes["state_name"] as? String == pickers[40]) {
                            self.arrRes_Oklahoma.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[41] {
                self.pickerSelected = pickers[41]
                if self.arrRes_Oregan.isEmpty == true {
                    for  var tempRes in self.arrResO {
                        if(tempRes["state_name"] as? String == pickers[41]) {
                            self.arrRes_Oregan.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[42] {
                self.pickerSelected = pickers[42]
                if self.arrRes_Pennsylvania.isEmpty == true {
                    for  var tempRes in self.arrResP {
                        if(tempRes["state_name"] as? String == pickers[42]) {
                            self.arrRes_Pennsylvania.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[43] {
                self.pickerSelected = pickers[43]
                if self.arrRes_PuertoRico.isEmpty == true {
                    for  var tempRes in self.arrResP {
                        if(tempRes["state_name"] as? String == pickers[43]) {
                            self.arrRes_PuertoRico.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[44] {
                self.pickerSelected = pickers[44]
                if self.arrRes_RhodeIsland.isEmpty == true {
                    for  var tempRes in self.arrResR {
                        if(tempRes["state_name"] as? String == pickers[44]) {
                            self.arrRes_RhodeIsland.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[45] {
                self.pickerSelected = pickers[45]
                if self.arrRes_SouthCarolina.isEmpty == true {
                    for  var tempRes in self.arrResS {
                        if(tempRes["state_name"] as? String == pickers[45]) {
                            self.arrRes_SouthCarolina.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[46] {
                self.pickerSelected = pickers[46]
                if self.arrRes_SouthDakota.isEmpty == true {
                    for  var tempRes in self.arrResS {
                        if(tempRes["state_name"] as? String == pickers[46]) {
                            self.arrRes_SouthDakota.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[47] {
                self.pickerSelected = pickers[47]
                if self.arrRes_Tennessee.isEmpty == true {
                    for  var tempRes in self.arrResT {
                        if(tempRes["state_name"] as? String == pickers[47]) {
                            self.arrRes_Tennessee.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[48] {
                self.pickerSelected = pickers[48]
                if self.arrRes_Texas.isEmpty == true {
                    for  var tempRes in self.arrResT {
                        if(tempRes["state_name"] as? String == pickers[48]) {
                            self.arrRes_Texas.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[49] {
                self.pickerSelected = pickers[49]
                if self.arrRes_USVirginIslands.isEmpty == true {
                    for  var tempRes in self.arrResU {
                        if(tempRes["state_name"] as? String == pickers[49]) {
                            self.arrRes_USVirginIslands.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[50] {
                self.pickerSelected = pickers[50]
                if self.arrRes_Utah.isEmpty == true {
                    for  var tempRes in self.arrResU {
                        if(tempRes["state_name"] as? String == pickers[50]) {
                            self.arrRes_Utah.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[51] {
                self.pickerSelected = pickers[51]
                if self.arrRes_Vermont.isEmpty == true {
                    for  var tempRes in self.arrResV {
                        if(tempRes["state_name"] as? String == pickers[51]) {
                            self.arrRes_Vermont.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[52] {
                self.pickerSelected = pickers[52]
                if self.arrRes_Virginia.isEmpty == true {
                    for  var tempRes in self.arrResV {
                        if(tempRes["state_name"] as? String == pickers[52]) {
                            self.arrRes_Virginia.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[53] {
                self.pickerSelected = pickers[53]
                if self.arrRes_Washington.isEmpty == true {
                    for  var tempRes in self.arrResW {
                        if(tempRes["state_name"] as? String == pickers[53]) {
                            self.arrRes_Washington.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[54] {
                self.pickerSelected = pickers[54]
                if self.arrRes_WestVirginia.isEmpty == true {
                    for  var tempRes in self.arrResW {
                        if(tempRes["state_name"] as? String == pickers[54]) {
                            self.arrRes_WestVirginia.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[55] {
                self.pickerSelected = pickers[55]
                if self.arrRes_Wisconsin.isEmpty == true {
                    for  var tempRes in self.arrResW {
                        if(tempRes["state_name"] as? String == pickers[55]) {
                            self.arrRes_Wisconsin.append(tempRes)
                        }
                    }
                }
            }
            else if self.pickers[row] == pickers[56] {
                self.pickerSelected = pickers[56]
                if self.arrRes_Wyoming.isEmpty == true {
                    for  var tempRes in self.arrResW {
                        if(tempRes["state_name"] as? String == pickers[56]) {
                            self.arrRes_Wyoming.append(tempRes)
                        }
                    }
                }
            }
        }
        
        self.tblJSON.reloadData()
        self.view.viewWithTag(333)?.isHidden = false
        self.view.viewWithTag(33)?.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //print(arrRes2Detail)
        let legDetailsView = segue.destination as! legDetailsViewController_state
        let selectedRow = tblJSON.indexPathForSelectedRow!.row
        if segue.identifier == "legStateJsonCell" {
            if self.sections == 19 {
                if tblJSON.indexPathForSelectedRow!.section == 0 {
                    legDetailsView.recData = [arrResA[selectedRow]]
                }
                else if tblJSON.indexPathForSelectedRow!.section == 1 {
                    legDetailsView.recData = [arrResC[selectedRow]]
                }
                else if tblJSON.indexPathForSelectedRow!.section == 2 {
                    legDetailsView.recData = [arrResD[selectedRow]]
                }
                else if tblJSON.indexPathForSelectedRow!.section == 3 {
                    legDetailsView.recData = [arrResF[selectedRow]]
                }
                else if tblJSON.indexPathForSelectedRow!.section == 4 {
                    legDetailsView.recData = [arrResG[selectedRow]]
                }
                else if tblJSON.indexPathForSelectedRow!.section == 5 {
                    legDetailsView.recData = [arrResH[selectedRow]]
                }
                else if tblJSON.indexPathForSelectedRow!.section == 6 {
                    legDetailsView.recData = [arrResI[selectedRow]]
                }
                else if tblJSON.indexPathForSelectedRow!.section == 7 {
                    legDetailsView.recData = [arrResK[selectedRow]]
                }
                else if tblJSON.indexPathForSelectedRow!.section == 8 {
                    legDetailsView.recData = [arrResL[selectedRow]]
                }
                else if tblJSON.indexPathForSelectedRow!.section == 9 {
                    legDetailsView.recData = [arrResM[selectedRow]]
                }
                else if tblJSON.indexPathForSelectedRow!.section == 10 {
                    legDetailsView.recData = [arrResN[selectedRow]]
                }
                else if tblJSON.indexPathForSelectedRow!.section == 11 {
                    legDetailsView.recData = [arrResO[selectedRow]]
                }
                else if tblJSON.indexPathForSelectedRow!.section == 12 {
                    legDetailsView.recData = [arrResP[selectedRow]]
                }
                else if tblJSON.indexPathForSelectedRow!.section == 13 {
                    legDetailsView.recData = [arrResR[selectedRow]]
                }
                else if tblJSON.indexPathForSelectedRow!.section == 14 {
                    legDetailsView.recData = [arrResS[selectedRow]]
                }
                else if tblJSON.indexPathForSelectedRow!.section == 15 {
                    legDetailsView.recData = [arrResT[selectedRow]]
                }
                else if tblJSON.indexPathForSelectedRow!.section == 16 {
                    legDetailsView.recData = [arrResU[selectedRow]]
                }
                else if tblJSON.indexPathForSelectedRow!.section == 17 {
                    legDetailsView.recData = [arrResV[selectedRow]]
                }
                else if tblJSON.indexPathForSelectedRow!.section == 18 {
                    legDetailsView.recData = [arrResW[selectedRow]]
                }
            }
            else if self.sections == 1 {
                if self.pickerSelected == self.pickers[1]  {
                    legDetailsView.recData = [arrRes_Alabama[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[2]  {
                    legDetailsView.recData = [self.arrRes_Alaska[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[3]  {
                    legDetailsView.recData = [self.arrRes_AmericanSamoa[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[4]  {
                    legDetailsView.recData = [self.arrRes_Arizona[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[5]  {
                    legDetailsView.recData = [self.arrRes_Arkansas[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[6]  {
                    legDetailsView.recData = [self.arrRes_California[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[7]  {
                    legDetailsView.recData = [self.arrRes_Colorado[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[8]  {
                    legDetailsView.recData = [self.arrRes_Connecticut[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[9]  {
                    legDetailsView.recData = [self.arrRes_Delaware[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[10]  {
                    legDetailsView.recData = [self.arrRes_DistrictofColumbia[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[11]  {
                    legDetailsView.recData = [self.arrRes_Florida[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[12]  {
                    legDetailsView.recData = [self.arrRes_Georgia[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[13]  {
                    legDetailsView.recData = [self.arrRes_Guam[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[14]  {
                    legDetailsView.recData = [self.arrRes_Hawaii[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[15]  {
                    legDetailsView.recData = [self.arrRes_Idaho[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[16]  {
                    legDetailsView.recData = [self.arrRes_Illinois[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[17]  {
                    legDetailsView.recData = [self.arrRes_Indiana[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[18]  {
                    legDetailsView.recData = [self.arrRes_Iowa[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[19]  {
                    legDetailsView.recData = [self.arrRes_Kansas[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[20]  {
                    legDetailsView.recData = [self.arrRes_Kentucky[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[21]  {
                    legDetailsView.recData = [self.arrRes_Louisiana[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[22]  {
                    legDetailsView.recData = [self.arrRes_Maine[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[23]  {
                    legDetailsView.recData = [self.arrRes_Maryland[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[24]  {
                    legDetailsView.recData = [self.arrRes_Massachusetts[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[25]  {
                    legDetailsView.recData = [self.arrRes_Michigan[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[26]  {
                    legDetailsView.recData = [self.arrRes_Minnesota[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[27]  {
                    legDetailsView.recData = [self.arrRes_Mississippi[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[28]  {
                    legDetailsView.recData = [self.arrRes_Missouri[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[29]  {
                    legDetailsView.recData = [self.arrRes_Montana[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[30]  {
                    legDetailsView.recData = [self.arrRes_Nebraska[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[31]  {
                    legDetailsView.recData = [self.arrRes_Nevada[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[32]  {
                    legDetailsView.recData = [self.arrRes_NewHampshire[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[33]  {
                    legDetailsView.recData = [self.arrRes_NewJersey[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[34]  {
                    legDetailsView.recData = [self.arrRes_NewMexico[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[35]  {
                    legDetailsView.recData = [self.arrRes_NewYork[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[36]  {
                    legDetailsView.recData = [self.arrRes_NorthCarolina[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[37]  {
                    legDetailsView.recData = [self.arrRes_NorthDakota[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[38]  {
                    legDetailsView.recData = [self.arrRes_NorthernMarianaIslands[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[39]  {
                    legDetailsView.recData = [self.arrRes_Ohio[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[40]  {
                    legDetailsView.recData = [self.arrRes_Oklahoma[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[41]  {
                    legDetailsView.recData = [self.arrRes_Oregan[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[42]  {
                    legDetailsView.recData = [self.arrRes_Pennsylvania[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[43]  {
                    legDetailsView.recData = [self.arrRes_PuertoRico[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[44]  {
                    legDetailsView.recData = [self.arrRes_RhodeIsland[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[45]  {
                    legDetailsView.recData = [self.arrRes_SouthCarolina[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[46]  {
                    legDetailsView.recData = [self.arrRes_SouthDakota[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[47]  {
                    legDetailsView.recData = [self.arrRes_Tennessee[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[48]  {
                    legDetailsView.recData = [self.arrRes_Texas[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[49]  {
                    legDetailsView.recData = [self.arrRes_USVirginIslands[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[50]  {
                    legDetailsView.recData = [self.arrRes_Utah[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[51]  {
                    legDetailsView.recData = [self.arrRes_Vermont[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[52]  {
                    legDetailsView.recData = [self.arrRes_Virginia[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[53]  {
                    legDetailsView.recData = [self.arrRes_Washington[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[54]  {
                    legDetailsView.recData = [self.arrRes_WestVirginia[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[55]  {
                    legDetailsView.recData = [self.arrRes_Wisconsin[selectedRow]]
                }
                else if self.pickerSelected == self.pickers[56]  {
                    legDetailsView.recData = [self.arrRes_Wyoming[selectedRow]]
                }

            }
        }
    }


    @IBAction func backToLegStateViewController(segue:UIStoryboardSegue) {
    }
    
}
