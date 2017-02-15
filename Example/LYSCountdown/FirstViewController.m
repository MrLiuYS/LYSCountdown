//
//  FirstViewController.m
//  LYSCountdown
//
//  Created by 刘永生 on 2017/2/15.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import "FirstViewController.h"

#import "LYSCountdown.h"

@interface FirstViewController () {
    LYSCountdown * countdown;
}



@end

@implementation FirstViewController

- (void)dealloc{
    countdown.close();
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    countdown = [[LYSCountdown alloc]init];
    
    //    //倒计时60s
    //    countdown.begin(60).interval(1).start();
    //    //倒计时60s,同上面的
    //    countdown.begin(60).interval(1).finish(0).start();
    //    //计时器,0->最大值
    //    countdown.begin(0).interval(1).finish(MAXFLOAT).orderBy(LYSCountdownOrderBy_ASC).start();
    //    //计时器,0->最小值
    countdown.begin(0).interval(1).finish(-MAXFLOAT).orderBy(LYSCountdownOrderBy_DASC).start();
    
    countdown.actionBlock = ^(LYSCountdown *cd,CGFloat lastTime){
        
        NSLog(@"进行%@:%f",cd,lastTime);
        dispatch_async(dispatch_get_main_queue(), ^{
            //界面调整要在主线
        });
        
    };
    
    countdown.finishBlock = ^(LYSCountdown *cd,CGFloat lastTime){
        
        NSLog(@"结束%@:%f",cd,lastTime);
        dispatch_async(dispatch_get_main_queue(), ^{
            //界面调整要在主线
        });
    };
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
