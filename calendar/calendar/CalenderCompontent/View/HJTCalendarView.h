//
//  HJTCalendarView.h
//  calendar
//
//  Created by Jiatong Han on 16/11/26.
//  Copyright © 2016年 HanJiatong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HJTCalendarView;

@protocol HJTCalendarViewDelegate <NSObject>

@optional

- (void)calendarView:(HJTCalendarView *)calendarView didSelectDate:(NSDate *)date;

@end

@interface HJTCalendarView : UIView

@property (nonatomic, weak) id <HJTCalendarViewDelegate> delegate;

/** 
    控件的内间距
    日历控件的比例是7:6，所以bottom不起作用，默认固底显示
 */
@property (nonatomic, assign) UIEdgeInsets contentInsert;

/** 
    日历控件的高度
 */
@property (nonatomic, assign, readonly) CGRect calendarFrame;
- (void)showInView:(UIView *)view;

@end
