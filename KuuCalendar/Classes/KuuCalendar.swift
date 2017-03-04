//
//  KuuCalendar.swift
//  KuuCalendar
//
//  Created by kuu723 on 2017. 3. 4..
//  Copyright © 2017년 kuu. All rights reserved.
//

import UIKit


public class KuuCalendar: UIView
{
    
    // - 사용 시 outlet 연결.
    @IBOutlet var lbYear : UILabel?
    @IBOutlet var lbMonth : UILabel?
    @IBOutlet var weekView : UIView?
    @IBOutlet var daysView : UIView?
    
    // - 오늘 날짜.
    let nowYear = KuuCalendarManager.shared.getNowYear()
    let nowMonth = KuuCalendarManager.shared.getNowMonth()
    let nowDay = KuuCalendarManager.shared.getNowDay()
    
    // - 이동 날짜.
    var year = 0
    var month = 0
    
    
    fileprivate func initWithView ()
    {
        self.year = self.nowYear
        self.month = self.nowMonth
    }
    
    override public func draw(_ rect: CGRect)
    {
        if let weekView = self.weekView
        {
            let weekNames = EngWeekName().week
            self.weekSetup(weekView, weekNames: weekNames)
            
        }
        
        // - setup today
        self.calenderSetup ()
    }
    
    fileprivate func calenderSetup ()
    {
        if let lbYear = self.lbYear
        {
            
            lbYear.text = String(self.year)
        }
        
        if let lbMonth = self.lbMonth
        {
            
            lbMonth.text = String(self.month)
        }
        
        
        if let dayView = self.daysView
        {
            let monthData = KuuCalendarManager.shared.getStartWeekFromMonth(self.month, year: self.year)
            self.daysSetup(dayView, dayData: monthData)
        }
        
        
    }
    
    public func prevMonth ()
    {
        self.month = self.month - 1
        
        if self.month < 1
        {
            self.month = 12
            self.year = self.year - 1
        }
        
        self.calenderSetup ()
    }
    
    public func nextMonth ()
    {
        self.month = self.month + 1
        
        if self.month > 12
        {
            self.month = 1
            self.year = self.year + 1
        }
        
        self.calenderSetup ()
    }
    
    // MARK: - setup
    fileprivate func weekSetup ( _ view : UIView , weekNames : [String] )
    {
        let weekWidth = CGFloat (view.bounds.width / 7)
        let weekFrame = CGSize(width: weekWidth, height: view.bounds.height)
        
        for index in 0...6
        {
            let point = CGPoint(x: CGFloat(weekWidth) * CGFloat(index % 7 ), y: 0)
            let lbWeek = UILabel(frame: CGRect(origin: point, size: weekFrame))
            //lbWeek.adjustsFontSizeToFitWidth = true
            lbWeek.font = lbWeek.font.withSize(view.bounds.height/2)
            lbWeek.text = weekNames[index]
            lbWeek.textAlignment = .center
            view.addSubview(lbWeek)
        }
    }
    
    fileprivate func daysSetup ( _ view : UIView , dayData : MonthData )
    {
        for days in view.subviews
        {
            days.removeFromSuperview()
        }
        
        let monthTotal = (dayData.totalDays + dayData.startWeek)
        let weekLine = ( monthTotal / 6 )
        let dayWidth : Int = Int (view.bounds.width / 7)
        let dayheight : Int = Int (view.bounds.height / CGFloat(weekLine))
        let dayFrame = CGSize(width: dayWidth, height: dayheight)
        
        for index in 0..<monthTotal
        {
            let day = index - dayData.startWeek
            if day >= 0
            {
                let point = CGPoint(x: CGFloat(dayWidth) * CGFloat(index % 7 ), y: CGFloat(dayheight) * CGFloat(index / 7))
                let dayView = KuuDayView(frame: CGRect(origin: point, size: dayFrame), day: day+1)
                view.addSubview(dayView)
            }
        }
    }
    
    
    // MARK: - View Init
    override init (frame : CGRect)
    {
        super.init(frame: frame)
        
        initWithView ()
    }
    
    required public init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
        initWithView ()
    }
    
}
