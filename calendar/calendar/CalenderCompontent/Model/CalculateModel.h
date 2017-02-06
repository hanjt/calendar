//
//  CalculateModel.h
//  calendar
//
//  Created by Jiatong Han on 16/11/26.
//  Copyright © 2016年 HanJiatong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HJTDateModel;

@interface CalculateModel : NSObject

/** 
    计算日期所在的indexPath
 */
+ (NSIndexPath *)convertDateToIndexPath:(NSDate *)date;

/** 
    根据日期滚动到当月第一天
 */
+ (NSIndexPath *)scrollToFirstRowByDate:(NSDate *)date;

/**
    根据indexPath计算当前日期
 */
+ (HJTDateModel *)convertIndexPathToDate:(NSIndexPath *)indexPath;

@end

@interface HJTDateModel : NSObject

/** indexPath中的日期，格式为YYYY-MM-dd*/
@property (nonatomic, strong) NSDate *date;

/** indexPath中的日期是不是下个月的日期*/
@property (nonatomic, assign) BOOL isNextMonth;

@end
