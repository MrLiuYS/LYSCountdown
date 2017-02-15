# LYSCountdown

**如果没有设置结束点.默认为0**

```
countdown.begin(60).interval(1).finish(0).start();
```
等价于

```
countdown.begin(60).interval(1).start();
```

##属性

属性 | 说明
---|---
.begin(60) | 开始点60
.interval(1) | 间隔单位1s
.finish(0) |结束点0
.orderBy() | (LYSCountdownOrderBy_DASC减/LYSCountdownOrderBy_ASC/加)
.start() | 开始执行
.close | 关闭计时器



##倒计时


```
    LYSCountdown * countdown = [[LYSCountdown alloc]init];
    
    countdown.begin(60).interval(1).finish(0).start();
```
从60走到0 , 每次经过1s



##计时器


```
    LYSCountdown * countdown = [[LYSCountdown alloc]init];
    
    countdown.begin(0).interval(1).finish(-MAXFLOAT).orderBy(LYSCountdownOrderBy_DASC).start();
```
从0->最小值

```
    LYSCountdown * countdown = [[LYSCountdown alloc]init];
    
    countdown.begin(0).interval(1).finish(MAXFLOAT).orderBy(LYSCountdownOrderBy_ASC).start();
```
从0->最大值

##回调方法

###每间隔单位调用
```
    countdown.actionBlock = ^(LYSCountdown *countdown,CGFloat lastTime){
      
        NSLog(@"进行%@:%f",countdown,lastTime);
        dispatch_async(dispatch_get_main_queue(), ^{
            //界面调整要在主线
        });
        
    };
```

###计时器结束调用
``` 
    countdown.finishBlock = ^(LYSCountdown *countdown,CGFloat lastTime){
        
        NSLog(@"结束%@:%f",countdown,lastTime);
        dispatch_async(dispatch_get_main_queue(), ^{
            //界面调整要在主线
        });
    };
```

##离开视图调用
```
- (void)dealloc{
    countdown.close();
}
```


