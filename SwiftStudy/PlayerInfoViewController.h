//
//  PlayerInfoViewController.h
//  SwiftStudy
//
//  Created by tw on 14-8-26.
//  Copyright (c) 2014年 shuqiong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PlayerInfoViewController;
@class Player;

@protocol PlayerInfoViewControllerDelegate <NSObject>

- (void)playerInfoViewController:(PlayerInfoViewController *)controller updatePlayer:(Player *)player;

@end

@interface PlayerInfoViewController : UIViewController

@property (nonatomic, strong) Player *player;
@property (nonatomic, weak) id<PlayerInfoViewControllerDelegate> delegate;

@end
