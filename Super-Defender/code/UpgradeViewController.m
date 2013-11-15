//
//  UpgradeViewController.m
//  Super Defender
//
//  Created by Patrick Böhner on 11/12/13.
//  Copyright (c) 2013 RoFuPaNi. All rights reserved.
//

#import "UpgradeViewController.h"

@interface UpgradeViewController ()

@end

@implementation UpgradeViewController

@synthesize upgradeView;
@synthesize delegate;
@synthesize gameData;
@synthesize scrap;
@synthesize upgradeScrapLabel;

@synthesize buttonUpgradeHealth;
@synthesize buttonUpgradeFireRate;
@synthesize buttonUpgradeMoveSpeed;
@synthesize buttonUpgradePower;
@synthesize buttonUpgradeRotSpeed;

@synthesize upgradeHealthCost;
@synthesize upgradeFirerateCost;
@synthesize upgradeMoveSpeedCost;
@synthesize upgradePowerCost;
@synthesize upgradeRotSpeedCost;

@synthesize upgradeHealthAmount;
@synthesize upgradeFirerateAmount;
@synthesize upgradeMoveSpeedAmount;
@synthesize upgradePowerAmount;
@synthesize upgradeRotSpeedAmount;

@synthesize upgradeButtons;
@synthesize upgradeCostLabels;
@synthesize upgradeAmountLabels;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil gamedata:(GameData *)par_gameData
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        gameData = par_gameData;
        
        UIGraphicsBeginImageContext(self.view.frame.size);
        [[UIImage imageNamed:@"UpgradeScherm_v1_leeg.png"] drawInRect:self.view.bounds];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        self.view.backgroundColor = [UIColor colorWithPatternImage:image];
        
        upgradeButtons = [[NSMutableArray alloc]init];
        [upgradeButtons addObject:buttonUpgradeHealth];
        [upgradeButtons addObject:buttonUpgradeFireRate];
        [upgradeButtons addObject:buttonUpgradeMoveSpeed];
        [upgradeButtons addObject:buttonUpgradePower];
        [upgradeButtons addObject:buttonUpgradeRotSpeed];
        
        upgradeCostLabels = [[NSMutableArray alloc]init];
        [upgradeCostLabels addObject:upgradeHealthCost];
        [upgradeCostLabels addObject:upgradeFirerateCost];
        [upgradeCostLabels addObject:upgradeMoveSpeedCost];
        [upgradeCostLabels addObject:upgradePowerCost];
        [upgradeCostLabels addObject:upgradeRotSpeedCost];
        
        upgradeAmountLabels = [[NSMutableArray alloc]init];
        [upgradeAmountLabels addObject:upgradeHealthAmount];
        [upgradeAmountLabels addObject:upgradeFirerateAmount];
        [upgradeAmountLabels addObject:upgradeMoveSpeedAmount];
        [upgradeAmountLabels addObject:upgradePowerAmount];
        [upgradeAmountLabels addObject:upgradeRotSpeedAmount];
    }
    return self;
}

-(IBAction)upgradeMenuClosed:(id)sender
{
    [self.view removeFromSuperview];
    [delegate menuClosed];
    [delegate newGame];
}

- (void) loadUpgradeViewData
{
    scrap = [[gameData.gameData objectForKey:@"Scrap"] intValue];
    upgradeScrapLabel.text = [NSString stringWithFormat:@"SCRAP: %i", scrap];
    for(int i = 0; i<upgradeButtons.count; i++)
    {
        UIButton *tempButton = [upgradeButtons objectAtIndex:i];
        NSString *tempId = [tempButton restorationIdentifier];
        
        UILabel *tempLabelCost = [upgradeCostLabels objectAtIndex:i];
        tempLabelCost.text = [NSString stringWithFormat:@"COST: %@", [[gameData.gameData objectForKey:tempId] objectForKey:@"cost"]];
        
        UILabel *tempLabelAmount = [upgradeAmountLabels objectAtIndex:i];
        tempLabelAmount.text = [NSString stringWithFormat:@"UP: %@", [[gameData.gameData objectForKey:tempId] objectForKey:@"amount"]];
        //[tempId release];
    }
}
- (IBAction) upgradeButtonTapped:(id)sender
{
    NSString *tempId = [sender restorationIdentifier];
    for(int i = 0; i<upgradeButtons.count; i++)
    {
        if([upgradeButtons objectAtIndex:i] == sender)
        {
            int tempCost = [[[gameData.gameData objectForKey:tempId] objectForKey:@"cost"] intValue];
            int tempAmount = [[[gameData.gameData objectForKey:tempId] objectForKey:@"amount"] intValue];
            if(scrap >= tempCost && tempAmount < 4)
            {
                scrap = scrap - tempCost;
                upgradeScrapLabel.text = [NSString stringWithFormat:@"SCRAP: %i", scrap];
                
                tempCost = tempCost * 2;
                tempAmount = tempAmount + 1;
                
                [gameData.gameData setObject:[NSNumber numberWithInt:scrap] forKey:@"Scrap"];
                [[gameData.gameData objectForKey:tempId] setObject:[NSNumber numberWithInt:tempCost] forKey:@"cost"];
                [[gameData.gameData objectForKey:tempId] setObject:[NSNumber numberWithInt:tempAmount] forKey:@"amount"];
                
                UILabel *tempLabelCost = [upgradeCostLabels objectAtIndex:i];
                tempLabelCost.text = [NSString stringWithFormat:@"COST: %i", tempCost];
                
                UILabel *tempLabelAmount = [upgradeAmountLabels objectAtIndex:i];
                tempLabelAmount.text = [NSString stringWithFormat:@"UP: %i", tempAmount];
            }else{
                NSLog(@"Silly guy, you don't have enough money...");
            }
        }
    }
    [gameData saveGame];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) dealloc
{
    NSLog(@"UpgradeViewController dealloc");
    [self.upgradeBackButton dealloc];
    [self.delegate release];
    [upgradeButtons dealloc];
    [upgradeScrapLabel dealloc];
    [upgradeCostLabels dealloc];
    [upgradeAmountLabels dealloc];
    [super dealloc];
}

@end
