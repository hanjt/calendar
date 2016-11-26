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

- (void)showInView:(UIView *)view;

@end
