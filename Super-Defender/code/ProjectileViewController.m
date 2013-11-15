//
//  ProjectileViewController.m
//  Super Defender
//
//  Created by Patrick Böhner on 11/12/13.
//  Copyright (c) 2013 RoFuPaNi. All rights reserved.
//

#import "ProjectileViewController.h"

@interface ProjectileViewController ()

@end

@implementation ProjectileViewController

@synthesize projectileView;
@synthesize delegate;
@synthesize projectileScoreLabel;
@synthesize gameData;
@synthesize score;
@synthesize projectileBackButton;

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

@synthesize projectilePowerAmount;
@synthesize projectileFirerateAmount;
@synthesize projectileMoveSpeedAmount;
@synthesize projectileUnstoppableAmount;
@synthesize projectileDarkmMatterAmount;

@synthesize projectileButtons;
@synthesize projectileCostLabels;
@synthesize projectileAmountLabels;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil gamedata:(GameData *)par_gameData
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        gameData = par_gameData;
        
        UIGraphicsBeginImageContext(self.view.frame.size);
        [[UIImage imageNamed:@"ProjectileScherm_v1_leeg.png"] drawInRect:self.view.bounds];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        self.view.backgroundColor = [UIColor colorWithPatternImage:image];
        
        projectileButtons = [[NSMutableArray alloc]init];
        [projectileButtons addObject:buttonProjectilePower];
        [projectileButtons addObject:buttonProjectileFireRate];
        [projectileButtons addObject:buttonProjectileMoveSpeed];
        [projectileButtons addObject:buttonProjectileUnstopable];
        [projectileButtons addObject:buttonProjectileDarkMatter];
        
        projectileCostLabels = [[NSMutableArray alloc]init];
        [projectileCostLabels addObject:projectilePowerCost];
        [projectileCostLabels addObject:projectileFirerateCost];
        [projectileCostLabels addObject:projectileMoveSpeedCost];
        [projectileCostLabels addObject:projectileUnstoppableCost];
        [projectileCostLabels addObject:projectileDarkmMatterCost];
        
        projectileAmountLabels = [[NSMutableArray alloc]init];
        [projectileAmountLabels addObject:projectilePowerAmount];
        [projectileAmountLabels addObject:projectileFirerateAmount];
        [projectileAmountLabels addObject:projectileMoveSpeedAmount];
        [projectileAmountLabels addObject:projectileUnstoppableAmount];
        [projectileAmountLabels addObject:projectileDarkmMatterAmount];
    }
    return self;
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
    NSLog(@"MenuViewController dealloc");
    [gameData dealloc];
    [projectileBackButton dealloc];
    [projectileButtons dealloc];
    [projectileScoreLabel dealloc];
    [projectileCostLabels dealloc];
    [projectileAmountLabels dealloc];
    [super dealloc];
}

@end
