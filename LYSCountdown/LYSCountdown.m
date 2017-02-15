//
//  LYSCountdown.m
//  LYSCountdown
//
//  Created by 刘永生 on 2017/2/15.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import "LYSCountdown.h"

@interface LYSCountdown () {
    
    
    dispatch_source_t _disTimer; /**< 倒计时 */
    
}

@property (nonatomic, assign) CGFloat mBeginTime;
@property (nonatomic, assign) CGFloat mFinishTime;
@property (nonatomic, assign) CGFloat mIntervalTime;

@property (nonatomic, assign) LYSCountdownOrderBy mOrderBy; /**< 时间加载方向 */




@end

@implementation LYSCountdown

- (void)cancel{
    if (_disTimer) {
        dispatch_source_cancel(_disTimer);
        _disTimer = nil;
    }
}

- (void)startTimer {
    
    [self cancel];
    
    __block CGFloat time = self.mBeginTime;
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    _disTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_disTimer,dispatch_walltime(NULL, 0),self.mIntervalTime*NSEC_PER_SEC, 0); //每秒执行
;
    dispatch_source_set_event_handler(_disTimer, ^{
        
        if (self.actionBlock) {
            self.actionBlock(self, time);
        }
        
        if (self.mOrderBy == LYSCountdownOrderBy_DASC) {
            
            if (time <= self.mFinishTime) {
                if (self.finishBlock) {
                    self.finishBlock(self,time);
                }
                [self cancel];
                return;
            }
            
            time -= self.mIntervalTime;
            
        }else {
            
            if (time >= self.mFinishTime) {
                
                if (self.finishBlock) {
                    self.finishBlock(self,time);
                }
                [self cancel];
                return;
            }
            
            time += self.mIntervalTime;
        }
        
    });
    
    dispatch_resume(_disTimer);
    
}

/**
 开始时间
 */
- (LYSCountdown *(^)(CGFloat beginTime)) begin{
    
    return ^id(CGFloat beginTime){
        self.mBeginTime += beginTime;
        return self;
    };
}

- (LYSCountdown *(^)(CGFloat finishTime)) finish{
    return ^id(CGFloat finishTime){
        self.mFinishTime += finishTime;
        return self;
    };
}

/**
 每间隔调用
 */
- (LYSCountdown *(^)(CGFloat intervalTime)) interval{
    return ^id(CGFloat intervalTime){
        self.mIntervalTime += intervalTime;
        return self;
    };
}


/**
 顺序方向
 */
- (LYSCountdown *(^)(LYSCountdownOrderBy orderBy)) orderBy {
    
    return ^id(LYSCountdownOrderBy orderBy){
        self.mOrderBy = orderBy;
        return self;
    };
    
}

/**
 开始倒计时
 */
- (LYSCountdown *(^)()) start {
    
    return ^id(){
        
        [self startTimer];
        
        return self;
    };
}

/**
 关闭倒计时
 */
- (LYSCountdown *(^)()) close {
    
    return ^id(){
        
        [self cancel];
        
        return self;
    };
}

@end
