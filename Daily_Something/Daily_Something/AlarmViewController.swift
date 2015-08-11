//
//  AlarmViewController.swift
//  MyJournal
//
//  Created by Loshan on 2015/7/22.
//  Copyright (c) 2015年 com.loshan. All rights reserved.
//

import UIKit

class AlarmViewController: UIViewController , UITableViewDataSource, UITableViewDelegate, mydelegate { //加上mydelegate的protocal

    @IBOutlet var AlarmListTableView: UITableView!
    @IBOutlet weak var showAlarmTime: UILabel!
    //data Array 裡面存Dictionary，Dictionary中存的key value 是 String
    var data = Array<Dictionary<String,AnyObject>>()
    //dataDic Dictionary中存的key value 是 String
    var dataDic = Dictionary<String,AnyObject>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
//        if(NSFileManager.defaultManager().fileExistsAtPath(path +  paths)){
//            loadData()
//        }else{
//            saveData()
//        }
        dateFormatter.timeStyle = .ShortStyle

        // Do any additional setup after loading the view.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    var dateTime:NSDate?
    var dateFormatter = NSDateFormatter()
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "Cell"
        let cell = AlarmListTableView.dequeueReusableCellWithIdentifier(cellIdentifier,forIndexPath: indexPath) as! UITableViewCell
        //cell上原本的textlabel和detailtextlabel，呼叫data Array中的dataDic的key
        cell.textLabel?.text = data[indexPath.row]["todo"] as? String
        dateFormatter.timeStyle = .ShortStyle
        dateTime = data[indexPath.row]["time"] as? NSDate
        cell.detailTextLabel?.text = dateFormatter.stringFromDate(dateTime!)
        
        //回傳value
        return cell
    }
    
    //呼叫myfunc
    func myfunc(controller: AddAlarmViewController, date: NSDate) {
        //設定dataDic中的key&value
        
        dataDic["time"] = date
        dataDic["todo"] = "寫日記"
        //將dataDic中的東西存入data Array
        data.append(dataDic)
        //將AlarmListTableView 重新載入
        self.AlarmListTableView.reloadData()
        //print出data
        println(data)
        //plist存成表格
       saveData()

    }
//    
//    var path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentationDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] as! String
//    let paths = "/data.plist"
    
    //存取設定的時間
    func saveData(){
        (data as NSArray).writeToFile( "/Users/shanluo/Desktop/tmp/data.plist", atomically: true)
//        path + paths
    }
    //讀取設定的時間
    func loadData(){
        data = NSArray(contentsOfFile: "/Users/shanluo/Desktop/tmp/data.plist") as! AnyObject as! Array<Dictionary<String,AnyObject>>
//        path + paths
    }
    //背吧！Segue傳值方式
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var vc = segue.destinationViewController as! AddAlarmViewController
        vc.delegate = self
        
    }
    //swipe to delete data
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            data.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            saveData()
        }
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
