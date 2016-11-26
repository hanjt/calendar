//
//  HLTCalendarCell.m
//  calendar
//
//  Created by HanJiatong on 15/10/9.
//  Copyright (c) 2015年 HanJiatong. All rights reserved.
//

#import "HLTCalendarCell.h"
#import "NSDate+Addtion.h"
#import "NSDate+convenience.h"
#import "NSDate+Helper.h"

@interface HLTCalendarCell ()

@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameOfDayLabel;
//@property (nonatomic, strong) NSDate *currentDate;

@end

@implementation HLTCalendarCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setIndexPath:(NSIndexPath *)indexPath {
    if ([indexPath isKindOfClass:[NSIndexPath class]] && _indexPath != indexPath) {
        _indexPath = indexPath;
    }
    [self updateUI];
}

- (void)updateUI {
    //计算该cell的年月
    NSInteger year = (self.indexPath.section) / 12 + 1901 + 1;
    NSInteger month = self.indexPath.section % 12 + 1;
    
    NSString *dataString = [NSString stringWithFormat:@"%ld-%ld", year, month];
    NSDate *date = [NSDate dateFromString:dataString withFormat:@"yyyy-MM"];
    
    NSInteger firstWeekDayInMonth = [date firstWeekOfMonth];
    NSInteger numDaysInMonth = [date numDaysInMonth];
    
    //计算该cell的日期
    //默认日期从1号开始，根据偏移量计算真正的日期
    NSInteger day = 1;
    day += (self.indexPath.row - firstWeekDayInMonth);
    self.numberLabel.hidden = (day <= 0);
    self.nameOfDayLabel.hidden = (day <= 0);
    //如果日期大于这个月的最大日期，则月份加1
    if (day > numDaysInMonth) {
        day -= numDaysInMonth;
        month += 1;
    }
    //当前cell的日期

    _currentDate = [NSDate dateFromString:[NSString stringWithFormat:@"%ld-%ld-%ld",year, month, day] withFormat:@"yyyy-MM-dd"];
    self.numberLabel.text = @(day).stringValue;
    self.nameOfDayLabel.text = [_currentDate holidayName];
    [self changeLabelColorWithDate:_currentDate];
}

- (void)changeLabelColorWithDate:(NSDate *)date {
    if (!date) {
        return;
    }
    if ([date compare:[NSDate date]] == NSOrderedAscending) {
        self.numberLabel.textColor = [UIColor purpleColor];
        self.nameOfDayLabel.textColor = [UIColor purpleColor];
    } else {
        self.numberLabel.textColor = [UIColor darkTextColor];
        self.nameOfDayLabel.textColor = [UIColor darkTextColor];
    }
}

//- (void)setSelected:(BOOL)selected {
//    self.backgroundColor = selected ? [UIColor redColor] : [UIColor clearColor];
//}

@end
