//
// Copyright 2015 Qualcomm Technologies International, Ltd.
//

#import "CSRGatewayListViewController.h"
#import "CSRGatewayTableViewCell.h"
#import "CSRAppStateManager.h"
#import "CSRMeshUtilities.h"
#import "CSRUtilities.h"
#import "CSRConstants.h"
#import "CSRmeshStyleKit.h"
#import <CSRmesh/CSRGatewayNetService.h>
#import <CSRmesh/CSRIPAddress.h>
#import <CSRmesh/CSRMeshUserManager.h>

@interface CSRGatewayListViewController ()
{
    NSMutableArray *gatewaysArray;
    NSUInteger selectedIndex;
}

@end

@implementation CSRGatewayListViewController

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Select gateway";
    
    //Set navigation bar colour
    self.navigationController.navigationBar.barTintColor = [CSRUtilities colorFromHex:kColorBlueCSR];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationItem.backBarButtonItem = nil;
    
    //Set image on back button
    _backButton.backgroundColor = [UIColor clearColor];
    [_backButton setBackgroundImage:[CSRmeshStyleKit imageOfBack_arrow] forState:UIControlStateNormal];
    [_backButton addTarget:self action:(@selector(back:)) forControlEvents:UIControlEventTouchUpInside];
    
    //Add table delegates
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _tableView.contentInset = UIEdgeInsetsZero;

    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [[CSRNetServiceBrowser sharedInstance] addDelegate:self];
    [[CSRNetServiceBrowser sharedInstance] startBrowsing:@"_csrmeshgw._tcp." domain:@"local"];
    
    //Set initially selected row index to NONE
    selectedIndex = -1;
    
    _connectButton.enabled = NO;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    gatewaysArray = [NSMutableArray new];

}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [gatewaysArray removeAllObjects];
    
    [[CSRNetServiceBrowser sharedInstance] stopBrowsing];
    [[CSRNetServiceBrowser sharedInstance] removeDelegate:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [gatewaysArray count];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Remove seperator inset
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    // Prevent the cell from inheriting the Table View's margin settings
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    
    // Explictly set your cell's layout margins
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CSRGatewayTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CSRGatewayTableViewCellIdentifier];
    
    if (!cell) {
        cell = [[CSRGatewayTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CSRGatewayTableViewCellIdentifier];
    }
    
    CSRGatewayNetService *gateway = (CSRGatewayNetService *)[gatewaysArray objectAtIndex:indexPath.row];
    
    if (gateway) {
        
        cell.iconImageView.image = [CSRmeshStyleKit imageOfGateway];
        cell.iconImageView.image = [cell.iconImageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        cell.gatewayNameLabel.text = gateway.name;
        cell.gatewayIPLabel.text = ((CSRIPAddress *)[gateway.addresses firstObject]).ipAddress;
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (selectedIndex == indexPath.row) {
        [self setCellColor:[CSRUtilities colorFromHex:kColorAmber600] forCell:cell];
    } else {
        [self setCellColor:[UIColor darkGrayColor] forCell:cell];
    }
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CSRGatewayTableViewCell *cell = (CSRGatewayTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    [self setCellColor:[CSRUtilities colorFromHex:kColorAmber600] forCell:cell];
    
    selectedIndex = indexPath.row;
    
    _connectButton.enabled = YES;
    
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CSRGatewayTableViewCell *cell = (CSRGatewayTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    [self setCellColor:[UIColor darkGrayColor] forCell:cell];
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}


#pragma mark UITableViewCell helper

- (void)setCellColor:(UIColor *)color forCell:(UITableViewCell *)cell
{
    CSRGatewayTableViewCell *selectedCell = (CSRGatewayTableViewCell*)cell;
    selectedCell.gatewayNameLabel.textColor = color;
    selectedCell.gatewayIPLabel.textColor = color;
    selectedCell.iconImageView.tintColor = color;
}

#pragma mark - <CSRNetServiceBrowserDelegate>

- (void)didFindService:(CSRNetService *)service
{
    if (service) {
        
        CSRGatewayNetService *gateway = (CSRGatewayNetService *)service;
        
        if ([gateway.addresses count] > 0 && ![self isGatewayAlreadySaved:gateway.gatewayUUID]) {
            
            [gatewaysArray addObject:gateway];
            
            [_tableView reloadData];
            
        }
    }
}

#pragma mark - <UIPopoverPresentationControllerDelegate>

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller
{
    // Return no adaptive presentation style, use default presentation behaviour
    return UIModalPresentationNone;
}

- (BOOL)popoverPresentationControllerShouldDismissPopover:(UIPopoverPresentationController *)popoverPresentationController
{
    return NO;
}

#pragma mark - Actions

- (IBAction)back:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)connectWithGateway:(id)sender
{
    
    [self performSegueWithIdentifier:@"gatewayConnectionSegue" sender:self];
    
}

#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"gatewayConnectionSegue"]) {
        CSRGatewayConnectionViewController *vc = segue.destinationViewController;
        vc.gateway = (CSRGatewayNetService *)[gatewaysArray objectAtIndex:selectedIndex];
        vc.mode = CSRGatewayConnectionMode_All;
        vc.popoverPresentationController.delegate = self;
        vc.popoverPresentationController.presentedViewController.view.layer.borderColor = [[UIColor lightGrayColor] CGColor];
        vc.popoverPresentationController.presentedViewController.view.layer.borderWidth = 0.5;
        
        vc.preferredContentSize = CGSizeMake(self.view.frame.size.width - 20., 205.);
    }
}

#pragma mark - Filter gateways

- (BOOL)isGatewayAlreadySaved:(NSString *)uuid
{
    
    __block BOOL gatewayAlreadySaved = NO;
    
    [[CSRAppStateManager sharedInstance].selectedPlace.gateways enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
        CSRGatewayEntity *gatewayEntity = (CSRGatewayEntity *)obj;
        
        if ([[gatewayEntity.uuid lowercaseString] isEqualToString:uuid]) {
            
            gatewayAlreadySaved = YES;
            
        }
        
    }];
    
    return gatewayAlreadySaved;
}

@end
