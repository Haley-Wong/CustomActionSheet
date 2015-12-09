# HLActionSheetDemo
自定义ActionSheetDemo

# 效果图
![](https://github.com/Joker-King/HLActionSheetDemo/blob/master/Simulator%20Screen%20Shot.png)

# 使用范例
```
NSArray *titles = @[@"分享到朋友圈",@"分享到微博",@"分享到QQ空间",@"复制链接",@"发送给朋友"];
    NSArray *imageNames = @[@"sns_icon_23",@"sns_icon_1",@"sns_icon_6",@"sns_icon_copy",@"sns_icon_f"];
    HLActionSheet *sheet = [[HLActionSheet alloc] initWithTitles:titles iconNames:imageNames];
    [sheet showActionSheetWithClickBlock:^(int btnIndex) {
        NSLog(@"btnIndex:%d",btnIndex);
    } cancelBlock:^{
        NSLog(@"取消");
    }];
```
