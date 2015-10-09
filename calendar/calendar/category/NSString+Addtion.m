//
//  NSString+Addtion.m
//  calendar
//
//  Created by HanJiatong on 15/10/9.
//  Copyright (c) 2015年 HanJiatong. All rights reserved.
//

#import "NSString+Addtion.h"

@implementation NSString (Addtion)

-(NSDate *)stringToDateWithDateFormat:(NSString *)dateFormat{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = dateFormat;
    return  [dateFormatter dateFromString:self];
}

@end
