//
//  EMChatBaseBubbleView.m
//  ChatDemo
//
//  Created by xieyajie on 14-3-7.
//  Copyright (c) 2014年 easemob. All rights reserved.
//

#import "EMChatBaseBubbleView.h"

NSString *const kRouterEventChatCellBubbleTapEventName = @"kRouterEventChatCellBubbleTapEventName";

@interface EMChatBaseBubbleView ()

@end

@implementation EMChatBaseBubbleView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        _backImageView = [[UIImageView alloc] init];
        _backImageView.userInteractionEnabled = YES;
        _backImageView.multipleTouchEnabled = YES;
        _backImageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        [self addSubview:_backImageView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bubbleViewPressed:)];
        [self addGestureRecognizer:tap];
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

#pragma mark - setter

- (void)setModel:(EMMessageModel *)model
{
    _model = model;
    
    BOOL isReceiver = !_model.isSender;
    NSString *imageName = isReceiver ? BUBBLE_LEFT_IMAGE_NAME : BUBBLE_RIGHT_IMAGE_NAME;
    NSInteger leftCapWidth = isReceiver?BUBBLE_LEFT_LEFT_CAP_WIDTH:BUBBLE_RIGHT_LEFT_CAP_WIDTH;
    NSInteger topCapHeight =  isReceiver?BUBBLE_LEFT_TOP_CAP_HEIGHT:BUBBLE_RIGHT_TOP_CAP_HEIGHT;
    self.backImageView.image = [[UIImage imageNamed:imageName] stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:topCapHeight];
}

#pragma mark - public

+ (CGFloat)heightForBubbleWithObject:(EMMessageModel *)object
{
    return 30;
}

- (void)bubbleViewPressed:(id)sender
{
    [self routerEventWithName:kRouterEventChatCellBubbleTapEventName userInfo:@{KMESSAGEKEY:self.model}];
}

- (void)progress:(CGFloat)progress
{
    [_progressView setProgress:progress animated:YES];
}

@end