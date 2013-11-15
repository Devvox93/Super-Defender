//
//  UpgradeViewController.h
//  Super Defender
//
//  Created by Patrick Böhner on 11/12/13.
//  Copyright (c) 2013 RoFuPaNi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameData.h"

@protocol MenuViewControllerDelegate <NSObject>
- (void)menuClosed;
- (void)createPlayfield;
@end

@interface UpgradeViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIView *upgradeView;
@property (nonatomic, assign) id <MenuViewControllerDelegate> delegate;
@property (nonatomic, strong) GameData *gameData;
@property (nonatomic, assign) int scrap;
@property (nonatomic, strong) IBOutlet UILabel *upgradeScrapLabel;
@property (nonatomic, strong) IBOutlet UIButton *upgradeBackButton;

@property (nonatomic, strong) IBOutlet UIButton *buttonUpgradeHealth;
@property (nonatomic, strong) IBOutlet UIButton *buttonUpgradeFireRate;
@property (nonatomic, strong) IBOutlet UIButton *buttonUpgradeMoveSpeed;
@property (nonatomic, strong) IBOutlet UIButton *buttonUpgradePower;
@property (nonatomic, strong) IBOutlet UIButton *buttonUpgradeRotSpeed;

@property (nonatomic, strong) IBOutlet UILabel *upgradeHealthCost;
@property (nonatomic, strong) IBOutlet UILabel *upgradeFirerateCost;
@property (nonatomic, strong) IBOutlet UILabel *upgradeMoveSpeedCost;
@property (nonatomic, strong) IBOutlet UILabel *upgradePowerCost;
@property (nonatomic, strong) IBOutlet UILabel *upgradeRotSpeedCost;

@property (nonatomic, strong) IBOutlet UILabel *upgradeHealthAmount;
@property (nonatomic, strong) IBOutlet UILabel *upgradeFirerateAmount;
@property (nonatomic, strong) IBOutlet UILabel *upgradeMoveSpeedAmount;
@property (nonatomic, strong) IBOutlet UILabel *upgradePowerAmount;
@property (nonatomic, strong) IBOutlet UILabel *upgradeRotSpeedAmount;

@property (nonatomic, strong) NSMutableArray *upgradeButtons;
@property (nonatomic, strong) NSMutableArray *upgradeCostLabels;
@property (nonatomic, strong) NSMutableArray *upgradeAmountLabels;

- (UpgradeViewController *)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil gamedata:(GameData *)par_gameData;
- (void) loadUpgradeViewData;
- (IBAction) upgradeButtonTapped:(id)sender;
- (IBAction) upgradeMenuClosed:(id)sender;

@end
