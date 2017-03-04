//
//  KuuDayView.swift
//  KuuCalendar
//
//  Created by kuu723 on 2017. 3. 4..
//  Copyright © 2017년 kuu. All rights reserved.
//

import UIKit

class KuuDayView: UIView
{
    var lbDay : UILabel = UILabel()
    
    
    init ( frame : CGRect, day : Int )
    {
        super.init(frame: frame)
        
        self.lbDay.frame = self.bounds
        self.lbDay.textAlignment = .center
        self.lbDay.text = String(day)
        self.lbDay.font = self.lbDay.font.withSize(self.bounds.height*0.7)
        
        self.addSubview(self.lbDay)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }
    
    
}
