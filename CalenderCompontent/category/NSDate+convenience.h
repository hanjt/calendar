//
//  NSDate+convenience.h
//
//  Created by in 't Veen Tjeerd on 4/23/12.
//  Copyright (c) 2012 Vurig Media. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Convenience)

-(NSDate *)offsetMonth:(NSInteger)numMonths;
-(NSDate *)offsetDay:(NSInteger)numDays;
-(NSDate *)offsetHours:(NSInteger)hours;
-(NSDate *)offsetMintues:(NSInteger)mintes;
-(NSInteger)numDaysInMonth;
-(NSInteger)firstWeekDayInMonth;
-(NSInteger)year;
-(NSInteger)month;
-(NSInteger)day;

+(NSDate *)dateStartOfDay:(NSDate *)date;
+(NSDate *)dateStartOfWeek;
+(NSDate *)dateEndOfWeek;

@end
