//
//  PlayerInfoViewController.m
//  SwiftStudy
//
//  Created by tw on 14-8-26.
//  Copyright (c) 2014年 shuqiong. All rights reserved.
//

#import "PlayerInfoViewController.h"
#import "SwiftStudy-Swift.h"

@interface PlayerInfoViewController ()

@end

@implementation PlayerInfoViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = self.player.name;
    self.view.backgroundColor = [UIColor whiteColor];
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(110, 40, 100, 40);
    [button setTitle:@"update" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(updatePlayer:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    button1.frame = CGRectMake(110, 100, 100, 40);
    [button1 setTitle:@"add" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(addPlayer:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updatePlayer:(UIButton *)sender {

    [self.delegate playerInfoViewController:self updatePlayer:self.player];
}

- (void)addPlayer:(UIButton *)sender {

    AddPlayerController *controller = [[AddPlayerController alloc] init];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:controller];
    
    [self presentViewController:nav animated:YES completion:^{
        
    }];
}

@end
