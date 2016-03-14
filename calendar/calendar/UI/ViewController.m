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

static NSString *identifier = @"calendarCell";

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
    [self today];
}

- (void)initUI{
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.collectionView registerNib:[UINib nibWithNibName:identifier bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:identifier];
}

-(void)today{
    
    NSDate *date = [NSDate date];
    
    self.scrollDate = date;
    
    self.dataLabel.text = [date dateToStringWithFormat:@"yyyy年M月"];
    NSInteger currentPage = ([date year] - 1901) * 12 + [date month] - 1;
    
    NSIndexPath *mid_index = [NSIndexPath indexPathForItem: currentPage * 42 inSection:0];
    [self.collectionView scrollToItemAtIndexPath:mid_index atScrollPosition:UICollectionViewScrollPositionTop animated:YES];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 42 * 12 * 150;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    calendarCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    [cell setDateWithIndex:indexPath];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((CGRectGetWidth([UIScreen mainScreen].bounds) - 12) / 7.f, (CGRectGetWidth([UIScreen mainScreen].bounds) - 12) / 7.f);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    int offset = (int)((scrollView.contentOffset.y - self.originOffsetY) / ((CGRectGetWidth([UIScreen mainScreen].bounds) - 12) / 7.f * 6));
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
