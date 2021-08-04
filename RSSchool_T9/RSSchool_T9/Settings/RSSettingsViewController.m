//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Надежда Зенкова
// On: 28.07.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "RSSettingsViewController.h"
#import "RSColorSettingsViewController.h"
#import "UIColor+RSHexString.h"
#import <RSSchool_T9-Swift.h>

@interface RSSettingsViewController () <RSColorSettingsViewControllerDelegate>

//@property (strong, nonatomic) RSItemsViewController *itemsViewController;

@property (strong, nonatomic) RSColorSettingsViewController *colorsViewController;


@end

@implementation RSSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor: UIColor.whiteColor];//[UIColor colorWithRed:229.0/255 green:229.0/255 blue:229.0/255 alpha:1.0]];
    self.selectedColor = [NSMutableString stringWithString:@"#92003b"];
    self.isDrawingEnabled = NO;
    [self setupNavigationItems];
    [self setupRows];
    [self setupTableView];
    
}

- (void)setupNavigationItems {
    self.navigationController.navigationBar.tintColor = UIColor.redColor;
    [self.navigationController.navigationBar setBackgroundColor: UIColor.whiteColor];
    self.navigationItem.title = @"Settings";
}

- (void) setupTableView {
    self.settingsTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleInsetGrouped];
    [self.settingsTableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"SettingsCellId"];
    self.settingsTableView.scrollEnabled = NO;
    [self.view addSubview:self.settingsTableView];
    self.settingsTableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints:@[
                                             [self.settingsTableView.topAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.topAnchor constant:0.0],
                                             [self.settingsTableView.leadingAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.leadingAnchor constant:0.0],
                                             [self.settingsTableView.trailingAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.trailingAnchor constant:0.0],
                                             [self.settingsTableView.bottomAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.bottomAnchor constant:0.0]
                                             ]];
    self.settingsTableView.dataSource = self;
    self.settingsTableView.delegate = self;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SettingsCellId" forIndexPath:indexPath];
    NSString *setting = self.settings[indexPath.row];
    if ([setting isEqualToString:@"Draw"]) {
        UITableViewCell *drawCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SettingsCellId"];
        drawCell.textLabel.text = @"Draw stories";
        UISwitch *switchDrawing = [[UISwitch alloc] init];
        [switchDrawing addTarget:self action:@selector(changeDrawingEnabled) forControlEvents:UIControlEventValueChanged];
        [switchDrawing setOn:true];
        drawCell.accessoryView = switchDrawing;
        return drawCell;
    } else {
        UITableViewCell *colorCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"SettingsCellId"];
        colorCell.textLabel.text = @"Stroke color";
        colorCell.detailTextLabel.text = self.selectedColor;
        colorCell.detailTextLabel.textColor = [UIColor initWithHexString:self.selectedColor];
        colorCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return  colorCell;
    }
}

-(void)changeDrawingEnabled {
    self.isDrawingEnabled = !(self.isDrawingEnabled);
    [self.delegate setDrawingEnabled: !self.isDrawingEnabled];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.settings.count;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 1) {
        if (self.colorsViewController == nil) {
            self.colorsViewController = [RSColorSettingsViewController new];
        }
        self.colorsViewController.delegate = self;
        self.colorsViewController.settingsViewController = self;
        [self.navigationController pushViewController:self.colorsViewController animated:true];
    }
    [self.settingsTableView deselectRowAtIndexPath:indexPath animated:true];
}

- (void) setupRows {
    self.settings = [[NSArray alloc] initWithObjects:@"Draw", @"Color", nil];
}

- (void)setDrawingColor:(NSMutableString *)color {
    self.selectedColor = [color mutableCopy];
    [self.delegate setDrawingColor: color];
}

@end
