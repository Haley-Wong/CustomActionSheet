//
//  HLActionSheetItem.h
//  PracticeDemo
//
//  Created by Harvey on 15/11/11.
//  Copyright © 2015年 Harvey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HLActionSheetItem : UIButton

@property (nonatomic, assign) int     btnIndex;

- (void)setTitle:(NSString *)title image:(UIImage *)image;

@end
