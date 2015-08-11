//
//  ViewControllerEditProfile.swift
//  MyJournal
//
//  Created by Loshan on 2015/7/16.
//  Copyright (c) 2015年 com.loshan. All rights reserved.
//

import UIKit

class ViewControllerEditProfile: UIViewController, UITextFieldDelegate {

    @IBOutlet var user: UILabel!
    @IBOutlet var gender: UILabel!
    @IBOutlet var email: UILabel!
    @IBOutlet var password: UILabel!
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var genderField: UITextField!
    @IBOutlet var mailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    @IBOutlet var SubmitBtn: UIButton!
    @IBOutlet var showDtail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if (NSUserDefaults.standardUserDefaults().objectForKey("user") != nil) {
            nameField.text = NSUserDefaults.standardUserDefaults().objectForKey("user") as! String
        }else{
            nameField.placeholder = "username"
        }
        if (NSUserDefaults.standardUserDefaults().objectForKey("gender") != nil) {
            genderField.text = NSUserDefaults.standardUserDefaults().objectForKey("gender") as! String
        }else{
            genderField.placeholder = "male/female"
        }
        if (NSUserDefaults.standardUserDefaults().objectForKey("email") != nil) {
            mailField.text = NSUserDefaults.standardUserDefaults().objectForKey("email") as! String
        }else{
            mailField.placeholder = "e-mail address"
        }
        if(NSUserDefaults.standardUserDefaults().objectForKey("password") != nil) {
          passwordField.text = NSUserDefaults.standardUserDefaults().objectForKey("password") as! String
        }else{
           passwordField.placeholder = "type your password"
        }
        
//        showDtail.text = getCurrentTime()
        
        
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func submitBtnClick(sender: UIButton) {
        NSUserDefaults.standardUserDefaults().setObject(nameField.text, forKey: "user")
        NSUserDefaults.standardUserDefaults().setObject(genderField.text, forKey: "gender")
        NSUserDefaults.standardUserDefaults().setObject(mailField.text, forKey: "email")
        NSUserDefaults.standardUserDefaults().setObject(passwordField.text, forKey: "password")
        NSUserDefaults.standardUserDefaults().synchronize()
 
//        showDtail.text = nameField.text + genderField.text + mailField.text + passwordField.text
    }
    
//    func getCurrentTime() -> String {
//        let date = NSDate()
//        let formatter = NSDateFormatter()
//        formatter.timeStyle = .MediumStyle
//        formatter.dateStyle = .MediumStyle
//        var stringValue = formatter.stringFromDate(date)
//        return stringValue
//    }
    
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
