//
//  XFPagecontaierSubCollectionViewCell.m
//  XFScrollView
//
//  Created by 左晓峰 on 2018/12/10.
//  Copyright © 2018年 zxfmpy. All rights reserved.
//

#import "XFPagecontaierSubCollectionViewCell.h"
#import "Masonry.h"

@interface XFPagecontaierSubCollectionViewCell ()
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UILabel *label;
@end

@implementation XFPagecontaierSubCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.containerView = [[UIView alloc] init];
        [self.contentView addSubview:self.containerView];
        self.containerView.backgroundColor = [UIColor grayColor];
        self.contentView.layer.cornerRadius = 3.0;
        [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.top.equalTo(self.contentView).offset(15);
            make.trailing.equalTo(self.contentView).offset(-15);
            make.bottom.equalTo(self.contentView).offset(-15);
        }];
        
        self.label = [[UILabel alloc] init];
        [self.contentView addSubview:self.label];
        self.label.textAlignment = NSTextAlignmentCenter;
        [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    }
    return self;
}
- (void)updateTitle:(NSString *)text {
    self.label.text = text;
}
@end
