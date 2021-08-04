//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Надежда Зенкова
// On: 30.07.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import <UIKit/UIKit.h>
#import "RSSettingsViewController.h"

NS_ASSUME_NONNULL_BEGIN

@protocol RSColorSettingsViewControllerDelegate

@optional
- (void)setDrawingColor:(NSString *)color;

@end

@interface RSColorSettingsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *colorsTableView;
@property (nonatomic, strong) NSArray *colors;
@property (strong, nonatomic) NSMutableString *selectedColor;
@property (weak, nonatomic, nullable) id<RSColorSettingsViewControllerDelegate> delegate;
@property (strong, nonatomic) RSSettingsViewController *settingsViewController;


@end

NS_ASSUME_NONNULL_END
