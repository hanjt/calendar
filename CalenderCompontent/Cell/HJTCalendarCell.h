//
//  HJTCalendarCell.h
//  calendar
//
//  Created by HanJiatong on 15/10/9.
//  Copyright (c) 2015年 HanJiatong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HJTCalendarCell : UICollectionViewCell

/** cell所在的indexPath，由此算出当前日期*/
@property (nonatomic, strong) NSIndexPath *indexPath;

- (void)cellForIndexPath:(NSIndexPath *)indexPath date:(NSDate *)date;
/** 返回当前选中的时间*/
@property (nonatomic, strong, readonly) NSDate *selectDate;
/** 是否显示下个月*/
@property (nonatomic, assign, readonly) BOOL willShowNextMonth;

@end
