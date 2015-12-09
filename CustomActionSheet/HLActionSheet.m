//
//  HLActionSheet.m
//  PracticeDemo
//
//  Created by Harvey on 15/11/11.
//  Copyright © 2015年 Harvey. All rights reserved.
//

#import "HLActionSheet.h"
#import "HLActionSheetItem.h"

@interface HLActionSheet ()

@property (nonatomic, strong) ClickBlock    clickBlock;
@property (nonatomic, strong) CancelBlock   cancelBlock;

@property (nonatomic, strong) UIView *backgroundMask;
@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, retain) UIScrollView *scrollView;

@end

@implementation HLActionSheet

static HLActionSheet *sheet = nil;

- (instancetype)initWithTitles:(NSArray *)titles iconNames:(NSArray *)iconNames
{
    self = [self initWithFrame:[UIScreen mainScreen].bounds];
    
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        self.backgroundMask = [[UIView alloc] initWithFrame:self.bounds];
        self.backgroundMask.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        self.backgroundMask.backgroundColor = [UIColor blackColor];
        self.backgroundMask.alpha = 0;
        [self addSubview:self.backgroundMask];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
        [self.backgroundMask addGestureRecognizer:tap];
        
        self.contentView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.bounds), CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds))];
        self.contentView.backgroundColor = [UIColor clearColor];
        self.contentView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        [self addSubview:self.contentView];
        UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
        [self.contentView addGestureRecognizer:tap2];
        
        CGFloat margin = 8;
        
        self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(margin, 10, CGRectGetWidth(self.contentView.bounds)-margin*2, 150)];
        _scrollView.layer.masksToBounds = YES;
        _scrollView.layer.cornerRadius = 5;
        [_scrollView setBackgroundColor:[UIColor clearColor]];
        [_scrollView setShowsHorizontalScrollIndicator:NO];
        [_scrollView setShowsVerticalScrollIndicator:NO];
        [_scrollView setScrollEnabled:YES];
        _scrollView.backgroundColor = [UIColor whiteColor];
        
        CGFloat itemX = 10;
        NSUInteger count = titles.count <= iconNames.count ? titles.count:iconNames.count;
        for (int i = 0; i < count ; i++) {
            HLActionSheetItem *item = [[HLActionSheetItem alloc] initWithFrame:CGRectMake(itemX, 30, 60, 110)];
            item.btnIndex = i;
            [item setTitle:titles[i] image:[UIImage imageNamed:iconNames[i]]];
            [item addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
            [_scrollView addSubview:item];
            itemX += (60 + 10);
        }
        
        _scrollView.contentSize = CGSizeMake(itemX, CGRectGetHeight(_scrollView.bounds));
        
       
        CGFloat btnY = CGRectGetMaxY(_scrollView.frame) + 8;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor whiteColor];
        btn.frame = CGRectMake(margin, btnY, CGRectGetWidth(self.contentView.frame) - margin * 2, 44);
        [btn setTitle:@"取消" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithRed:0.22 green:0.45 blue:1 alpha:1] forState:UIControlStateNormal];
        btn.layer.cornerRadius = 5;
        btn.layer.masksToBounds = YES;
        [btn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:btn];
        
        CGFloat height = CGRectGetMaxY(btn.frame) + 10;
        
        CGRect frame = self.contentView.frame;
        frame.size.height = height;
        self.contentView.frame = frame;
        
        [self.contentView addSubview:_scrollView];
    }
    
    return self;
}

- (void)clickAction:(HLActionSheetItem *)item
{
    if (_clickBlock) {
        _clickBlock(item.btnIndex);
    }
    
    [self dismiss];
}

- (void)setContentViewFrameY:(CGFloat)y
{
    CGRect frame = self.contentView.frame;
    frame.origin.y = y;
    self.contentView.frame = frame;
}

- (void)dismiss
{
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.backgroundMask.alpha = 0;
        [self setContentViewFrameY:CGRectGetHeight(self.bounds)];
    } completion:^(BOOL finished) {
        sheet.hidden = YES;
        sheet = nil;
    }];
}

- (void)showActionSheetWithClickBlock:(ClickBlock)clickBlock cancelBlock:(CancelBlock)cancelBlock
{
    _clickBlock = clickBlock;
    _cancelBlock = cancelBlock;
    sheet = self;
    sheet.hidden = NO;
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.backgroundMask.alpha = 0.6;
        [self setContentViewFrameY:CGRectGetHeight(self.bounds) - CGRectGetHeight(self.contentView.frame)];
    } completion:^(BOOL finished) {
        
    }];
}

-(void)dealloc
{
    NSLog(@"%s",__func__);
}

@end
