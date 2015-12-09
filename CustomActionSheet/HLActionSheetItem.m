//
//  HLActionSheetItem.m
//  PracticeDemo
//
//  Created by Harvey on 15/11/11.
//  Copyright © 2015年 Harvey. All rights reserved.
//

#import "HLActionSheetItem.h"

@implementation HLActionSheetItem

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGRect titleRect = CGRectMake(5, CGRectGetHeight(self.bounds) - 40, CGRectGetWidth(self.bounds)-10, 40);
    return titleRect;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGRect imageRect = self.bounds;
    imageRect.size.height = CGRectGetWidth(self.bounds);
    
    return imageRect;
}

- (void)setTitle:(NSString *)title image:(UIImage *)image
{
    [self setTitle:title forState:UIControlStateNormal];
    self.titleLabel.numberOfLines = 2;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [self setImage:image forState:UIControlStateNormal];
}

@end
