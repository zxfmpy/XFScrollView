//
//  XFPageContainerCollectionViewCell.m
//  XFScrollView
//
//  Created by 左晓峰 on 2018/12/10.
//  Copyright © 2018年 zxfmpy. All rights reserved.
//

#import "XFPageContainerCollectionViewCell.h"
#import "Masonry.h"
#import "XFPagecontaierSubCollectionViewCell.h"

@interface XFPageContainerCollectionViewCell () <UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong, readwrite) UICollectionView *collectionView;
//当前数据源
@property (nonatomic, strong) NSMutableArray *datas;
@end

@implementation XFPageContainerCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.containerView = [[UIView alloc] init];
        [self.contentView addSubview:self.containerView];
        [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
        
        //创建一个流水布局
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection =  UICollectionViewScrollDirectionVertical;
        layout.minimumLineSpacing = 10;
        layout.itemSize = CGSizeMake([[UIScreen mainScreen] bounds].size.width, 150);
        
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        self.collectionView.backgroundColor = [UIColor whiteColor];
        //不显示滚动条
        self.collectionView.showsHorizontalScrollIndicator = NO;
        self.collectionView.showsVerticalScrollIndicator = NO;
        self.collectionView.bounces = NO;
        self.collectionView.pagingEnabled = NO;
        
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        [self.containerView addSubview:self.collectionView];
        [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.containerView);
        }];
        self.datas = [NSMutableArray array];
        
        [self.collectionView registerClass:[XFPagecontaierSubCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([XFPagecontaierSubCollectionViewCell class])];
        
        [self requestData];
    }
    return self;
}

- (void)requestData {
    for (NSInteger i = 0; i < 10; i ++) {
        [self.datas addObject:@(i)];
    }
    [self.collectionView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.datas.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"XFPagecontaierSubCollectionViewCell";
    XFPagecontaierSubCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    [cell updateTitle:[NSString stringWithFormat:@"%ld,%ld",indexPath.row,indexPath.section]];
    return cell;
}

@end
