//
//  NSDate+Addtion.m
//  calendar
//
//  Created by HanJiatong on 15/10/9.
//  Copyright (c) 2015年 HanJiatong. All rights reserved.
//

#import "NSDate+Addtion.h"

@implementation NSDate (Addtion)

-(NSString *)nameOfDay{
    NSArray *array = [[NSArray alloc] initWithObjects:@"初一", @"初二",@"初三",@"初四",@"初五",@"初六",@"初七",@"初八",@"初九",@"初十",@"十一",@"十二",@"十三",@"十四",@"十五",@"十六",@"十七",@"十八",@"十九",@"二十",@"廿一",@"廿二",@"廿三",@"廿四",@"廿五",@"廿六",@"廿七",@"廿八",@"廿九",@"三十",nil];
    NSInteger day = [self calendarFromDate];
    return (day==1)?[self nameOfMonth]:[array objectAtIndex:(day-1)];
}

-(NSInteger)calendarFromDate{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    
    NSDateComponents *weekdayComponents = [gregorian components:NSCalendarUnitDay fromDate:self];
    return [weekdayComponents day];
}

-(NSString *)nameOfMonth{
    NSArray *array = [[NSArray alloc] initWithObjects:@"正月", @"二月",@"三月",@"四月",@"五月",@"六月",@"七月",@"八月",@"九月",@"十月",@"十一月",@"腊月",nil];
    NSInteger month = [self monthOfLunar];
    
    return  [NSString stringWithFormat:@"%@%@",([self isLeapMonth])?@"润":@"",[array objectAtIndex:(month - 1)]];
}

#pragma mark- 农历月份
-(NSInteger)monthOfLunar{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    
    NSDateComponents *weekdayComponents = [gregorian components:NSCalendarUnitMonth fromDate:self];
    return [weekdayComponents month];
}

-(BOOL)isLeapMonth{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    
    NSDateComponents *nowComponents = [gregorian components:NSCalendarUnitMonth fromDate:self];
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setMonth:-1];
    NSDate *monthAgo = [gregorian dateByAddingComponents:offsetComponents
                                                  toDate:self options:0];
    
    NSDateComponents *monthAgoComponents = [gregorian components:NSCalendarUnitMonth fromDate:monthAgo];
    return ([nowComponents month] == [monthAgoComponents month]) ?YES:NO;
}

//阳历节日
- (NSString *)holidayName{
    /** 
     不显示阳历日期
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *weekdayComponents = [gregorian components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitWeekOfMonth | NSCalendarUnitWeekdayOrdinal) fromDate:self];
    NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:@"元旦",@"1-1",@"湿地日",@"2-2",@"情人节",@"2-14",@"爱耳日",@"3-3",@"青服日",@"3-5",
                                
                                @"妇女节",@"3-8",@"护河日",@"3-9",@"植树节",@"3-12",
                                
                                @"警察日",@"3-14",@"消权日",@"3-15",@"睡眠日",@"3-21",
                                
                                @"水日",@"3-22",@"结核日",@"3-24",@"愚人节",@"4-1",
                                
                                @"卫生日",@"4-7",@"地球日",@"4-22",@"产权日",@"4-26",
                                
                                @"劳动节",@"5-1",@"哮喘日",@"5-3",@"青年节",@"5-4",
                                
                                @"红十日",@"5-8",@"护士节",@"5-12",@"家庭日",@"5-15",
                                
                                @"电信日",@"5-17",@"营养日",@"5-20",@"无烟日",@"5-31",
                                
                                @"儿童节",@"6-1",@"环境日",@"6-5",@"爱眼日",@"6-6",
                                
                                @"防沙日",@"6-17",@"奥匹日",@"6-23",@"土地日",@"6-25",
                                
                                @"禁毒日",@"6-26",@"党生日",@"7-1",@"抗战日",@"7-7",
                                
                                @"人口日",@"7-11",@"建军节",@"8-1",@"青年节",@"8-12",
                                
                                @"扫盲日",@"9-8",@"教师节",@"9-10",@"臭氧日",@"9-16",
                                
                                @"爱牙日",@"9-20",@"停火日",@"9-21",@"旅游日",@"9-27",
                                
                                @"国庆节",@"10-1",@"动物日",@"10-4",@"教师日",@"10-5",
                                
                                @"高压日",@"10-8",@"邮政日",@"10-9",@"精神日",@"10-10",
                                
                                @"标准日",@"10-14",@"盲人节",@"10-15",@"粮食日",@"10-16",
                                
                                @"除贫日",@"10-17",@"新闻日",@"10-24",@"健康日",@"10-28",
                                
                                @"多样日",@"10-29",@"万圣节",@"10-31",@"记者节",@"11-8",
                                
                                @"消防日",@"11-9",@"糖尿日",@"11-14",@"学生节",@"11-17",
                                
                                @"除暴日",@"11-25",@"艾滋日",@"12-1",@"残疾日",@"12-3",
                                
                                @"法制日",@"12-4",@"足球日",@"12-9",@"平安夜",@"12-24",
                                
                                @"圣诞节",@"12-25",@"生物日",@"12-29",nil];
    NSString *holidayName = [dictionary objectForKey:[NSString stringWithFormat:@"%ld-%ld",(long)[weekdayComponents month],(long)[weekdayComponents day]]];
    
    switch ([holidayName length]) {
        case 0:
            switch ([weekdayComponents month]) {
                case 1:
                {
                    if (([weekdayComponents weekday] == 1) && ((31 - [weekdayComponents day] )< 7) ){
                        return @"麻风节";
                    }
                }
                    break;
                case 5:
                {
                    if (([weekdayComponents weekdayOrdinal] == 2) && ([weekdayComponents weekday] == 1)) {
                        return @"母亲节";
                    }
                    else if (([weekdayComponents weekdayOrdinal] == 3) && ([weekdayComponents weekday] == 1)) {
                        return @"助残日";
                    }
                }
                    break;
                case 6:
                {
                    if (([weekdayComponents weekdayOrdinal] == 3) && ([weekdayComponents weekday] == 1)) {
                        return @"父亲节";
                    }
                    
                }
                    break;
                case 9:
                {
                    if (([weekdayComponents weekdayOrdinal] == 3) && ([weekdayComponents weekday] == 3)) {
                        return @"和平日";
                    }
                    else if (([weekdayComponents weekdayOrdinal] == 3) && ([weekdayComponents weekday] == 6)) {
                        return @"国教日";
                    }
                    else if (([weekdayComponents weekdayOrdinal] == 4) && ([weekdayComponents weekday] == 1)) {
                        return @"聋人节";
                    }
                }
                    break;
                case 10:
                {
                    if (([weekdayComponents weekdayOrdinal] == 1) && ([weekdayComponents weekday] == 2)) {
                        return @"住房日";
                    }
                    else if (([weekdayComponents weekdayOrdinal] == 2) && ([weekdayComponents weekday] == 2)) {
                        return @"感恩节";
                    }
                    else if (([weekdayComponents weekdayOrdinal] == 2) && ([weekdayComponents weekday] == 4)) {
                        return @"减灾日";
                    }
                    else if (([weekdayComponents weekdayOrdinal] == 2) && ([weekdayComponents weekday] == 5)) {
                        return @"爱眼日";
                    }
                }
                    break;
                case 11:
                {
                    if (([weekdayComponents weekday] == 5) && ((30 - [weekdayComponents day] )< 7)){
                        return @"感恩节";
                    }
                }
                    break;
                default:
                    break;
            }
            break;
            
        default:
            return holidayName;
            break;
    }
     */
    return [self nameOfDay];
}


@end
