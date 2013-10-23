//
//  UIBarButtonItem+Addtions.m
//  RunCoach5K
//
//  Created by YQ-011 on 7/10/13.
//  Copyright (c) 2013 YQ-011. All rights reserved.
//

#import "UIBarButtonItem+Addtions.h"

@implementation UIBarButtonItem (Addtions)

+(id)barButtonItemWithCustomImage:(UIImage *)image target:(id)target action:(SEL)action{
    int width = image.size.width;
    //扩大相应面积
    if ([[[UIDevice currentDevice] systemVersion] doubleValue] < 7.0) {
        if (image.size.width + 20 <= 70)
            width = image.size.width + 20;
    }
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, width, 30)];
    [button setImage:image forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:button];
#if !__has_feature(objc_arc)
    [button release];
    [barButton autorelease];
#endif
    return barButton;
}

//offset为按钮水平偏移位置,适配iOS7,负数向左
+(id)barButtonItemWithCustomImage:(UIImage *)image target:(id)target action:(SEL)action Offset:(float)offset{
    int width = image.size.width;
    //扩大相应面积,money不需要
//    if ([[[UIDevice currentDevice] systemVersion] doubleValue] < 7.0) {
//        if (image.size.width + 20 <= 70)
//            width = image.size.width + 20;
//    }
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, width, 30)];
    if ([[[UIDevice currentDevice] systemVersion] doubleValue] >= 7.0) {
        if (offset < 0) {
            [button setImageEdgeInsets:UIEdgeInsetsMake(0, offset, 0, 0)];
        }else{
            [button setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, -offset)];
        }
        
    }
    [button setImage:image forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:button];
#if !__has_feature(objc_arc)
    [button release];
    [barButton autorelease];
#endif
    return barButton;
}

@end
