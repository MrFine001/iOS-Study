//
// Copyright 2015 Qualcomm Technologies International, Ltd.
//

#import "CSRAssociatedGatewaysListViewController.h"
#import "CSRGatewayTableViewCell.h"
#import "CSRGatewayDetailsViewController.h"
#import "CSRAppStateManager.h"
#import "CSRDatabaseManager.h"
#import "CSRGatewayEntity.h"
#import "CSRmeshStyleKit.h"
#import "CSRConstants.h"
#import "CSRUtilities.h"

@interface CSRAssociatedGatewaysListViewController () <UITableViewDelegate, UITableViewDataSource>
{
   
    NSUInteger selectedIndex;

}

@property (nonatomic) NSMutableArray *gateways;

@end

@implementation CSRAssociatedGatewaysListViewController

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    _gateways = [NSMutableArray new];
    
    //Adjust navigation controller appearance
    self.showNavMenuButton = NO;
    self.showNavSearchButton = NO;
    
    [super adjustNavigationControllerAppearance];
    
    //Set navigation buttons
    _backButton = [[UIBarButtonItem alloc] init];
    _backButton.image = [CSRmeshStyleKit imageOfBack_arrow];
    _backButton.action = @selector(back:);
    _backButton.target = self;
    
    [super addCustomBackButtonItem:_backButton];
    
    //Add table delegates
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    [self refreshDevices:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)dealloc
{
    self.view = nil;
}

- (void)refreshDevices:(id)sender
{
    
    [_gateways removeAllObjects];
    
    _gateways = [[[CSRAppStateManager sharedInstance].selectedPlace.gateways allObjects] mutableCopy];

    //Sort devices alphabetically
    if (_gateways != nil || [_gateways count] != 0) {
        
        NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
        [_gateways sortUsingDescriptors:[NSArray arrayWithObject:sort]];
    }
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65.f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  [_gateways count];
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
    
    CSRGatewayEntity *gateway = (CSRGatewayEntity *)[_gateways objectAtIndex:indexPath.row];
    
    if (gateway) {
        
        cell.iconImageView.image = [CSRmeshStyleKit imageOfGateway];
        cell.iconImageView.image = [cell.iconImageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        cell.iconImageView.tintColor = [UIColor darkGrayColor];
        cell.gatewayNameLabel.text = gateway.name;
        cell.gatewayIPLabel.text = [NSString stringWithFormat:@"%@:%@", gateway.host, gateway.port];
        
    }
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    selectedIndex  = indexPath.row;
    [self performSegueWithIdentifier:@"gatewayDetailsSegue" sender:self];
    
}

#pragma mark UITableViewCell helper

- (void)setCellColor:(UIColor *)color forCell:(UITableViewCell *)cell
{
    CSRGatewayTableViewCell *selectedCell = (CSRGatewayTableViewCell*)cell;
    selectedCell.gatewayNameLabel.textColor = color;
    selectedCell.gatewayIPLabel.textColor = color;
    selectedCell.iconImageView.tintColor = color;
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"gatewayDetailsSegue"]) {
        
        NSLog(@"Gateway selected: %@", [_gateways objectAtIndex:selectedIndex]);
        
        UINavigationController *navigationController = segue.destinationViewController;
        CSRGatewayDetailsViewController *vc = (CSRGatewayDetailsViewController *)navigationController.topViewController;
        vc.gateway = [_gateways objectAtIndex:selectedIndex];
         
    }
}

#pragma mark - Actions

- (IBAction)back:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)addGateway:(id)sender
{
    [self performSegueWithIdentifier:@"addGatewaySegue" sender:self];
}


@end
