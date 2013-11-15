//
//  UpgradeViewController.h
//  Super Defender
//
//  Created by Furkan on 10/14/13.
//  Copyright (c) 2013 RoFuPaNi. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "GameData.h"
#import "PhotoViewController.h"
#import "UpgradeViewController.h"
#import "ProjectileViewController.h"

@interface MenuViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIButton *projectileViewButton;

@property (nonatomic, strong) IBOutlet UIButton *resumeKnop;
@property (nonatomic, strong) IBOutlet UIButton *imageKnop;

@property (nonatomic, strong) IBOutlet UIButton *newgame;
@property (nonatomic, assign) id <MenuViewControllerDelegate> delegate;
@property (nonatomic, strong) PhotoViewController *photoViewController;
@property (nonatomic, strong) UpgradeViewController *upgradeViewController;
@property (nonatomic, strong) ProjectileViewController *projectileViewController;

@property (nonatomic, strong) IBOutlet UIView *menuView;

@property (nonatomic, strong) GameData *gameData;
@property (nonatomic, assign) int score;
@property (nonatomic, strong) IBOutlet UILabel *projectileScoreLabel;

- (MenuViewController *)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil gamedata:(GameData *)par_gameData;
- (IBAction)tap:(id)sender;
- (IBAction) projectileViewButtonTapped:(id) sender;
- (void) visible;

@end
