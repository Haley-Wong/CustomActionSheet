//
//  ViewController.m
//  HLActionSheetDemo
//
//  Created by Harvey on 15/12/9.
//  Copyright © 2015年 Halley. All rights reserved.
//

#import "ViewController.h"
#import "HLActionSheet.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)styleOneClick:(id)sender {
    NSArray *titles = @[@"分享到朋友圈",@"分享到微博",@"分享到QQ空间",@"复制链接",@"发送给朋友"];
    NSArray *imageNames = @[@"sns_icon_23",@"sns_icon_1",@"sns_icon_6",@"sns_icon_copy",@"sns_icon_f"];
    HLActionSheet *sheet = [[HLActionSheet alloc] initWithTitles:titles iconNames:imageNames];
    [sheet showActionSheetWithClickBlock:^(int btnIndex) {
        NSLog(@"btnIndex:%d",btnIndex);
    } cancelBlock:^{
        NSLog(@"取消");
    }];

}

@end
