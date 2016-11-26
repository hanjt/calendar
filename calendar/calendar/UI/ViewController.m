//
//  ViewController.m
//  calendar
//
//  Created by HanJiatong on 15/10/9.
//  Copyright (c) 2015年 HanJiatong. All rights reserved.
//

#import "ViewController.h"
#import "HJTCalendarView.h"

@interface ViewController () <HJTCalendarViewDelegate>

@property (nonatomic, strong) HJTCalendarView *calendar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)initUI {
    self.calendar = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([HJTCalendarView class]) owner:self options:nil].lastObject;
    self.calendar.delegate = self;
    [self.calendar showInView:self.view];
}

- (void)calendarView:(HJTCalendarView *)calendarView didSelectDate:(NSDate *)date {
    
}

@end
