//
//  LYSCountdown.h
//  LYSCountdown
//
//  Created by 刘永生 on 2017/2/15.
//  Copyright © 2017年 刘永生. All rights reserved.
//
/*
 倒计时
 */


#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

typedef enum
{
    /*
     倒序
     */
    LYSCountdownOrderBy_DASC= 0,
    /*
     升序
     */
    LYSCountdownOrderBy_ASC,

}
LYSCountdownOrderBy;

typedef void (^actionBlock)(id countdown,CGFloat lastTime);
typedef void (^finishBlock)(id countdown,CGFloat lastTime);

@interface LYSCountdown : NSObject

@property (nonatomic, copy) void (^actionBlock)(LYSCountdown *countdown,CGFloat lastTime);
@property (nonatomic, copy) void (^finishBlock)(LYSCountdown *countdown,CGFloat lastTime);

/**
 开始时间
 */
- (LYSCountdown *(^)(CGFloat beginTime)) begin;


/**
 结束时间
 */
- (LYSCountdown *(^)(CGFloat finishTime)) finish;

/**
 顺序
 */
- (LYSCountdown *(^)(LYSCountdownOrderBy orderBy)) orderBy;

/**
 每间隔调用
 */
- (LYSCountdown *(^)(CGFloat intervalTime)) interval;


/**
 开启倒计时
 */
- (LYSCountdown *(^)()) start;

/**
 关闭倒计时
 */
- (LYSCountdown *(^)()) close;


@end
