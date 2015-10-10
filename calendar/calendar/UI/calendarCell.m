//
//  calendarCell.m
//  calendar
//
//  Created by HanJiatong on 15/10/9.
//  Copyright (c) 2015年 HanJiatong. All rights reserved.
//

#import "calendarCell.h"
#import "NSString+Addtion.h"
#import "NSDate+Addtion.h"

#define kSecondOfDay  (24*60*60)

@interface calendarCell ()
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (nonatomic, assign) NSInteger year;
@property (nonatomic, assign) NSInteger month;
@property (nonatomic) NSInteger firstWeekDay;
@property (nonatomic) NSInteger currentMonthDay;

@end

@implementation calendarCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setDateWithIndex:(NSIndexPath *)indexPath{
    NSInteger offsetItem = indexPath.item / 42;
    NSInteger day = indexPath.item % 42;
    self.year = offsetItem / 12 + 1901;
    self.month = offsetItem % 12 + 1;
    NSDate *date = [[NSString stringWithFormat:@"%ld-%ld-01",(long)self.year, (long)self.month] stringToDateWithDateFormat:@"yyyy-M-dd"];
    
    day -= [date firstWeekOfMonth];
    (day >= 0)?[self haveContentInItem:day date:date]:[self notHaveContentInItem];
}

-(void)haveContentInItem:(NSInteger)day date:(NSDate *)date{
    
    NSDate *offsetDate = [NSDate dateWithTimeInterval:day*kSecondOfDay sinceDate:date];
    day += 1;
    self.currentMonthDay = day - [self dayInMonth:self.month year:self.year];
    (self.currentMonthDay <= 0)?[self thisMonth:day date:offsetDate]:[self nextMonth:offsetDate];
}

-(NSInteger)dayInMonth:(NSInteger)month year:(NSInteger)year{
    switch (month) {
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:
            return 31;
            break;
        case 4:
        case 6:
        case 9:
        case 11:
            return 30;
            break;
        case 2:
            if (((year%4 == 0) && (year % 100 != 0)) || (year % 400 == 0)) {
                return 29;
            }
            else
                return 28;
            break;
        default:
            return 0;
            break;
    }
    
}


-(void)thisMonth:(NSInteger)day date:(NSDate *)offsetDate{
    UIColor *color = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
    //判断是前一个月份则颜色淡些
    if ([offsetDate compare:[NSDate date]] == NSOrderedAscending) {
        color = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.4];
    }
    self.numberLabel.textColor = color;
    self.numberLabel.text = [NSString stringWithFormat:@"%ld",(long)day];

}

-(UIColor *)agoDayColor:(NSDate *)offsetDate{
    return [UIColor colorWithRed:1 green:1 blue:1 alpha:((int)([offsetDate timeIntervalSinceDate:[NSDate date]]/kSecondOfDay) >= 0)?1.0:0.4];
}

-(void)nextMonth:(NSDate *)offsetDate{
    self.numberLabel.text = [NSString stringWithFormat:@"%ld",(long)self.currentMonthDay];
    
    UIColor *color = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.4];
    self.numberLabel.textColor = color;
}

-(void)notHaveContentInItem{
    self.numberLabel.text = @"";
}

@end
