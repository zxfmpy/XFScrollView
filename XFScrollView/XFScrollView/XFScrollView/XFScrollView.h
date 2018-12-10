//
//  XFScrollView.h
//  XFScrollView
//
//  Created by 左晓峰 on 2018/12/10.
//  Copyright © 2018年 zxfmpy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XFTopContainerView.h"
NS_ASSUME_NONNULL_BEGIN

#define XF_IPHONE_X \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})

#define XF_NAVBARHIGHT (XF_IPHONE_X?88:64)
#define XF_BOTTOMHEIGHT (XF_IPHONE_X?34:0)

@interface XFScrollView : UIScrollView
@property (nonatomic, strong, readonly) XFTopContainerView *topContainerView;

- (void)setupTopContainerViewFrameHeight:(CGFloat)containerHeight bannerFrameHeight:(CGFloat)bannerHeight;

//设置数据源
- (void)setupDatas:(NSMutableArray *)datas;

@end

NS_ASSUME_NONNULL_END
