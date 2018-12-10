//
//  XFScrollView.m
//  XFScrollView
//
//  Created by 左晓峰 on 2018/12/10.
//  Copyright © 2018年 zxfmpy. All rights reserved.
//

#import "XFScrollView.h"
#import "XFPageContainerCollectionView.h"
#import "XFPageContainerCollectionViewCell.h"

@interface XFScrollView ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong, readwrite) XFTopContainerView *topContainerView;
@property (nonatomic, strong) XFPageContainerCollectionView *mainCollectionView;
@property (nonatomic, assign) CGFloat bannerHeight;

@property (nonatomic, strong) NSMutableArray *datas;

@end

@implementation XFScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.topContainerView = [[XFTopContainerView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 0)];
        [self addSubview:self.topContainerView];
        self.showsVerticalScrollIndicator = NO;
        self.delegate = self;
        
        //数据源，多少列
        self.datas = [NSMutableArray array];
    }
    return self;
}

- (void)setupDatas:(NSMutableArray *)datas {
    _datas = datas;
    [self.mainCollectionView reloadData];
}

- (void)setupTopContainerViewFrameHeight:(CGFloat)containerHeight bannerFrameHeight:(CGFloat)bannerHeight {
    self.bannerHeight = bannerHeight;
    self.topContainerView.frame = CGRectMake(self.topContainerView.frame.origin.x, self.topContainerView.frame.origin.y, self.topContainerView.frame.size.width, containerHeight);
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection =  UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 0;
    layout.itemSize = CGSizeMake(self.frame.size.width, self.frame.size.height - self.bannerHeight);
    self.mainCollectionView = [[XFPageContainerCollectionView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.topContainerView.frame), self.frame.size.width, self.frame.size.height) collectionViewLayout:layout];
    [self addSubview:self.mainCollectionView];
    self.mainCollectionView.delegate = self;
    self.mainCollectionView.dataSource = self;
    self.mainCollectionView.backgroundColor = [UIColor whiteColor];
    
    [self.mainCollectionView registerClass:[XFPageContainerCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([XFPageContainerCollectionViewCell class])];
    
    self.contentSize = CGSizeMake(self.frame.size.width, CGRectGetMaxY(self.mainCollectionView.frame));
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.datas.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"XFPageContainerCollectionViewCell";
    XFPageContainerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    return cell;
}

//同时都能响应手势
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

@end
