//
//  AddAlarmViewController.swift
//  MyJournal
//
//  Created by Loshan on 2015/7/27.
//  Copyright (c) 2015年 com.loshan. All rights reserved.
//

import UIKit

//send data delegate protocal
protocol mydelegate{
    //function
    func myfunc(controller:AddAlarmViewController,date : NSDate)
}

class AddAlarmViewController: UIViewController, UINavigationControllerDelegate {

    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var showTime: UILabel!
    //new variable 型別為 mydelegate
    var delegate : mydelegate? = nil //?
    
    var dateFormatter = NSDateFormatter()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        datePicker.datePickerMode = UIDatePickerMode.Time
//        datePicker.locale = NSLocale(localeIdentifier: "zh_TW")
        datePicker.date = NSDate()
        dateFormatter.timeStyle = .ShortStyle
        showTime.text = dateFormatter.stringFromDate(datePicker.date)
        shownoti()
        

        
    }
    
    func shownoti(){
        var noti = UILocalNotification()
        noti.alertAction = "open"
        noti.alertTitle = "My Journal Notification"
        noti.alertBody = "時間到了，該寫日記囉!"
        noti.fireDate = datePicker.date
        noti.repeatInterval = NSCalendarUnit.CalendarUnitDay
        UIApplication.sharedApplication().scheduleLocalNotification(noti)
    }
   
  
    @IBAction func ClickAlarm(sender: UIDatePicker) {
        showTime.text = dateFormatter.stringFromDate(datePicker.date)
    }
    
    
    @IBAction func saveAlarm(sender: UIButton) {
        //呼叫myfunc 傳值
        delegate?.myfunc(self, date: datePicker.date)
        //按完button後跳回到上一頁
        navigationController?.popViewControllerAnimated(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
