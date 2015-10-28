//
//  NSDate+Addtion.h
//  calendar
//
//  Created by HanJiatong on 15/10/9.
//  Copyright (c) 2015年 HanJiatong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Addtion)

-(NSInteger)firstWeekOfMonth;

-(NSString *)dateToStringWithFormat:(NSString *)format;

//阳历节日
- (NSString *)holidayName;

@end
