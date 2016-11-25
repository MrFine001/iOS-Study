//
// Copyright 2015 Qualcomm Technologies International, Ltd.
//

#import "CSRAreasSearchMainViewController.h"
#import "CSRAreaTableViewCell.h"
#import "CSRAreasDetailViewController.h"
#import "CSRmeshStyleKit.h"

@interface CSRAreasSearchMainViewController ()
{
    NSUInteger selectedIndex;
}

@end

@implementation CSRAreasSearchMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CSRAreaTableViewCell" bundle:nil] forCellReuseIdentifier:CSRAreaTableViewCellIdentifier];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65.f;
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _filteredAreasArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CSRAreaTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CSRAreaTableViewCellIdentifier];
    
    if (!cell) {
        cell = [[CSRAreaTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CSRAreaTableViewCellIdentifier];
    }
    
    if (_filteredAreasArray && [_filteredAreasArray count] > 0) {
        
        NSDictionary *areasDict = [_filteredAreasArray objectAtIndex:indexPath.row];
        
        NSLog(@"filtered item: %@", areasDict);
        
        if ([[areasDict allKeys] count] > 0) {
            
            if ([areasDict[@"type"] isEqualToString:@"light"]) {
                
                cell.areaNameLabel.text = areasDict[@"name"];

            } else if ([areasDict[@"type"] isEqualToString:@"temperature"]) {
                
                cell.areaNameLabel.text = areasDict[@"name"];
                
            } else if ([areasDict[@"type"] isEqualToString:@"lock"]) {
                
                cell.areaNameLabel.text = areasDict[@"name"];
                
            }
        }
        
    }
    
    //Create accessory view for each cell
    UIButton *accessoryButton = [[UIButton alloc] initWithFrame:CGRectMake(0., 0., 30., 30.)];
    [accessoryButton setBackgroundImage:[CSRmeshStyleKit imageOfGear] forState:UIControlStateNormal];
    [accessoryButton addTarget:self action:(@selector(accessoryButtonTapped:)) forControlEvents:UIControlEventTouchUpInside];
    accessoryButton.tag = indexPath.row;
    
    cell.accessoryView = accessoryButton;
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"searchedAreaConfigurationSegue"]) {
        CSRAreasDetailViewController *vc = segue.destinationViewController;
        vc.area = [_filteredAreasArray objectAtIndex:selectedIndex];
    }
}

#pragma mark - Accessory type action

- (void)accessoryButtonTapped:(id)sender
{
    UIButton *accessoryButton = (UIButton *)sender;
    NSLog(@"Acessory button tapped at index: %li", (long)accessoryButton.tag);
    selectedIndex = accessoryButton.tag;
    [self performSegueWithIdentifier:@"searchedAreaConfigurationSegue" sender:self];
}

@end
