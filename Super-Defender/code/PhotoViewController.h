//
//  PhotoViewController.h
//  Super Defender
//
//  Created by Patrick Böhner on 11/12/13.
//  Copyright (c) 2013 RoFuPaNi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UpgradeViewController.h"

@protocol PhotoViewControllerDelegate <UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@end

@interface PhotoViewController : UIViewController <PhotoViewControllerDelegate>

@property (nonatomic, assign) id <MenuViewControllerDelegate> delegate;
@property (nonatomic, strong) IBOutlet UIButton *useCamera;
@property (nonatomic, strong) IBOutlet UIButton *useLibrary;
@property (nonatomic, strong) IBOutlet UIButton *doneSelecting;
@property (nonatomic, strong) IBOutlet UIView *pickImageView;
@property (nonatomic, strong) UIImagePickerController *picker;
@property (nonatomic, strong) IBOutlet UIImageView *selectedImage;
@property (nonatomic, strong) IBOutlet UILabel *selectedImageLabel;
@property (nonatomic, assign) BOOL firstTime;

- (IBAction)tap:(id)sender;
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info;
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker;

@end
