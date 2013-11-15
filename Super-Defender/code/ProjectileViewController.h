//
//  ProjectileViewController.h
//  Super Defender
//
//  Created by Patrick Böhner on 11/12/13.
//  Copyright (c) 2013 RoFuPaNi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameData.h"
#import "UpgradeViewController.h"

@interface ProjectileViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIView *projectileView;
@property (nonatomic, assign) id <MenuViewControllerDelegate> delegate;
@property (nonatomic, strong) GameData *gameData;
@property (nonatomic, assign) int score;
@property (nonatomic, strong) IBOutlet UILabel *projectileScoreLabel;
@property (nonatomic, strong) IBOutlet UIButton *projectileBackButton;

@property (nonatomic, strong) IBOutlet UIButton *buttonProjectilePower;
@property (nonatomic, strong) IBOutlet UIButton *buttonProjectileFireRate;
@property (nonatomic, strong) IBOutlet UIButton *buttonProjectileMoveSpeed;
@property (nonatomic, strong) IBOutlet UIButton *buttonProjectileUnstopable;
@property (nonatomic, strong) IBOutlet UIButton *buttonProjectileDarkMatter;

@property (nonatomic, strong) IBOutlet UILabel *projectilePowerCost;
@property (nonatomic, strong) IBOutlet UILabel *projectileFirerateCost;
@property (nonatomic, strong) IBOutlet UILabel *projectileMoveSpeedCost;
@property (nonatomic, strong) IBOutlet UILabel *projectileUnstoppableCost;
@property (nonatomic, strong) IBOutlet UILabel *projectileDarkmMatterCost;

@property (nonatomic, strong) IBOutlet UILabel *projectilePowerAmount;
@property (nonatomic, strong) IBOutlet UILabel *projectileFirerateAmount;
@property (nonatomic, strong) IBOutlet UILabel *projectileMoveSpeedAmount;
@property (nonatomic, strong) IBOutlet UILabel *projectileUnstoppableAmount;
@property (nonatomic, strong) IBOutlet UILabel *projectileDarkmMatterAmount;

@property (nonatomic, strong) NSMutableArray *projectileButtons;
@property (nonatomic, strong) NSMutableArray *projectileCostLabels;
@property (nonatomic, strong) NSMutableArray *projectileAmountLabels;

- (ProjectileViewController *)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil gamedata:(GameData *)par_gameData;
- (void) loadProjectileViewData;
- (IBAction) projectileButtonTapped:(id)sender;
- (IBAction) projectileMenuClosed:(id)sender;


@end
