//
// Copyright 2015 Qualcomm Technologies International, Ltd.
//

#import <UIKit/UIKit.h>
#import "CSRMainViewController.h"

@interface CSRFavouritesCollectionViewController : CSRMainViewController <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;

@property (nonatomic, retain) NSMutableArray *collectionArray;
@property (nonatomic, retain) NSMutableArray *favouritesArray;

@end
