//
//  CalculateModel.h
//  calendar
//
//  Created by Jiatong Han on 16/11/26.
//  Copyright © 2016年 HanJiatong. All rights reserved.
//

#import <UIKit/UIKit.h>

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
+ (NSDate *)convertIndexPathToDate:(NSIndexPath *)indexPath;

@end
