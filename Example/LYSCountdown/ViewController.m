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
    
    countdown.begin(10).interval(2).finish(4).start();
    
    countdown.actionBlock = ^(LYSCountdown *countdown,CGFloat lastTime){
      
        NSLog(@"进行%@:%f",countdown,lastTime);
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"界面调整要在主线");
        });
        
    };
    
    countdown.finishBlock = ^(LYSCountdown *countdown,CGFloat lastTime){
        
        NSLog(@"结束%@:%f",countdown,lastTime);
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"界面调整要在主线");
        });
    };
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
