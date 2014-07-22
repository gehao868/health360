//
//  DEMOMenuViewController.m
//  REFrostedViewControllerStoryboards
//
//  Created by Roman Efimov on 10/9/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "MenuViewController.h"

#import "DashBoardViewController.h"
#import "TargetViewController.h"
#import "DeviceViewController.h"
#import "HealthDataViewController.h"
#import "ConnectViewController.h"
#import "RewardViewController.h"
#import "ProfileViewController.h"

#import "UIViewController+REFrostedViewController.h"


@interface MenuViewController ()

@end

@implementation MenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.separatorColor = [UIColor colorWithRed:235/255.0f green:255/255.0f blue:170/255.0f alpha:1.0f];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.opaque = NO;
    self.tableView.backgroundColor = [UIColor colorWithRed:70.0f/255.0f green:160.0f/255.0f blue:100.0f/255.0f alpha:1.0f];
    self.tableView.tableHeaderView = ({
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 184.0f)];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 40, 100, 100)];
        imageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        imageView.image = [UIImage imageNamed:@"avatar.jpg"];
        imageView.layer.masksToBounds = YES;
        imageView.layer.cornerRadius = 50.0;
        imageView.layer.borderColor = [UIColor whiteColor].CGColor;
        imageView.layer.borderWidth = 3.0f;
        imageView.layer.rasterizationScale = [UIScreen mainScreen].scale;
        imageView.layer.shouldRasterize = YES;
        imageView.clipsToBounds = YES;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, 0, 24)];
        label.text = @"Roman Efimov";
        label.font = [UIFont fontWithName:@"HelveticaNeue" size:21];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor colorWithRed:235/255.0f green:255/255.0f blue:170/255.0f alpha:1.0f];
        [label sizeToFit];
        label.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        
        [view addSubview:imageView];
        [view addSubview:label];
        view;
    });
}

#pragma mark -
#pragma mark UITableView Delegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:17];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)sectionIndex
{
    if (sectionIndex == 0)
        return nil;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 34)];
    
//    view.backgroundColor = [UIColor colorWithRed:167/255.0f green:167/255.0f blue:167/255.0f alpha:0.6f];
//    
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 8, 0, 0)];
//    label.text = @"Friends Online";
//    label.font = [UIFont systemFontOfSize:15];
//    label.textColor = [UIColor whiteColor];
//    label.backgroundColor = [UIColor clearColor];
//    [label sizeToFit];
//    [view addSubview:label];
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)sectionIndex
{
    if (sectionIndex == 0)
        return 0;
    
    return 34;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UINavigationController *navigationController = (UINavigationController *)self.frostedViewController.contentViewController;
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        DashBoardViewController *homeViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"homeController"];
        navigationController.viewControllers = @[homeViewController];
    } else if(indexPath.section == 0 && indexPath.row == 1) {
        TargetViewController *secondViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"secondController"];
        navigationController.viewControllers = @[secondViewController];
    } else if(indexPath.section == 0 && indexPath.row == 2) {
        HealthDataViewController *healthController = [self.storyboard instantiateViewControllerWithIdentifier:@"healthController"];
        navigationController.viewControllers = @[healthController];
    } else if(indexPath.section == 0 && indexPath.row == 3) {
        ConnectViewController *connectController = [self.storyboard instantiateViewControllerWithIdentifier:@"connectController"];
        navigationController.viewControllers = @[connectController];
    } else if(indexPath.section == 0 && indexPath.row == 4) {
        RewardViewController *rewardController = [self.storyboard instantiateViewControllerWithIdentifier:@"rewardController"];
        navigationController.viewControllers = @[rewardController];
    } else if(indexPath.section == 0 && indexPath.row == 5) {
        ProfileViewController *profileController = [self.storyboard instantiateViewControllerWithIdentifier:@"profileController"];
        navigationController.viewControllers = @[profileController];
    } else if(indexPath.section == 0 && indexPath.row == 6) {
        DeviceViewController *deviceController = [self.storyboard instantiateViewControllerWithIdentifier:@"deviceController"];
        navigationController.viewControllers = @[deviceController];
    }
    
    [self.frostedViewController hideMenuViewController];
}

#pragma mark -
#pragma mark UITableView Datasource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    if (indexPath.section == 0) {
        NSArray *titles = @[@"DashBoard", @"Target", @"Health Data", @"Connect", @"Rewards", @"Profile", @"Manage Device"];
        NSArray *images = @[[UIImage imageNamed:@"dashboard"],[UIImage imageNamed:@"target"],[UIImage imageNamed:@"connect"],[UIImage imageNamed:@"reward"],[UIImage imageNamed:@"profile"],[UIImage imageNamed:@"profile"],[UIImage imageNamed:@"profile"]];
        cell.textLabel.text = titles[indexPath.row];
        cell.imageView.image = images[indexPath.row];
    }
    
//    else {
//        NSArray *titles = @[@"John Appleseed", @"John Doe", @"Test User"];
//        cell.textLabel.text = titles[indexPath.row];
//    }
    
    return cell;
}
 
@end