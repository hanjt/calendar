//
//  HJTCalendarCell.m
//  calendar
//
//  Created by HanJiatong on 15/10/9.
//  Copyright (c) 2015年 HanJiatong. All rights reserved.
//

#import "HJTCalendarCell.h"
#import "NSDate+Addtion.h"
#import "NSDate+convenience.h"
#import "CalculateModel.h"

@interface HJTCalendarCell ()

@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameOfDayLabel;
//@property (nonatomic, strong) NSDate *currentDate;

@end

@implementation HJTCalendarCell

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

- (void)cellForIndexPath:(NSIndexPath *)indexPath date:(NSDate *)date {
    
}

- (void)updateUI {
    _selectDate = [CalculateModel convertIndexPathToDate:self.indexPath];
    NSInteger day = [_selectDate day];
    self.numberLabel.hidden = (day <= 0);
    self.nameOfDayLabel.hidden = (day <= 0);
    
    //当前cell的日期
    self.numberLabel.text = @(day).stringValue;
    self.nameOfDayLabel.text = [_selectDate holidayName];
    [self changeLabelColorWithDate:_selectDate];
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
