//
//  UpgradeViewController.m
//  Super Defender
//
//  Created by Furkan on 10/14/13.
//  Copyright (c) 2013 RoFuPaNi. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

@synthesize delegate;
@synthesize menuView;
@synthesize photoViewController;
@synthesize upgradeViewController;
@synthesize projectileViewController;
//@synthesize projectileView;
//@synthesize upgradeView;

@synthesize projectileViewButton;
@synthesize resumeKnop;
@synthesize imageKnop;
@synthesize newgame;

@synthesize buttonUpgradeHealth;
@synthesize buttonUpgradeFireRate;
@synthesize buttonUpgradeMoveSpeed;
@synthesize buttonUpgradePower;
@synthesize buttonUpgradeRotSpeed;

@synthesize buttonProjectilePower;
@synthesize buttonProjectileFireRate;
@synthesize buttonProjectileMoveSpeed;
@synthesize buttonProjectileUnstopable;
@synthesize buttonProjectileDarkMatter;

@synthesize projectilePowerCost;
@synthesize projectileFirerateCost;
@synthesize projectileMoveSpeedCost;
@synthesize projectileUnstoppableCost;
@synthesize projectileDarkmMatterCost;

@synthesize upgradeHealthCost;
@synthesize upgradeFirerateCost;
@synthesize upgradeMoveSpeedCost;
@synthesize upgradePowerCost;
@synthesize upgradeRotSpeedCost;

@synthesize projectilePowerAmount;
@synthesize projectileFirerateAmount;
@synthesize projectileMoveSpeedAmount;
@synthesize projectileUnstoppableAmount;
@synthesize projectileDarkmMatterAmount;

@synthesize upgradeHealthAmount;
@synthesize upgradeFirerateAmount;
@synthesize upgradeMoveSpeedAmount;
@synthesize upgradePowerAmount;
@synthesize upgradeRotSpeedAmount;

@synthesize projectileButtons;
@synthesize projectileCostLabels;
@synthesize projectileAmountLabels;

@synthesize upgradeButtons;
@synthesize upgradeCostLabels;
@synthesize upgradeAmountLabels;
@synthesize scrap;

@synthesize projectileScoreLabel;
@synthesize upgradeScrapLabel;
@synthesize score;

@synthesize gameData;

- (MenuViewController *)init : (GameData *)par_gameData
{
    gameData = par_gameData;
    [self initWithNibName:@"MenuViewController" bundle:nil];
    return [super init];
}

- (void)viewDidAppear:(BOOL)animated
{
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        UIGraphicsBeginImageContext(self.view.frame.size);
        [[UIImage imageNamed:@"menu.png"] drawInRect:self.view.bounds];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        self.view.backgroundColor = [UIColor colorWithPatternImage:image];
        
        [self.view addSubview:menuView];
        photoViewController = [[PhotoViewController alloc] initWithNibName:@"PhotoViewController" bundle:nil];
        upgradeViewController = [[UpgradeViewController alloc] init];
        projectileViewController = [[ProjectileViewController alloc] init];
                
//        projectileButtons = [[NSMutableArray alloc]init];
//        [projectileButtons addObject:buttonProjectilePower];
//        [projectileButtons addObject:buttonProjectileFireRate];
//        [projectileButtons addObject:buttonProjectileMoveSpeed];
//        [projectileButtons addObject:buttonProjectileUnstopable];
//        [projectileButtons addObject:buttonProjectileDarkMatter];
//        
//        projectileCostLabels = [[NSMutableArray alloc]init];
//        [projectileCostLabels addObject:projectilePowerCost];
//        [projectileCostLabels addObject:projectileFirerateCost];
//        [projectileCostLabels addObject:projectileMoveSpeedCost];
//        [projectileCostLabels addObject:projectileUnstoppableCost];
//        [projectileCostLabels addObject:projectileDarkmMatterCost];
//        
//        projectileAmountLabels = [[NSMutableArray alloc]init];
//        [projectileAmountLabels addObject:projectilePowerAmount];
//        [projectileAmountLabels addObject:projectileFirerateAmount];
//        [projectileAmountLabels addObject:projectileMoveSpeedAmount];
//        [projectileAmountLabels addObject:projectileUnstoppableAmount];
//        [projectileAmountLabels addObject:projectileDarkmMatterAmount];
//        
//        upgradeButtons = [[NSMutableArray alloc]init];
//        [upgradeButtons addObject:buttonUpgradeHealth];
//        [upgradeButtons addObject:buttonUpgradeFireRate];
//        [upgradeButtons addObject:buttonUpgradeMoveSpeed];
//        [upgradeButtons addObject:buttonUpgradePower];
//        [upgradeButtons addObject:buttonUpgradeRotSpeed];
//        
//        upgradeCostLabels = [[NSMutableArray alloc]init];
//        [upgradeCostLabels addObject:upgradeHealthCost];
//        [upgradeCostLabels addObject:upgradeFirerateCost];
//        [upgradeCostLabels addObject:upgradeMoveSpeedCost];
//        [upgradeCostLabels addObject:upgradePowerCost];
//        [upgradeCostLabels addObject:upgradeRotSpeedCost];
//        
//        upgradeAmountLabels = [[NSMutableArray alloc]init];
//        [upgradeAmountLabels addObject:upgradeHealthAmount];
//        [upgradeAmountLabels addObject:upgradeFirerateAmount];
//        [upgradeAmountLabels addObject:upgradeMoveSpeedAmount];
//        [upgradeAmountLabels addObject:upgradePowerAmount];
//        [upgradeAmountLabels addObject:upgradeRotSpeedAmount];
    }
    return self;
}

-(IBAction)projectileMenuClosed:(id)sender
{
    //[self.view removeFromSuperview];
//    self.view = view;
}

-(IBAction)upgradeMenuClosed:(id)sender
{
    [self.view removeFromSuperview];
//    self.view = menuView;
    [delegate menuClosed];
    [delegate createPlayfield];
}

- (void)tap:(id)sender
{
    if (sender == self.resumeKnop) {
        [self.view removeFromSuperview];
        [delegate menuClosed];
    }else if (sender == self.imageKnop) {
        [self.view addSubview:photoViewController.view];
    } else if (sender == self.newgame) {
        [delegate newGame:photoViewController.selectedImage.image];
//        self.view = upgradeView;
    }else if(sender == self.projectileBackButton || sender == self.upgradeBackButton)
        {
            [self projectileMenuClosed:nil];
        }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) loadProjectileViewData
{
    projectileScoreLabel.text = [NSString stringWithFormat:@"SCORE: %i", score];
    for(int i = 0; i<projectileButtons.count; i++)
    {
        UIButton *tempButton = [projectileButtons objectAtIndex:i];
        
        NSString *tempId = [tempButton restorationIdentifier];
        
        UILabel *tempLabelCost = [projectileCostLabels objectAtIndex:i];
        tempLabelCost.text = [NSString stringWithFormat:@"COST: %@", [[gameData.gameData objectForKey:tempId] objectForKey:@"cost"]];
            
        UILabel *tempLabelAmount = [projectileAmountLabels objectAtIndex:i];
        tempLabelAmount.text = [NSString stringWithFormat:@"UP: %@", [[gameData.gameData objectForKey:tempId] objectForKey:@"amount"]];
        //[tempId release];
    }
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

- (IBAction) projectileButtonTapped:(id)sender
{
    NSString *tempId = [sender restorationIdentifier];
    for(int i = 0; i<projectileButtons.count; i++)
    {
        if([projectileButtons objectAtIndex:i] == sender)
        {
            int tempCost = [[[gameData.gameData objectForKey:tempId] objectForKey:@"cost"] intValue];
            int tempAmount = [[[gameData.gameData objectForKey:tempId] objectForKey:@"amount"] intValue];
            if(score >= tempCost)
            {
                score -= tempCost;
                projectileScoreLabel.text = [NSString stringWithFormat:@"SCORE: %i", score];
                if(i == 0)
                {
                    tempAmount = tempAmount + 10;
                    [delegate updateActivatorTitle : i : tempAmount];
                }else if(i == 1)
                {
                    tempAmount = tempAmount + 30;
                    [delegate updateActivatorTitle : i : tempAmount];
                }else if(i == 2)
                {
                    tempAmount = tempAmount + 20;
                    [delegate updateActivatorTitle : i : tempAmount];
                }else if(i == 3)
                {
                    tempAmount = tempAmount + 1;
                    [delegate updateActivatorTitle : i : tempAmount];
                }else if(i == 4)
                {
                    tempAmount = tempAmount + 1;
                    [delegate updateActivatorTitle : i : tempAmount];
                }

                [[gameData.gameData objectForKey:tempId] setObject:[NSNumber numberWithInt:tempAmount] forKey:@"amount"];
            
                UILabel *tempLabelAmount = [projectileAmountLabels objectAtIndex:i];
                tempLabelAmount.text = [NSString stringWithFormat:@"UP: %i", tempAmount];
                [delegate updateScore:score];
            } else {
                NSLog(@"Silly guy, you don't have enough money...");
            }
        }
    }
    [self saveGame];
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
    [self saveGame];
}

- (void)saveGame
{
    [gameData saveGame];
}


- (void) visible
{
    [self loadProjectileViewData];
    [self loadUpgradeViewData];
    if ([delegate runningGame]) {
        [self.resumeKnop setEnabled:YES];
        [projectileViewButton setEnabled:YES];
    } else {
        [self.resumeKnop setEnabled:NO];
        [projectileViewButton setEnabled:NO];
    }
}

- (IBAction) projectileViewButtonTapped:(id) sender {
    //[self.view addSubview:emptyView];
//    self.view = projectileView;
    //[menuView removeFromSuperview];
    //curView = projectileView;
}

- (void) dealloc
{
    NSLog(@"MenuViewController dealloc");
    [projectileViewButton dealloc];
    [self.projectileBackButton dealloc];
    [self.upgradeBackButton dealloc];
    [self.resumeKnop dealloc];
    [self.imageKnop dealloc];
    [self.newgame dealloc];
    [self.delegate release];
//    [menuView dealloc];
//    [projectileView dealloc];
//    [upgradeView dealloc];
    [upgradeButtons dealloc];
    [projectileButtons dealloc];
    [projectileScoreLabel dealloc];
    [upgradeScrapLabel dealloc];
    [projectileCostLabels dealloc];
    [upgradeCostLabels dealloc];
    [projectileAmountLabels dealloc];
    [upgradeAmountLabels dealloc];
    [gameData dealloc];
    [super dealloc];
}


@end
