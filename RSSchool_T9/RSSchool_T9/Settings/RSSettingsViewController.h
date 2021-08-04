//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Надежда Зенкова
// On: 28.07.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import <UIKit/UIKit.h>
//#import <RSSchool_T9-Swift.h>

NS_ASSUME_NONNULL_BEGIN

@protocol RSSettingsViewControllerDelegate

@optional
- (void)setDrawingEnabled:(BOOL)enabled;
- (void)setDrawingColor:(NSString *)color;

@end

@interface RSSettingsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *settingsTableView;
@property (nonatomic, strong) NSArray *settings;
@property (nonatomic) BOOL isDrawingEnabled;
@property (nonatomic, strong) NSMutableString *selectedColor;
@property (weak, nonatomic, nullable) id<RSSettingsViewControllerDelegate> delegate;


@end

NS_ASSUME_NONNULL_END
