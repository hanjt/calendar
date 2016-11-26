//
//  HLTCalendarView.m
//  calendar
//
//  Created by Jiatong Han on 16/11/26.
//  Copyright © 2016年 HanJiatong. All rights reserved.
//

//每一个月是一个section，根据indexPath计算每个cell的实际日期

#import "HLTCalendarView.h"
#import "HLTCalendarCell.h"
#import "NSDate+convenience.h"
#import "NSDate+Addtion.h"

@interface HLTCalendarView () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, retain) NSDate *scrollDate;
@property (nonatomic) CGFloat originOffsetY;        //collectionView起始位置
@property (weak, nonatomic) IBOutlet UILabel *dataLabel;
//@property (nonatomic, strong) NSIndexPath *selectedIndexPath;

@end

@implementation HLTCalendarView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self initUI];
    [self.collectionView layoutIfNeeded];
    [self today];
}

- (void)initUI{
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([HLTCalendarCell class]) bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:NSStringFromClass([HLTCalendarCell class])];
}

-(void)today{
    
    NSDate *date = [NSDate date];
    
    self.scrollDate = date;
    
    self.dataLabel.text = [date dateToStringWithFormat:@"yyyy年M月"];
    
    NSInteger currentMonth = [date month];
    NSInteger currentYear = [date year] - 1901;
//    NSIndexPath *currentIndex = [NSIndexPath indexPathForRow:0 inSection:(currentYear - 1) * 12 + currentMonth - 1];
    NSIndexPath *currentIndex = [NSIndexPath indexPathForRow:0 inSection:0];

    [self.collectionView scrollToItemAtIndexPath:currentIndex atScrollPosition:UICollectionViewScrollPositionTop animated:YES];
}

- (void)showInView:(UIView *)view {
    CGFloat height = (CGRectGetWidth(view.bounds) - CGRectGetMinX(self.collectionView.bounds) * 2) * 6 / 7 + self.collectionView.frame.origin.y;
    self.frame = CGRectMake(0, 20, CGRectGetWidth(view.bounds), height);
    [view addSubview:self];
}

#pragma mark UICollectionView DataSource & Delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    // 150 一年是一个section，一共150年
    // 12 12个月
    return 150 * 12;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    // 42 一个月中一共有42个方格 7 * 6 （一周7天 * 因为日期偏移，所以需要6行)
    return 42;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HLTCalendarCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([HLTCalendarCell class]) forIndexPath:indexPath];
    cell.indexPath = indexPath;
//    cell.selected = (self.selectedIndexPath == indexPath);
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat itemWidth = (self.collectionView.frame.size.width - 12) / 7.f;
    CGFloat itemHeight = self.collectionView.frame.size.height / 6.f;
    return CGSizeMake(itemWidth, itemHeight);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    self.selectedIndexPath = indexPath;
//    [collectionView reloadData];
//    UICollectionViewCell *cell = [self collectionView:collectionView cellForItemAtIndexPath:indexPath];
//    if ([cell isKindOfClass:[HLTCalendarCell class]]) {
//        if ([self.delegate respondsToSelector:@selector(calendarView:didSelectDate:)]) {
//            [self.delegate calendarView:self didSelectDate:((HLTCalendarCell *)cell).currentDate];
//        }
//    }
}

#pragma mark ScrollView Delegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    int offset = (int)((scrollView.contentOffset.y - self.originOffsetY) / self.collectionView.frame.size.height);
    self.scrollDate = [self.scrollDate offsetMonth:offset];
    self.originOffsetY = scrollView.contentOffset.y;
    self.dataLabel.text = [self.scrollDate dateToStringWithFormat:@"yyyy年M月"];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    if (self.scrollDate) {
        self.originOffsetY = self.collectionView.contentOffset.y;
    }
}

-(BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView{
    return NO;
}

@end
