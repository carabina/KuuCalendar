//
//  ViewController.swift
//  KuuCalendar
//
//  Created by kuu723 on 03/04/2017.
//  Copyright (c) 2017 kuu723. All rights reserved.
//

import UIKit
import KuuCalendar

class ViewController: UIViewController {
    
    @IBOutlet var kuuCalendar : KuuCalendar!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func actionPrevMonth ( _ sender : UIButton )
    {
        self.kuuCalendar.prevMonth()
    }
    
    @IBAction func actionNextMonth ( _ sender : UIButton )
    {
        self.kuuCalendar.nextMonth()
    }
}

