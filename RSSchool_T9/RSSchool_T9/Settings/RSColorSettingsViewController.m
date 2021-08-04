//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Надежда Зенкова
// On: 30.07.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "RSColorSettingsViewController.h"
#import "RSSettingsViewController.h"
#import "UIColor+RSHexString.h"

@interface RSColorSettingsViewController ()

//@property (strong, nonatomic) RSSettingsViewController *settingsViewController;
@property (strong, nonatomic) NSIndexPath *lastSelection;

//@property (strong, nonatomic) NSMutableString *selectedColor;

@end

@implementation RSColorSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor: UIColor.whiteColor];
    //[self setupNavigationItems];
    [self setupColors];
    [self setupTableView];
    self.selectedColor = [NSMutableString stringWithString:@"#92003b"];
}

- (void)setupNavigationItems {
    //self.navigationController.navigationBar.tintColor = UIColor.redColor;
    //[self.navigationController.navigationBar setBackgroundColor: UIColor.whiteColor];
    //self.navigationItem.title = @"Settings";
}

- (void) setupTableView {
    self.colorsTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleInsetGrouped];
    [self.colorsTableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"ColorCellId"];
    
    [self.view addSubview:self.colorsTableView];
    self.colorsTableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints:@[
                                             [self.colorsTableView.topAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.topAnchor constant:0.0],
                                             [self.colorsTableView.leadingAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.leadingAnchor constant:0.0],
                                             [self.colorsTableView.trailingAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.trailingAnchor constant:0.0],
                                             [self.colorsTableView.bottomAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.bottomAnchor constant:0.0]
                                             ]];
    self.colorsTableView.dataSource = self;
    self.colorsTableView.delegate = self;
    self.colorsTableView.alwaysBounceVertical = NO;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ColorCellId" forIndexPath:indexPath];
    //UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"SettingsCellId"];
    NSMutableString *color = self.colors[indexPath.row];
    cell.textLabel.text = color;
    cell.textLabel.textColor = [UIColor initWithHexString:color];
    if (self.selectedColor != nil) {
        if ([color isEqualToString: self.selectedColor]) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            self.lastSelection = indexPath;
        } else {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        
    }
    //cell.accessoryType = color == self.selectedColor ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    //cell.accessoryType = UITableViewCellAccessoryCheckmark;
    cell.tintColor = UIColor.redColor;
    return cell;
}

-(void)changeDrawing {
    
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.colors.count;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.lastSelection != nil) {
        [tableView cellForRowAtIndexPath: self.lastSelection].accessoryType = UITableViewCellAccessoryNone;
    }
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
    self.lastSelection = indexPath;
    self.selectedColor = [[tableView cellForRowAtIndexPath:indexPath].textLabel.text mutableCopy];
    [self.delegate setDrawingColor:self.selectedColor];
    //RSSettingsViewController *settingsViewController = [r]
    //if ([self.navigationController.viewControllers.firstObject isKindOfClass:[RSSettingsViewController class]]) {
    //    self.navigationController.viewcontrollers.firstObject.
        //self.settingsViewController = [RSSettingsViewController new];
    //}
    
    [self.settingsViewController.settingsTableView reloadData];
    [self.navigationController popToRootViewControllerAnimated:true];//popToViewController:self.settingsViewController animated:true];
    self.settingsViewController.selectedColor = self.selectedColor;
    [self.colorsTableView deselectRowAtIndexPath:indexPath animated:true];
}

- (void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    //[tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
    //[self.navigationController popToRootViewControllerAnimated:true];
    //[self.colorsTableView deselectRowAtIndexPath:indexPath animated:true];
}

- (void) setupColors {
    self.colors = [[NSArray alloc] initWithObjects:@"#be2813", @"#3802da", @"#467c24", @"#808080", @"#8e5af7", @"#f07f5a", @"#f3af22", @"#3dacf7", @"#e87aa4", @"#0f2e3f", @"#213711", @"#511307", @"#92003b", nil];
}

- (void)setDrawingColor:(NSString *)color {
    self.selectedColor = [color mutableCopy];
}

@end
