//
//  MSStatusBarHUD.h
//  ZhuoYueZaiXian
//
//  Created by niuniu on 15/8/13.
//  Copyright (c) 2015年 Marshal. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    Top,
    left,
    right
    
}Direct;

@interface MSStatusBarHUD : NSObject
/**
 * 显示普通信息
 */
+ (void)showNewMessage:(NSString *)msg from:(Direct)direct;
@end
