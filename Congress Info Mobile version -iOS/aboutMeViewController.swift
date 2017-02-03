//
//  aboutMeViewController.swift
//  CongressInfo
//
//  Created by song zicheng daily use on 2016/11/30.
//  Copyright © 2016年 song zicheng. All rights reserved.
//

import UIKit

class aboutMeViewController: UIViewController {

    @IBOutlet weak var authorAvatar: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.authorAvatar.image = #imageLiteral(resourceName: "avatar")
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
