//
//  CalculateModel.m
//  calendar
//
//  Created by Jiatong Han on 16/11/26.
//  Copyright © 2016年 HanJiatong. All rights reserved.
//

#import "CalculateModel.h"
#import "NSDate+convenience.h"
#import "NSDate+Addtion.h"
#import "NSDate+Helper.h"

@implementation CalculateModel

+ (NSIndexPath *)convertDateToIndexPath:(NSDate *)date {
    NSInteger month = [date month];
    NSInteger year = [date year] - 1901;
    NSInteger day = [date day];
    //日历的的起始日期的偏移量
    NSInteger offsetOfDayInSection = [date firstWeekDayInMonth];
    if (offsetOfDayInSection >= 7) {
        offsetOfDayInSection = 0;
    }
    return [NSIndexPath indexPathForRow:day + offsetOfDayInSection - 1 inSection:(year - 1) * 12 + month - 1];
}

+ (NSIndexPath *)scrollToFirstRowByDate:(NSDate *)date {
    NSInteger month = [date month];
    NSInteger year = [date year] - 1901;
    return [NSIndexPath indexPathForRow:0 inSection:(year - 1) * 12 + month - 1];
}

+ (NSDate *)convertIndexPathToDate:(NSIndexPath *)indexPath {
    NSInteger year = (indexPath.section) / 12 + 1901 + 1;
    NSInteger month = indexPath.section % 12 + 1;
    
    NSString *dataString = [NSString stringWithFormat:@"%ld-%ld", year, month];
    NSDate *date = [NSDate dateFromString:dataString withFormat:@"yyyy-MM"];
    NSInteger firstWeekDayInMonth = [date firstWeekDayInMonth];
    NSInteger numDaysInMonth = [date numDaysInMonth];
    
    //计算该cell的日期
    //默认日期从1号开始，根据偏移量计算真正的日期
    NSInteger day = 1;
    day += (indexPath.row - firstWeekDayInMonth);
    //如果日期大于这个月的最大日期，则月份加1
    if (day > numDaysInMonth) {
        day -= numDaysInMonth;
        month += 1;
        if (month > 12) {
            month = 1;
            year += 1;
        }
    }
    
    //当前cell的日期
    return [NSDate dateFromString:[NSString stringWithFormat:@"%ld-%ld-%ld",year, month, day] withFormat:@"yyyy-MM-dd"];
}

@end
