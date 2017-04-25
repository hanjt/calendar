//
//  HJTCalendar.h
//  calendar
//
//  Created by Jiatong Han on 2017/4/25.
//  Copyright © 2017年 HanJiatong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HJTCalendar : NSObject

@property (nonatomic, strong) NSDate *date;
/**
 阳历节日
 */
@property (nonatomic, copy, readonly) NSString *holidayName;

@end
