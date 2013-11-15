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
@synthesize gameData;
@synthesize score;
@synthesize projectileScoreLabel;

@synthesize photoViewController;
@synthesize upgradeViewController;
@synthesize projectileViewController;

@synthesize resumeKnop;
@synthesize newgame;
@synthesize projectileViewButton;
@synthesize imageKnop;

- (void)viewDidAppear:(BOOL)animated
{
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil gamedata:(GameData *)par_gameData
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        gameData = par_gameData;
        UIGraphicsBeginImageContext(self.view.frame.size);
        [[UIImage imageNamed:@"menu.png"] drawInRect:self.view.bounds];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        self.view.backgroundColor = [UIColor colorWithPatternImage:image];
        
        [self.view addSubview:menuView];
        photoViewController = [[PhotoViewController alloc] initWithNibName:@"PhotoViewController" bundle:nil];
        upgradeViewController = [[UpgradeViewController alloc] initWithNibName:@"UpgradeViewController" bundle:nil gamedata:gameData];
        projectileViewController = [[ProjectileViewController alloc] initWithNibName:@"ProjectileViewController" bundle:nil gamedata:gameData];
    }
    return self;
}

-(IBAction)projectileMenuClosed:(id)sender
{
    NSLog(@"Hai");
    //[self.view removeFromSuperview];
//    self.view = view;
}

- (void)tap:(id)sender
{
    if (sender == self.resumeKnop) {
        [self.view removeFromSuperview];
        [delegate menuClosed];
    }else if (sender == self.imageKnop) {
        [self.view addSubview:photoViewController.view];
    } else if (sender == self.newgame) {
        //[delegate newGame:photoViewController.selectedImage.image];
        [self.view addSubview: upgradeViewController.view];
        upgradeViewController.delegate = self.delegate;
    }else if(sender == self.projectileViewButton)
        [self.view addSubview:projectileViewController.view];
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

- (void) visible
{
//    [self loadProjectileViewData];
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
    [self.resumeKnop dealloc];
    [self.imageKnop dealloc];
    [self.newgame dealloc];
    [self.delegate release];
//    [menuView dealloc];
//    [projectileView dealloc];
//    [upgradeView dealloc];
    [gameData dealloc];
    [super dealloc];
}


@end
