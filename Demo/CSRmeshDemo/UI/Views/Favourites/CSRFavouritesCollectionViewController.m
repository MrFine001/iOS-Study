//
// Copyright 2015 Qualcomm Technologies International, Ltd.
//

#import "CSRFavouritesCollectionViewController.h"
#import "CSRFavouritesCollectionViewCell.h"
#import "CSRDeviceEntity.h"
#import "CSRAreaEntity.h"
#import "CSRDatabaseManager.h"
#import "CSRmeshStyleKit.h"
#import "CSRDeviceDetailsViewController.h"
#import "CSRAreasDetailViewController.h"
#import "CSRConstants.h"
#import "CSRDevicesManager.h"
#import "CSRmeshArea.h"
#import "CSRmeshDevice.h"
#import "CSRLightViewController.h"
#import "CSRSegmentDevicesViewController.h"
#import "CSRAppStateManager.h"

@interface CSRFavouritesCollectionViewController ()
{
    NSUInteger selectedIndex;
}

@end

@implementation CSRFavouritesCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations

    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    _collectionArray = [NSMutableArray new];
    _collectionArray = [[CSRAppStateManager sharedInstance].selectedPlace.devices mutableCopy];
//    [[[[CSRDatabaseManager sharedInstance] fetchObjectsWithEntityName:@"CSRDeviceEntity" withPredicate:nil] allObjects] mutableCopy];

    
    NSSet *areasSet = [CSRAppStateManager sharedInstance].selectedPlace.areas;
//    [[CSRDatabaseManager sharedInstance] fetchObjectsWithEntityName:@"CSRAreaEntity" withPredicate:nil];
    for (CSRAreaEntity *areaEntity in areasSet) {
        [_collectionArray addObject:areaEntity];
    }
    
    _favouritesArray = [NSMutableArray new];
    
    [_collectionArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        if ([obj isKindOfClass:[CSRDeviceEntity class]]) {
            CSRDeviceEntity *deviceEntity = (CSRDeviceEntity*)obj;
            if ([deviceEntity.favourite boolValue] == YES) {
                [_favouritesArray addObject:deviceEntity];
            }
            
            
        } else {
            CSRAreaEntity *areaEntity = (CSRAreaEntity*)obj;
            if ([areaEntity.favourite boolValue] == YES) {
                [_favouritesArray addObject:areaEntity];
            }
        }
        
    }];
    
    NSLog(@"_favouritesArray.count :%lu", (unsigned long)_favouritesArray.count);
    
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return _favouritesArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CSRFavouriteCellIdentifier forIndexPath:indexPath];
    
    id obj = [_favouritesArray objectAtIndex:indexPath.row];
    CSRDeviceEntity *deviceEntity = nil;
    CSRAreaEntity *areaEntity = nil;
    
    if ([obj isKindOfClass:[CSRDeviceEntity class]]) {
        deviceEntity = (CSRDeviceEntity*)obj;
    } else if ([obj isKindOfClass:[CSRAreaEntity class]]) {
        areaEntity = (CSRAreaEntity *)obj;
    }
    if (deviceEntity) {
        ((CSRFavouritesCollectionViewCell *)cell).imageView.image = [CSRmeshStyleKit imageOfLight_on];
        ((CSRFavouritesCollectionViewCell *)cell).labelText.text = deviceEntity.name;
    }
    
    if (areaEntity) {
        ((CSRFavouritesCollectionViewCell *)cell).imageView.image = [CSRmeshStyleKit imageOfHouse];
        ((CSRFavouritesCollectionViewCell *)cell).labelText.text = areaEntity.areaName;
        
    }
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    id obj = [_favouritesArray objectAtIndex:indexPath.row];
    selectedIndex = indexPath.row;
    
    
    CSRDeviceEntity *deviceEntity = nil;
    CSRAreaEntity *areaEntity = nil;
    
    if ([obj isKindOfClass:[CSRDeviceEntity class]]) {
        deviceEntity = (CSRDeviceEntity*)obj;
    } else if ([obj isKindOfClass:[CSRAreaEntity class]]) {
        areaEntity = (CSRAreaEntity *)obj;
    }
    
    CSRmeshArea *meshArea = [[CSRDevicesManager sharedInstance] getAreaFromId:areaEntity.areaID];
    CSRmeshDevice *meshDevice = [[CSRDevicesManager sharedInstance] getDeviceFromDeviceId:deviceEntity.deviceId];
    [[CSRDevicesManager sharedInstance] setSelectedDevice:meshDevice];
    [[CSRDevicesManager sharedInstance] setSelectedArea:meshArea];
    
    if (areaEntity || ([deviceEntity.appearance isEqualToNumber:@(CSRApperanceNameLight)] || [deviceEntity.appearance isEqualToNumber:@(CSRApperanceNameLight2)])) {
        [self performSegueWithIdentifier:@"segmentToDevices" sender:self];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"segmentToDevices"]) {
        UINavigationController *navController = (UINavigationController*)[segue destinationViewController];
        CSRSegmentDevicesViewController *vc = (CSRSegmentDevicesViewController*)[navController topViewController];
        
        id obj = [_favouritesArray objectAtIndex:selectedIndex];
        
        if ([obj isKindOfClass:[CSRAreaEntity class]]) {
            vc.areaEntity = (CSRAreaEntity*)obj;
        }
        if ([obj isKindOfClass:[CSRDeviceEntity class]]) {
            vc.deviceEntity = (CSRDeviceEntity*)obj;
        }

    }

}


@end
