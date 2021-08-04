//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Надежда Зенкова
// On: 28.07.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RSSettingsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *settingsTableView;
@property (nonatomic, strong) NSArray *settings;
@property (nonatomic) BOOL isDrawingEnabled;
@property (nonatomic, strong) NSMutableString *selectedColor;

@end

NS_ASSUME_NONNULL_END
