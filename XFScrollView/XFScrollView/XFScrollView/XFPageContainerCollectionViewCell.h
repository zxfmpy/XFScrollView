//
//  XFPageContainerCollectionViewCell.h
//  XFScrollView
//
//  Created by 左晓峰 on 2018/12/10.
//  Copyright © 2018年 zxfmpy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XFPageContainerCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong,readonly) UICollectionView *collectionView;
//当前cell的collectionView是否可以移动
@property (nonatomic, assign) BOOL canMove;
@end

NS_ASSUME_NONNULL_END
