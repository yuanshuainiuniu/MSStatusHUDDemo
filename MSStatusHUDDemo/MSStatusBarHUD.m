//
//  MSStatusBarHUD.m
//  ZhuoYueZaiXian
//
//  Created by niuniu on 15/8/13.
//  Copyright (c) 2015年 Marshal. All rights reserved.
//

#define kBadgeColor [UIColor yellowColor]
#import "MSStatusBarHUD.h"
#import <AudioToolbox/AudioToolbox.h>
/** 消息的停留时间 */
static CGFloat const MSMessageDuration = 2.5;
/** 消息显示\隐藏的动画时间 */
static CGFloat const MSAnimationDuration = 0.25;

@implementation MSStatusBarHUD
/** 全局的窗口 */
static UIWindow *_window;
static BOOL show;
/**边距*/
static CGFloat const MSMargin = 5.0;

+ (void)showNewMessage:(NSString *)msg from:(Direct)direct{
    // 显示窗口
    if (show) return;
    _window = [[UIWindow alloc] init];
    [_window makeKeyAndVisible];
    _window.backgroundColor = [UIColor clearColor];
    _window.windowLevel = UIWindowLevelStatusBar;
    // 添加文字
    UILabel *label = [[UILabel alloc] init];
    label.numberOfLines = 0;
    label.backgroundColor = kBadgeColor;
    label.font = [UIFont systemFontOfSize:13];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = msg;
    label.textColor = [UIColor redColor];
    label.layer.masksToBounds = YES;
    label.layer.cornerRadius = 2;
    [_window addSubview:label];
    
    CGSize size = [msg boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:label.font} context:nil].size;

    size.width += 2*MSMargin;
    size.height += MSMargin;
    
    CGRect frame;
    CGFloat x = 0;
    CGFloat y = 0;
    switch (direct) {
        case Top:
            frame = CGRectMake(0, -size.height, [UIScreen mainScreen].bounds.size.width, size.height);
            _window.backgroundColor = kBadgeColor;
            x = 0;
            y = size.height;
            break;
        case left:
            frame = CGRectMake(-size.width, 0, size.width, size.height);
            x = size.width-1;
            y = 0;
            break;
        case right:
            frame = CGRectMake([UIScreen mainScreen].bounds.size.width, 0, size.width, size.height);
            x = -size.width+1;
            y = 0;
            break;
            
        default:
            break;
    }
    _window.frame = frame;
    label.frame = (CGRect){{0, 0}, frame.size};
    [UIView animateWithDuration:MSAnimationDuration animations:^{
        show = YES;
        AudioServicesPlaySystemSound(1000);
        AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
        
        _window.transform = CGAffineTransformMakeTranslation(x, y);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:MSAnimationDuration delay:MSMessageDuration options:UIViewAnimationOptionCurveEaseInOut animations:^{
            _window.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            show = NO;
            [label removeFromSuperview];
            _window = nil;
        }];
    }];
}

@end
