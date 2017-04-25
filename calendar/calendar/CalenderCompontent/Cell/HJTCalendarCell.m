//
//  HJTCalendarCell.m
//  calendar
//
//  Created by HanJiatong on 15/10/9.
//  Copyright (c) 2015年 HanJiatong. All rights reserved.
//

#import "HJTCalendarCell.h"
//#import "NSDate+Addtion.h"
#import "HJTCalendar.h"
#import "NSDate+convenience.h"
#import "CalculateModel.h"

@interface HJTCalendarCell ()

@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameOfDayLabel;
//@property (nonatomic, strong) NSDate *currentDate;
@property (nonatomic, strong) HJTCalendar *calendar;
@end

@implementation HJTCalendarCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.calendar = [[HJTCalendar alloc] init];
}

- (void)setIndexPath:(NSIndexPath *)indexPath {
    if ([indexPath isKindOfClass:[NSIndexPath class]] && _indexPath != indexPath) {
        _indexPath = indexPath;
    }
    [self updateUI];
}

- (void)cellForIndexPath:(NSIndexPath *)indexPath date:(NSDate *)date {
    
}

- (void)updateUI {
    HJTDateModel *model = [CalculateModel convertIndexPathToDate:self.indexPath];
    _willShowNextMonth = model.isNextMonth;
    self.numberLabel.hidden = model.date ? NO : YES;
    self.nameOfDayLabel.hidden = model.date ? NO : YES;

    if (model.date) {
        _selectDate = model.date;
        self.calendar.date = model.date;
        NSInteger day = [model.date day];
        //当前cell的日期
        self.numberLabel.text = @(day).stringValue;
        self.nameOfDayLabel.text = [self.calendar holidayName];
        [self changeLabelColorWithDate:model.date];
    }
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

- (void)setSelected:(BOOL)selected {
    self.backgroundColor = (!self.numberLabel.hidden && selected) ? [UIColor redColor] : [UIColor clearColor];
}



@end
