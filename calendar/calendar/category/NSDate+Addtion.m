//
//  NSDate+Addtion.m
//  calendar
//
//  Created by HanJiatong on 15/10/9.
//  Copyright (c) 2015年 HanJiatong. All rights reserved.
//

#import "NSDate+Addtion.h"

@implementation NSDate (Addtion)

-(NSInteger)firstWeekOfMonth{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateComponents *weekdayComponents = [gregorian components:NSCalendarUnitWeekday fromDate:self];
    return [weekdayComponents weekday]-1;
}

-(NSString *)dateToStringWithFormat:(NSString *)format{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = format;
    return  [dateFormatter stringFromDate:self];
}


@end
