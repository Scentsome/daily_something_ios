//
//  ViewController.swift
//  Daily_Something
//
//  Created by mac on 2015/8/11.
//  Copyright (c) 2015年 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var name = "Michael"
    @IBOutlet var titleName: UILabel!
    @IBOutlet var calendarButton: UIButton!
    @IBOutlet var settings: UIButton!
    @IBOutlet var timeLine: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleName.font = UIFont.boldSystemFontOfSize(24.0)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

