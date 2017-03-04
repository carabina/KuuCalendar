//
//  KuuCalendarStructs.swift
//  KuuCalendar
//
//  Created by kuu723 on 2017. 3. 4..
//  Copyright © 2017년 kuu. All rights reserved.
//

// - 월 정보.
// - 시작 요일, 전체 날짜 갯수
public struct MonthData
{
    var startWeek : Int
    var totalDays : Int
}

// - 년 정보.
// - 앞자리 두자와 뒷자리 두자. ex) 2017 -> 20, 17
public struct YearHalf
{
    var firstYear : String
    var lastYear : String
}


// - 요일 정보.
enum WeekType {
    case eng
    case kor
    case ch
}

// - 요일 이름
protocol WeekName
{
    var week : [String] { get }
    var diffWeek : [String] { get }
}

struct EngWeekName : WeekName
{
    var week: [String] = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    var diffWeek: [String] = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sun"]
}

struct KorWeekName : WeekName
{
    var week: [String] = ["일", "월", "화", "수", "목", "금", "토"]
    var diffWeek: [String] = ["월", "화", "수", "목", "금", "토", "일"]
}

struct ChWeekName : WeekName
{
    var week: [String] = ["日", "月", "火", "水", "木", "金", "土"]
    var diffWeek: [String] = ["月", "火", "水", "木", "金", "土", "日"]
}
