//
//  ViewControllerSetting.swift
//  MyJournal
//
//  Created by Loshan on 2015/7/14.
//  Copyright (c) 2015年 com.loshan. All rights reserved.
//

import UIKit

class ViewControllerSetting: UIViewController, UITableViewDataSource, UITableViewDelegate {

 
    
    @IBOutlet var settindsTableView: UITableView!
    
    //var settings = ["Name","E-mail","Password","Alarm"]
//
//    var settingsitems :Array <Dictionary<String,String>> = [["name":"Name","imageName":"person"],["name":"E-mail","imageName":"mail"],["name":"Password","imageName":"password"],["name":"Alarm","imageName":"alarm"]]
//    
//    var arycheck: Array<Bool> = [false,false,false,false]
    
    var settingsarray = ["User","Password","Alarm"]
    var settingsImgArray = ["person","password","alarm"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.settindsTableView.dataSource = self
        
        //self.settindsTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")

//        self.settindsTableView.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
//    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsarray.count
    }
//    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "cell"
        let cell = settindsTableView.dequeueReusableCellWithIdentifier(cellIdentifier,forIndexPath: indexPath) as! CustomTableViewCell
        cell.nameLabel.text = settingsarray[indexPath.row]
        cell.setImageView.image = UIImage(named: settingsImgArray[indexPath.row])
        cell.setImageView.layer.borderColor = UIColor.blueColor().CGColor
        cell.setImageView.layer.cornerRadius = cell.setImageView.frame.size.width / 2
        cell.setImageView.clipsToBounds = true
//
//        var cellitem : Dictionary <String,String> = settingsitems[indexPath.row]
//        cell.textLabel?.text = cellitem["name"]
//        cell.imageView?.image = UIImage(named: cellitem["imageName"]!)
//        
        return cell
    }
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
