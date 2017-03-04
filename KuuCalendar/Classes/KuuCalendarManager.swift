//
//  KuuCalendarManager.swift
//  KuuCalendar
//
//  Created by kuu723 on 2017. 3. 4..
//  Copyright © 2017년 kuu. All rights reserved.
//

import UIKit

public class KuuCalendarManager: NSObject
{
    static public let shared : KuuCalendarManager = KuuCalendarManager()
    
    private let calendar : Calendar = Calendar(identifier: .gregorian)
    private let date : Date = Date()
    
    // MARK: -
    // * 오늘 날짜/시간을 알 수 있음.
    public func getNowDate ( format : String ) -> String
    {
        let nowDate = self.calendar.dateComponents(in: TimeZone.current, from: self.date)
        
        guard let date = nowDate.date else {
            return "Wrong Format type."
        }
        
        return self.dateFormatter(format: format, date: date)
    }
    
    // MARK: -
    // - 해당 월의 시작 요일과 총 일수.
    public func getStartWeekFromMonth ( _ month : Int , year : Int , _ isStartMonDay : Bool = false ) -> MonthData
    {
        guard let gregorian = NSCalendar(calendarIdentifier: .gregorian) else
        {
            fatalError("Not Found gregorian")
        }
        
        
        let components = NSDateComponents()
        components.day = 1
        components.month = month
        components.year = year
        
        let calendar = NSCalendar.current
        let newDate = calendar.date(from: components as DateComponents)!
        let startWeek = gregorian.component(.weekday, from: newDate)
        
        let totalDays = self.getMonthTotalDays(year: year, month: month)
        
        return MonthData(startWeek: isStartMonDay ? startWeek - 2 : startWeek - 1, // true : false
                         totalDays: totalDays)
    }
    
    // - 한달 총 일수.
    fileprivate func getMonthTotalDays ( year : Int, month : Int) -> Int
    {
        
        let components = NSDateComponents()
        components.day = 1
        components.month = month
        components.year = year
        
        
        let calendar = NSCalendar.current
        let newDate = calendar.date(from: components as DateComponents)!
        
        guard let range = calendar.range(of:.day, in: .month, for: newDate) else {
            fatalError("Not found calendar Range!")
        }
        
        return range.count
    }
    
    // MARK: -
    // MARK: Get YEAR, MONTH, DAY, WEEK
    // - 오늘 년정보.
    public func getNowYear () -> Int
    {
        let nowDate = self.calendar.dateComponents(in: TimeZone.current, from: self.date)
        
        guard let year = nowDate.year else {
            return 0
        }
        return year
    }
    
    // - 오늘 년정보2. ex) 2017 -> 20, 17
    public func getNowHalfYear () -> YearHalf
    {
        let nowDate = self.calendar.dateComponents(in: TimeZone.current, from: self.date)
        
        guard let year = nowDate.year else {
            return YearHalf(firstYear: "0", lastYear: "0")
        }
        
        let strYear = String(year)
        
        let firstStartIndex = strYear.index(strYear.startIndex, offsetBy: 0)
        let firstEndIndex = strYear.index(strYear.startIndex, offsetBy: 1)
        
        let lastStartIndex = strYear.index(strYear.startIndex, offsetBy: 2)
        let lastEndIndex = strYear.index(strYear.startIndex, offsetBy: 3)
        
        let firstString = strYear[firstStartIndex...firstEndIndex]
        let lastString = strYear[lastStartIndex...lastEndIndex]
        
        return YearHalf(firstYear: firstString, lastYear: lastString)
    }
    
    // - 오늘 월
    public func getNowMonth () -> Int
    {
        let nowDate = self.calendar.dateComponents(in: TimeZone.current, from: self.date)
        
        guard let month = nowDate.month else {
            return 0
        }
        return month
    }
    
    // - 오늘 일
    public func getNowDay () -> Int
    {
        let nowDate = self.calendar.dateComponents(in: TimeZone.current, from: self.date)
        
        guard let day = nowDate.day else {
            return 0
        }
        return day
    }
    
    // - 오늘 요일.
    public func getNowWeekDay () -> Int
    {
        let nowDate = self.calendar.dateComponents(in: TimeZone.current, from: self.date)
        
        guard let weekday = nowDate.weekday else {
            return 0
        }
        return weekday
    }
    
    // MARK: -
    // - 날짜 포맷터.
    fileprivate func dateFormatter ( format : String , date : Date ) -> String
    {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        
        return formatter.string(from: date)
    }
}
