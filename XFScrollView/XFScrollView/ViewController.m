//
//  ViewController.m
//  XFScrollView
//
//  Created by 左晓峰 on 2018/12/10.
//  Copyright © 2018年 zxfmpy. All rights reserved.
//

#import "ViewController.h"
#import "XFScrollView.h"

@interface ViewController ()
@property (nonatomic, strong) UIView *navBarView;
@property (nonatomic, strong) XFScrollView *mainScrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, XF_NAVBARHIGHT)];
    self.navBarView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.navBarView];
    
    self.mainScrollView = [[XFScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.navBarView.frame), self.view.frame.size.width, self.view.frame.size.height - CGRectGetMaxY(self.navBarView.frame) - XF_BOTTOMHEIGHT)];
    self.mainScrollView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.mainScrollView];
    
    [self.mainScrollView setupTopContainerViewFrameHeight:self.view.frame.size.height + 100 bannerFrameHeight:50];
    
    NSMutableArray *datas = [NSMutableArray array];
    for (NSInteger i = 0; i < 3; i ++) {
        [datas addObject:@(i)];
    }
    
    [self.mainScrollView setupDatas:datas];
    
}


@end
