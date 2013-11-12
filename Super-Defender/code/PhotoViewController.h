//
//  PhotoViewController.h
//  Super Defender
//
//  Created by Patrick Böhner on 11/12/13.
//  Copyright (c) 2013 RoFuPaNi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PhotoViewControllerDelegate <UINavigationControllerDelegate,UIImagePickerControllerDelegate>
- (void)newGame:(UIImage *)beloved;
- (void)menuClosed;
@end

@interface PhotoViewController : UIViewController

@property (nonatomic, assign) id <PhotoViewControllerDelegate> delegate;
@property (nonatomic, strong) IBOutlet UIButton *useCamera;
@property (nonatomic, strong) IBOutlet UIButton *useLibrary;
@property (nonatomic, strong) IBOutlet UIButton *doneSelecting;
@property (nonatomic, strong) IBOutlet UIView *pickImageView;
@property (nonatomic, strong) UIImagePickerController *picker;
@property (nonatomic, strong) IBOutlet UIImageView *selectedImage;
@property (nonatomic, strong) IBOutlet UILabel *selectedImageLabel;
@property (nonatomic, assign) BOOL firstTime;

- (void)tap:(id)sender;
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info;
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker;

@end
