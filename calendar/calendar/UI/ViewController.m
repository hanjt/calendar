//
//  ViewController.m
//  calendar
//
//  Created by HanJiatong on 15/10/9.
//  Copyright (c) 2015年 HanJiatong. All rights reserved.
//

#import "ViewController.h"
#import "calendarCell.h"
#import "NSDate+convenience.h"
#import "NSDate+Addtion.h"

@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, retain) NSDate *scrollDate;
@property (nonatomic) CGFloat originOffsetY;        //collectionView起始位置
@property (weak, nonatomic) IBOutlet UILabel *dataLabel;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self.collectionView layoutIfNeeded];
    [self today];
}

- (void)initUI{
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([calendarCell class]) bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:NSStringFromClass([calendarCell class])];
}

-(void)today{
    
    NSDate *date = [NSDate date];
    
    self.scrollDate = date;
    
    self.dataLabel.text = [date dateToStringWithFormat:@"yyyy年M月"];

    NSInteger currentMonth = [date month];
    NSInteger currentYear = [date year] - 1901;
    NSIndexPath *currentIndex = [NSIndexPath indexPathForRow:0 inSection:(currentYear - 1) * 12 + currentMonth - 1];
    [self.collectionView scrollToItemAtIndexPath:currentIndex atScrollPosition:UICollectionViewScrollPositionTop animated:YES];
}

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
    calendarCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([calendarCell class]) forIndexPath:indexPath];
    cell.indexPath = indexPath;
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat itemWidth = ((self.collectionView.frame.size.width - 12) / 7.f);
    CGFloat itemHeight = ((int)self.collectionView.frame.size.height / 6.f);
    return CGSizeMake(itemWidth, itemHeight);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

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
