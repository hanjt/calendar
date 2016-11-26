//
//  ViewController.m
//  calendar
//
//  Created by HanJiatong on 15/10/9.
//  Copyright (c) 2015年 HanJiatong. All rights reserved.
//

#import "ViewController.h"
#import "HLTCalendarView.h"

@interface ViewController () <HLTCalendarViewDelegate>

@property (nonatomic, strong) HLTCalendarView *calendar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)initUI {
    self.calendar = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([HLTCalendarView class]) owner:self options:nil].lastObject;
    self.calendar.delegate = self;
    [self.calendar showInView:self.view];
}

- (void)calendarView:(HLTCalendarView *)calendarView didSelectDate:(NSDate *)date {
    
}

@end
