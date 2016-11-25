//
// Copyright 2015 Qualcomm Technologies International, Ltd.
//

#import "CSRAreasMainViewController.h"
#import "CSRDatabaseManager.h"
#import "CSRDevicesManager.h"
#import "CSRAreaTableViewCell.h"
#import "CSRmeshStyleKit.h"
#import "CSRmeshDevice.h"
#import "CSRAreasDetailViewController.h"
#import "CSRAreasSearchMainViewController.h"
#import "CSRLightViewController.h"
#import "CSRUtilities.h"
#import "CSRDeviceEntity.h"
#import "CSRConstants.h"
#import "CSRAppStateManager.h"
#import "CSRSegmentDevicesViewController.h"

@interface CSRAreasMainViewController () <UISearchBarDelegate, UISearchControllerDelegate, UISearchDisplayDelegate, UISearchResultsUpdating, UIToolbarDelegate>

{
    NSUInteger selectedIndex;
}
@property (nonatomic) UISearchController *searchController;
@property (nonatomic) CSRAreasSearchMainViewController *areasSearchListTableViewController;

@property BOOL searchControllerWasActive;
@property BOOL searchControllerSearchFieldWasFirstResponder;

@end

@implementation CSRAreasMainViewController

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Set navigation bar colour
    self.navigationController.navigationBar.barTintColor = [CSRUtilities colorFromHex:kColorBlueCSR];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationItem.backBarButtonItem = nil;
    
    _areasTableView.delegate = self;
    _areasTableView.dataSource = self;
    _areasTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    //search View related calls
    _areasSearchListTableViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"CSRAreasSearchMainViewController"];
    _searchController = [[UISearchController alloc] initWithSearchResultsController:_areasSearchListTableViewController];
    self.searchController.searchResultsUpdater = self;
    [self.searchController.searchBar sizeToFit];
    self.areasTableView.tableHeaderView = self.searchController.searchBar;
    self.searchBar.placeholder = @"Search for areas";
    
    self.searchController.delegate = self;
    self.searchController.dimsBackgroundDuringPresentation = NO;
    self.searchController.searchBar.delegate = self;
    
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    _areasArray = [NSMutableArray new];
    
    [self.areasTableView reloadData];
    
    // restore the searchController's active state
    if (self.searchControllerWasActive) {
        self.searchController.active = self.searchControllerWasActive;
        _searchControllerWasActive = NO;
        
        if (self.searchControllerSearchFieldWasFirstResponder) {
            [self.searchController.searchBar becomeFirstResponder];
            _searchControllerSearchFieldWasFirstResponder = NO;
        }
    }
    
    //Hide search bar
    [self hideSearchBarWithAnimation:YES];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleDataModelChange:)
                                                 name:NSManagedObjectContextDidSaveNotification
                                               object:[[CSRDatabaseManager sharedInstance] managedObjectContext]];
    [self refreshDevices:nil];

}

- (void)refreshDevices:(id)sender
{
    
    [_areasArray removeAllObjects];
    
    _areasArray = [[[CSRAppStateManager sharedInstance].selectedPlace.areas allObjects] mutableCopy];
    
   
    if (_areasArray != nil || [_areasArray count] != 0) {
        NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"areaName" ascending:YES]; //@"name"
        [_areasArray sortUsingDescriptors:[NSArray arrayWithObject:sort]];
   
    }
    
    [self.areasTableView reloadData];
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_areasArray count];
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
    
    CSRAreaTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CSRAreaTableViewCellIdentifier];
    
    if (!cell) {
        cell = [[CSRAreaTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CSRAreaTableViewCellIdentifier];
    }
    
    
    CSRAreaEntity *area = [_areasArray objectAtIndex:indexPath.row];
        
    if (area.areaName != nil)
        cell.areaNameLabel.text = area.areaName;
        
    
    //Create accessory view for each cell
    UIButton *accessoryButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 0., 65., 65.)];
    [accessoryButton setBackgroundImage:[CSRmeshStyleKit imageOfAccessoryGear ] forState:UIControlStateNormal];
    [accessoryButton addTarget:self action:(@selector(accessoryButtonTapped:)) forControlEvents:UIControlEventTouchUpInside];
    accessoryButton.tag = indexPath.row;
    
    cell.accessoryView = accessoryButton;

    
    
    return cell;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CSRAreaEntity *areaEntity = [_areasArray objectAtIndex:indexPath.row];
    CSRmeshArea *area = [[CSRDevicesManager sharedInstance] getAreaFromId:areaEntity.areaID];
    if (area) {
        [[CSRDevicesManager sharedInstance] setSelectedDevice:area.areaDevice];
        [[CSRDevicesManager sharedInstance] setSelectedArea:area];
    }
    selectedIndex = indexPath.row;
    
    [self performSegueWithIdentifier:@"segmentToDevices" sender:self];

}

#pragma mark - Accessory type action

- (void)accessoryButtonTapped:(UIButton*)sender
{
    UIButton *accessoryButton = (UIButton *)sender;
    selectedIndex = accessoryButton.tag;
    [self performSegueWithIdentifier:@"addAreaSegue" sender:sender];
}

- (IBAction)addArea:(id)sender
{
    [self performSegueWithIdentifier:@"addAreaSegue" sender:sender];

}

- (void)handleDataModelChange:(NSNotification*)notification
{
    [_areasArray removeAllObjects];
    _areasArray = [[[CSRAppStateManager sharedInstance].selectedPlace.areas allObjects] mutableCopy];
        
    [_areasTableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([segue.identifier isEqualToString:@"addAreaSegue"] &&[sender isKindOfClass:[UIButton class]]) {
        UINavigationController *navController = (UINavigationController*)[segue destinationViewController];
        CSRAreasDetailViewController *vc = (CSRAreasDetailViewController*)[navController topViewController];
        
        CSRAreaEntity *area = [_areasArray objectAtIndex:selectedIndex];
        vc.areaEntity = area;
    }
    if ([segue.identifier isEqualToString:@"segmentToDevices"]) {
        UINavigationController *navController = (UINavigationController*)[segue destinationViewController];
        CSRSegmentDevicesViewController *vc = (CSRSegmentDevicesViewController*)[navController topViewController];
        CSRAreaEntity *area = [_areasArray objectAtIndex:selectedIndex];
        vc.areaEntity = area;

    }
}

#pragma mark - UISearchBarDelegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    return YES;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self hideSearchBarWithAnimation:YES];
    [searchBar resignFirstResponder];
}


#pragma mark - UISearchResultsUpdating

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    
    NSString *searchText = searchController.searchBar.text;
    NSMutableArray *searchResults = _areasArray;
    
    NSString *strippedString = [searchText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    NSArray *searchItems = nil;
    if (strippedString.length > 0) {
        searchItems = [strippedString componentsSeparatedByString:@" "];
    }
    
    NSMutableArray *andMatchPredicates = [NSMutableArray array];
    
    for (NSString *searchString in searchItems) {
        
        NSMutableArray *searchItemsPredicate = [NSMutableArray array];
        
        
        
        NSExpression *seachFieldName = [NSExpression expressionForKeyPath:@"areaName"];
        NSExpression *searchStringName = [NSExpression expressionForConstantValue:searchString];
        NSPredicate *nameSearchPredicate = [NSComparisonPredicate
                                            predicateWithLeftExpression:seachFieldName
                                            rightExpression:searchStringName
                                            modifier:NSDirectPredicateModifier
                                            type:NSContainsPredicateOperatorType
                                            options:NSCaseInsensitivePredicateOption];
        [searchItemsPredicate addObject:nameSearchPredicate];
        
        NSCompoundPredicate *orMatchPredicates = [NSCompoundPredicate orPredicateWithSubpredicates:searchItemsPredicate];
        [andMatchPredicates addObject:orMatchPredicates];
    }
    
    NSCompoundPredicate *finalCompoundPredicate = [NSCompoundPredicate andPredicateWithSubpredicates:andMatchPredicates];
    searchResults = [[searchResults filteredArrayUsingPredicate:finalCompoundPredicate] mutableCopy];
    
    // hand over the filtered results to our search results table
    
    CSRAreasSearchMainViewController *tableController = (CSRAreasSearchMainViewController *)self.searchController.searchResultsController;
    [tableController.tableView reloadData];
}

#pragma mark - UIStateRestoration

//  we restore several items for state restoration:
//  1) Search controller's active state,
//  2) search text,
//  3) first responder

NSString *const AreasListViewControllerTitleKey = @"AreasListViewControllerTitleKey";
NSString *const AreasListSearchControllerIsActiveKey = @"AreasListSearchControllerIsActiveKey";
NSString *const AreasListSearchBarTextKey = @"AreasListSearchBarTextKey";
NSString *const AreasListSearchBarIsFirstResponderKey = @"AreasListSearchBarIsFirstResponderKey";

- (void)encodeRestorableStateWithCoder:(NSCoder *)coder
{
    [super encodeRestorableStateWithCoder:coder];
    
    [coder encodeObject:self.title forKey:AreasListViewControllerTitleKey];
    
    UISearchController *searchController = self.searchController;
    
    BOOL searchDisplayControllerIsActive = searchController.isActive;
    [coder encodeBool:searchDisplayControllerIsActive forKey:AreasListSearchControllerIsActiveKey];
    
    if (searchDisplayControllerIsActive) {
        [coder encodeBool:[searchController.searchBar isFirstResponder] forKey:AreasListSearchBarIsFirstResponderKey];
    }
    
    [coder encodeObject:searchController.searchBar.text forKey:AreasListSearchBarTextKey];
}

- (void)decodeRestorableStateWithCoder:(NSCoder *)coder
{
    [super decodeRestorableStateWithCoder:coder];
    
    self.title = [coder decodeObjectForKey:AreasListViewControllerTitleKey];
    _searchControllerWasActive = [coder decodeBoolForKey:AreasListSearchControllerIsActiveKey];
    _searchControllerSearchFieldWasFirstResponder = [coder decodeBoolForKey:AreasListSearchBarIsFirstResponderKey];
    
    // restore the text in the search field
    self.searchController.searchBar.text = [coder decodeObjectForKey:AreasListSearchBarTextKey];
}


#pragma mark - Hide SearchBar

- (void)hideSearchBarWithAnimation:(BOOL)animated
{
    
    if ([[CSRDevicesManager sharedInstance] getTotalAreas] > 0) {
        
        [self.areasTableView setContentOffset:CGPointMake(0, 44) animated:YES];
        
    }
    
}


#pragma mark - Navigation Bar item menthods

- (IBAction)showSearch:(id)sender
{
    [self.areasTableView scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:NO];
    [self.searchController setActive:YES];
    [self.searchBar becomeFirstResponder];
}


@end
