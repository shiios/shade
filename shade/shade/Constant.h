//
//  Constant.h
//  shade
//
//  Created by kalian on 16/3/21.
//  Copyright © 2016年 kalian. All rights reserved.
//

#ifndef Constant_h
#define Constant_h

#ifdef DEBUG

#define SGHLog(...) NSLog(__VA_ARGS__)

#else

#define SGHLog(...)

#endif


#pragma mark - 系统值

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kNavHeight 64
#define kButtonWidth 44
#define kStatusBarHeight 20
#define kTabBarHeight 49

#pragma mark - color

#define kColor(R, G, B, a) [UIColor colorWithRed:R / 255.0 green:G / 255.0 blue:B / 255.0 alpha:a];

#pragma mark - 待续





#endif /* Constant_h */
