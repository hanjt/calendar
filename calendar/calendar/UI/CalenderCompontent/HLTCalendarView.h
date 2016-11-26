//
//  HLTCalendarView.h
//  calendar
//
//  Created by Jiatong Han on 16/11/26.
//  Copyright © 2016年 HanJiatong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HLTCalendarView;

@protocol HLTCalendarViewDelegate <NSObject>

@optional

- (void)calendarView:(HLTCalendarView *)calendarView didSelectDate:(NSDate *)date;

@end

@interface HLTCalendarView : UIView

@property (nonatomic, weak) id <HLTCalendarViewDelegate> delegate;

- (void)showInView:(UIView *)view;

@end
