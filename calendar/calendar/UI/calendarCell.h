//
//  calendarCell.h
//  calendar
//
//  Created by HanJiatong on 15/10/9.
//  Copyright (c) 2015年 HanJiatong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface calendarCell : UICollectionViewCell

/** cell所在的indexPath，由此算出当前日期*/
@property (nonatomic, strong) NSIndexPath *indexPath;

@end
