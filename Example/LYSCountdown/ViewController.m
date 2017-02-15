//
//  ViewController.m
//  LYSCountdown
//
//  Created by 刘永生 on 2017/2/15.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import "ViewController.h"

#import "LYSCountdown.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    LYSCountdown * countdown = [[LYSCountdown alloc]init];
    
//    //倒计时60s
//    countdown.begin(60).interval(1).start();
//    //倒计时60s,同上面的
//    countdown.begin(60).interval(1).finish(0).start();
//    //计时器,0->最大值
//    countdown.begin(0).interval(1).finish(MAXFLOAT).orderBy(LYSCountdownOrderBy_ASC).start();
//    //计时器,0->最小值
    countdown.begin(0).interval(1).finish(-MAXFLOAT).orderBy(LYSCountdownOrderBy_DASC).start();
    
    countdown.actionBlock = ^(LYSCountdown *countdown,CGFloat lastTime){
      
        NSLog(@"进行%@:%f",countdown,lastTime);
        dispatch_async(dispatch_get_main_queue(), ^{
            //界面调整要在主线
        });
        
    };
    
    countdown.finishBlock = ^(LYSCountdown *countdown,CGFloat lastTime){
        
        NSLog(@"结束%@:%f",countdown,lastTime);
        dispatch_async(dispatch_get_main_queue(), ^{
            //界面调整要在主线
        });
    };
    
    
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
