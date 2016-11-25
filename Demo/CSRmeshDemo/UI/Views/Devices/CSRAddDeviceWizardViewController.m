//
// Copyright 2015 Qualcomm Technologies International, Ltd.
//

#import "CSRAddDeviceWizardViewController.h"
#import "CSRNewDeviceTableViewCell.h"
#import "CSRmeshStyleKit.h"
#import "CSRUtilities.h"
#import "CSRMeshUtilities.h"
#import "CSRConstants.h"
#import "CSRBluetoothLE.h"
#import "CSRDevicesManager.h"
#import "CSRmeshSettings.h"
#import "CSRDatabaseManager.h"
#import "CSRWizardPopoverViewController.h"

@interface CSRAddDeviceWizardViewController () <UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate>
{
    BOOL scanState;
    BOOL updateRequired;
    NSInteger selectedDeviceIndex;
    NSUInteger wizardMode;
    NSData *deviceHash;
    NSData *authCode;
    
}

@property (nonatomic) AVCaptureSession *captureSession;
@property (nonatomic) AVCaptureVideoPreviewLayer *videoPreviewLayer;
@property (nonatomic) CALayer *targetLayer;
@property (nonatomic) NSMutableArray *qrCodeObjects;
@property (nonatomic) BOOL isReading;
@property (nonatomic) NSMutableArray *discoveredDevicesArray;

- (BOOL)startQRReading;
- (void)stopQRReading;

@end

@implementation CSRAddDeviceWizardViewController

#pragma mark - View lifecycle

- (id)init
{
    self = [super init];
    
    if (self != nil)
    {
        self.showNavMenuButton = NO;
        self.showNavSearchButton = NO;
    }
    
    return self;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setNeedsStatusBarAppearanceUpdate];
    
    //Set navigation buttons
    _backButton = [[UIBarButtonItem alloc] init];
    _backButton.image = [CSRmeshStyleKit imageOfBack_arrow];
    _backButton.action = @selector(back:);
    _backButton.target = self;
    
    [super addCustomBackButtonItem:_backButton];
    
    [self hideAllViews];
    
    _devicesTableView.delegate = self;
    _devicesTableView.dataSource = self;
    
    //Notifications
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didDiscoverDeviceNotification:)
                                                 name:kCSRmeshManagerDidDiscoverDeviceNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didUpdateAppearanceNotification:)
                                                 name:kCSRmeshManagerDidUpdateAppearanceNotification
                                               object:nil];
    
    scanState = NO;
    updateRequired = NO;
    
    [_activityIndicatorView startAnimating];
    
    //Set initially selected row index to NONE
    selectedDeviceIndex = -1;
    
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(reloadTableDataOnMainThread) userInfo:nil repeats:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    _deviceEntity = nil;
    _selectedDevice = nil;
    deviceHash = nil;
    authCode = nil;
    _uuidStringFromQRScan = nil;
    _acStringFromQRScan = nil;
    
    [self showScreensWithMode:_mode];
    
    // Start the BLE scan
    [[MeshServiceApi sharedInstance] setContinuousLeScanEnabled:YES];
    [[CSRDevicesManager sharedInstance] setDeviceDiscoveryFilter:self mode:YES];
    
    // Disable 'Associate' buttons
    _associateDeviceButton.enabled = NO;
    _associateQRButton.enabled = NO;
    
    //Set initial UUID and AC strings to
    _uuidStringFromQRScan = @"";
    _acStringFromQRScan = @"";
    
    [_devicesTableView reloadData];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    // Stop the BLE scan
    [[MeshServiceApi sharedInstance] setContinuousLeScanEnabled:NO];
    [[CSRDevicesManager sharedInstance] setDeviceDiscoveryFilter:self mode:NO];
}

#pragma mark - Layout Subviews

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        
        _videoPreviewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        _videoPreviewLayer.frame = _qrPreview.layer.bounds;
        _videoPreviewLayer.position = CGPointMake(CGRectGetMidX(_qrPreview.layer.bounds), CGRectGetMidY(_qrPreview.layer.bounds));
        
    });
}

- (void)dealloc
{
    self.view = nil;
}

#pragma mark - Screens/Views configuration

- (void)showScreensWithMode:(CSRAddDeviceWizardMode)mode
{
    
    switch (mode) {
            
        case CSRAddDeviceWizardMode_DevicesList:
            [self setupDeviceList];
            self.title = @"Detected devices list";
            break;
            
        case CSRAddDeviceWizardMode_ScanQRCode:
            [self setupQRmode];
            self.title = @"Scan QR Code";
            break;
            
        default:
            break;
    }
    
}

#pragma mark - Setup Device List screen

- (void)setupDeviceList
{
    [[[CSRDevicesManager sharedInstance] unassociatedMeshDevices] removeAllObjects];
    _devicesListView.hidden = NO;
}

#pragma mark - Setup QR code screen

- (void)setupQRmode
{
    _scanQRview.hidden = NO;
    
    //Set initially capture session to nil
    _captureSession = nil;
    _isReading = NO;
    
    _successTickboxImageView.image = [CSRmeshStyleKit imageOfIconQRScanOk];
    
    _scanSuccessView.backgroundColor = [UIColor clearColor];
    _scanSuccessView.alpha = 0.85;
    _scanSuccessView.hidden = YES;
    
    _qrPreview.layer.borderWidth = 0.5;
    _qrPreview.layer.borderColor = [[CSRUtilities colorFromHex:kColorBlueCSR] CGColor];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [self startQRReading];
    });
}

- (void)hideAllViews
{
    
    for (UIView *view in self.view.subviews) {
        view.hidden = YES;
    }
    
}

#pragma mark - QR reading methods

- (BOOL)startQRReading
{
    
    _scanSuccessView.hidden = YES;
    
    NSError *error;
    
    AVCaptureDevice *captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:captureDevice error:&error];
    
    if (!input) {
        NSLog(@"%@", [error localizedDescription]);
        return NO;
    }
    
    //Initialize the captureSession object.
    _captureSession = [[AVCaptureSession alloc] init];
    _captureSession.sessionPreset = AVCaptureSessionPresetPhoto;
    // Set the input device on the capture session.
    [_captureSession addInput:input];
    
    
    //Initialize a AVCaptureMetadataOutput object
    AVCaptureMetadataOutput *captureMetadataOutput = [[AVCaptureMetadataOutput alloc] init];
    [_captureSession addOutput:captureMetadataOutput];
    
    //Create a new serial dispatch queue.
    dispatch_queue_t dispatchQueue;
    dispatchQueue = dispatch_queue_create("QRQueue", NULL);
    [captureMetadataOutput setMetadataObjectsDelegate:self queue:dispatchQueue];
    [captureMetadataOutput setMetadataObjectTypes:[NSArray arrayWithObject:AVMetadataObjectTypeQRCode]];
    
    //Initialize the video preview layer
    _videoPreviewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:_captureSession];
    _videoPreviewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    _videoPreviewLayer.frame = _qrPreview.layer.bounds;
    _videoPreviewLayer.position = CGPointMake(CGRectGetMidX(_qrPreview.layer.bounds), CGRectGetMidY(_qrPreview.layer.bounds));
    [_qrPreview.layer addSublayer:_videoPreviewLayer];
    
    self.targetLayer = [CALayer layer];
    self.targetLayer.frame = _qrPreview.layer.bounds;
    [_qrPreview.layer insertSublayer:self.targetLayer above:_videoPreviewLayer];
    
    [_captureSession startRunning];
    
    return YES;
}

- (void)stopQRReading
{
    [_captureSession stopRunning];
    _captureSession = nil;
    [_videoPreviewLayer removeFromSuperlayer];

}

- (void)prepareQRDataFromString:(NSString *)qrDataString;
{
    
    if ([CSRUtilities isString:qrDataString containsCharacters:@"https://mesh.example.com"]) {
        qrDataString = [qrDataString substringFromIndex:29];
    } else {
        qrDataString = [qrDataString substringFromIndex:1];
    }
    
    NSMutableArray *qrDataArray = [NSMutableArray arrayWithArray:[qrDataString componentsSeparatedByString:@"&"]];
    NSLog(@"qrDataArray: %@", qrDataArray);
    
    
    for (NSString *string in qrDataArray) {
        
        if ([CSRUtilities isString:string containsCharacters:@"UUID="]) {
            
            NSRange range = [string rangeOfString:@"UUID="];
            _uuidStringFromQRScan = [string substringFromIndex:range.length];
            NSLog(@"uuidString: %@", _uuidStringFromQRScan);
            
        } else if ([CSRUtilities isString:string containsCharacters:@"AC="]) {
            
            NSRange range = [string rangeOfString:@"AC="];
            _acStringFromQRScan = [string substringFromIndex:range.length];
            NSLog(@"acString: %@", _acStringFromQRScan);
            
        } else {
            
            _uuidStringFromQRScan = @"";
            _acStringFromQRScan = @"";
            
        }
        
    }
    
}

#pragma mark - AVCaptureMetadataOutputObjectsDelegate method

- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    
    _qrCodeObjects = [NSMutableArray new];
    
    for (AVMetadataObject *metadataObject in metadataObjects) {
        
        AVMetadataObject *transformedObject = [_videoPreviewLayer transformedMetadataObjectForMetadataObject:metadataObject];
        [_qrCodeObjects addObject:transformedObject];
        
        
        
        
    }
    
    
    
    // Check if the metadataObjects array is not nil and it contains at least one object.
    if (metadataObjects != nil && [metadataObjects count] > 0) {
        // Get the metadata object.
        
        AVMetadataMachineReadableCodeObject *metaDataObject = [metadataObjects objectAtIndex:0];
        
        if ([[metaDataObject type] isEqualToString:AVMetadataObjectTypeQRCode]) {
            // If the found metadata is equal to the QR code metadata then update the status label's text,
            // stop reading and change the bar button item's title and the flag's value.
            // Everything is done on the main thread.
            
            NSLog(@"metaDataObject: %@", [metaDataObject stringValue]);
            
            [self performSelectorOnMainThread:@selector(prepareQRDataFromString:) withObject:[metaDataObject stringValue] waitUntilDone:NO];
            [self performSelectorOnMainThread:@selector(stopReading) withObject:nil waitUntilDone:YES];
            [_qrTriggerButton performSelectorOnMainThread:@selector(setTitle:) withObject:@"Scan again" waitUntilDone:NO];
            
            _qrTriggerButton.accessibilityLabel = @"QRbutton";
            
            _isReading = NO;
        }
        
    }
    
}

#pragma mark - Visual aid methods

- (void)clearTargetLayer
{
    NSArray *sublayers = [[self.targetLayer sublayers] copy];
    for (CALayer *sublayer in sublayers)
    {
        [sublayer removeFromSuperlayer];
    }
}

- (void)showDetectedObjects
{
    for (AVMetadataObject *object in _qrCodeObjects)
    {
        if ([object isKindOfClass:[AVMetadataMachineReadableCodeObject class]])
        {
            CAShapeLayer *shapeLayer = [CAShapeLayer layer];
            shapeLayer.strokeColor = [UIColor redColor].CGColor;
            shapeLayer.fillColor = [UIColor clearColor].CGColor;
            shapeLayer.lineWidth = 2.0;
            shapeLayer.lineJoin = kCALineJoinRound;
            CGPathRef path = createPathForPoints([(AVMetadataMachineReadableCodeObject *)object corners]);
            shapeLayer.path = path;
            CFRelease(path);
            [self.targetLayer addSublayer:shapeLayer];
        }
    }
}

CGMutablePathRef createPathForPoints(NSArray* points)
{
    CGMutablePathRef path = CGPathCreateMutable();
    CGPoint point;
    
    if ([points count] > 0)
    {
        CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)[points objectAtIndex:0], &point);
        CGPathMoveToPoint(path, nil, point.x, point.y);
        
        int i = 1;
        while (i < [points count])
        {
            CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)[points objectAtIndex:i], &point);
            CGPathAddLineToPoint(path, nil, point.x, point.y);
            i++;
        }
        
        CGPathCloseSubpath(path);
    }
    
    return path;
}

- (void)stopReading
{
    
    _associateQRButton.enabled = YES;
    
    [self clearTargetLayer];
    [self showDetectedObjects];
    
    // Stop video capture and make the capture session object nil.
    [_captureSession stopRunning];
    _captureSession = nil;
    
    // Remove the video preview layer from the viewPreview view's layer.
    
    _deviceEntity = nil;
    __block BOOL alreadyPresent = NO;
    NSSet *devices = [[CSRDatabaseManager sharedInstance] fetchObjectsWithEntityName:@"CSRDeviceEntity" withPredicate:nil];
    
    if (_uuidStringFromQRScan && ![CSRUtilities isStringEmpty:_uuidStringFromQRScan] && ![CSRUtilities isStringEmpty:_acStringFromQRScan] && ([CSRUtilities isStringContainsValidHexCharacters:_uuidStringFromQRScan] && [CSRUtilities isStringContainsValidHexCharacters:_acStringFromQRScan]) && [CSRMeshUtilities isStringValidUUIDString:_uuidStringFromQRScan]) {
        
        _successTickboxImageView.image = [CSRmeshStyleKit imageOfIconQRScanOk];
        _scanSuccessView.hidden = NO;
        [_qrTriggerButton setTitle:@"Scan again" forState:UIControlStateNormal];
        
        [devices enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
            CSRDeviceEntity *device = (CSRDeviceEntity *)obj;
            if ([[[NSString alloc] initWithData:device.authCode encoding:NSUTF8StringEncoding] isEqualToString:_acStringFromQRScan]) {
                alreadyPresent = YES;
                *stop = YES;
            }
        }];
        
        if (alreadyPresent == NO) {
            
            NSData *acData = [CSRUtilities dataFromHexString:_acStringFromQRScan];
            
            _deviceEntity = [NSEntityDescription insertNewObjectForEntityForName:@"CSRDeviceEntity" inManagedObjectContext:[CSRDatabaseManager sharedInstance].managedObjectContext];
            
            [_deviceEntity setUuid:[CSRUtilities dataFromHexString:_uuidStringFromQRScan]];
            [_deviceEntity setAuthCode:acData];
            
            NSData *hashData = [[MeshServiceApi sharedInstance] getDeviceHashFromUuid:[CSRMeshUtilities CBUUIDWithFlatUUIDString:_uuidStringFromQRScan]];
            
            [[CSRDevicesManager sharedInstance] addScannedDevice:[[CSRDevicesManager sharedInstance] addDeviceWithDeviceHash:hashData authCode:acData]];
            
            [_deviceEntity setDeviceHash:hashData];
            [_deviceEntity setDeviceId:[[CSRDatabaseManager sharedInstance] getNextFreeDeviceNumber]];
            
            
            [[CSRDatabaseManager sharedInstance] saveContext];
            
        }
        
        _associateQRButton.enabled = YES;
        
        [_devicesTableView reloadData];
        
    } else {
        
        //Alert view or something
        
        _successTickboxImageView.image = [CSRmeshStyleKit imageOfIconQRScanFail];
        _scanSuccessView.hidden = NO;
        [_qrTriggerButton setTitle:@"Scan again" forState:UIControlStateNormal];
        
        _associateQRButton.enabled = NO;
        
    }
    

}

#pragma mark - Actions

- (IBAction)back:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)toggleQRScan:(id)sender
{
    if (!_isReading) {
        
        if ([self startQRReading]) {
            
            [_qrTriggerButton setTitle:@"Scan again" forState:UIControlStateNormal];
            
        }
        
    } else {
        
        [self startQRReading];
        [_qrTriggerButton setTitle:@"Scan again" forState:UIControlStateNormal];
        
    }
    _isReading = !_isReading;
}

- (IBAction)cancelAll:(id)sender
{
    [[[CSRDevicesManager sharedInstance] unassociatedMeshDevices] removeAllObjects];
    _deviceEntity = nil;
    _selectedDevice = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kCSRmeshManagerDidDiscoverDeviceNotification object:nil];

    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)done:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Association actions

- (IBAction)devicesListAssociate:(id)sender
{
        NSData *localHash = [[MeshServiceApi sharedInstance] getDeviceHashFromUuid:(CBUUID*)_selectedDevice.uuid];
        CSRmeshDevice *localDevice = [[CSRDevicesManager sharedInstance] checkPreviouslyScannedDevicesWithDeviceHash:localHash];
    
        // Check if device was previously scanned (QR) and there is database entry for it
        if (_selectedDevice && localDevice) {
            
            wizardMode = CSRWizardPopoverMode_AssociationFromDeviceList;
            authCode = localDevice.authCode;
            [self performSegueWithIdentifier:@"wizardPopoverSegue" sender:self];

        } else if (_selectedDevice) {
            
            wizardMode = CSRWizardPopoverMode_SecurityCode;
            [self performSegueWithIdentifier:@"wizardPopoverSegue" sender:self];
        }
}

- (IBAction)qrScanAssociate:(id)sender
{
    
    _scanSuccessView.hidden = YES;

    NSData *hashData = [[MeshServiceApi sharedInstance] getDeviceHashFromUuid:[CSRMeshUtilities CBUUIDWithFlatUUIDString:_uuidStringFromQRScan]];

    NSLog(@"UUID: %@\nCBUUID: %@", _uuidStringFromQRScan, [CSRMeshUtilities CBUUIDWithFlatUUIDString:_uuidStringFromQRScan].UUIDString);

    NSLog(@"hash data: %@", hashData);
    
    wizardMode = CSRWizardPopoverMode_AssociationFromQRScan;
    deviceHash = hashData;
    authCode = [CSRUtilities dataFromHexString:_acStringFromQRScan];

    [self performSegueWithIdentifier:@"wizardPopoverSegue" sender:self];
    
}

#pragma mark - Steps animation

- (void)animateStepsBetweenFirstView:(UIView *)firstView andSecondView:(UIView *)secondView
{
    
    [secondView setTransform:(CGAffineTransformMakeScale(0.8f, 0.8f))];
    secondView.alpha = 0.f;
    secondView.hidden = NO;
    
    [UIView animateWithDuration:0.5
                          delay:0.1
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         firstView.alpha = 0.f;
                         [firstView setTransform:(CGAffineTransformMakeScale(1.2f, 1.2f))];
                         
                         secondView.alpha = 1.f;
                         [secondView setTransform:(CGAffineTransformMakeScale(1.0f, 1.0f))];

    } completion:^(BOOL finished) {
        firstView.hidden = YES;
        
    }];
}

#pragma mark - UITextFieldDelegate methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[CSRDevicesManager sharedInstance] unassociatedMeshDevices] count];
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
    
    CSRNewDeviceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CSRNewDeviceTableViewCellIdentifier];
    
    if (!cell) {
        cell = [[CSRNewDeviceTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CSRNewDeviceTableViewCellIdentifier];
    }
    
    CSRmeshDevice *device = [[[CSRDevicesManager sharedInstance] unassociatedMeshDevices] objectAtIndex:indexPath.row];
    
    if (device) {
        
        NSString *deviceName;
            
        if (![CSRUtilities isStringEmpty:[[NSString alloc] initWithData:device.appearanceShortname encoding:NSUTF8StringEncoding]]) {
            deviceName = [[NSString alloc] initWithData:device.appearanceShortname encoding:NSUTF8StringEncoding];

                [cell.deviceActivityIndicator stopAnimating];
                cell.deviceActivityIndicator.hidden = YES;

            
        } else {
            deviceName = @"Retrieving device name";

                [cell.deviceActivityIndicator startAnimating];
                cell.deviceActivityIndicator.hidden = NO;

        }
            
        cell.deviceNameLabel.text = deviceName;
        cell.deviceUUIDLabel.text = device.uuid.UUIDString;
        if ([CSRUtilities isString:deviceName containsCharacters:@"Light"]) {
            cell.iconImageView.image = [CSRmeshStyleKit imageOfLight_on];
            cell.iconImageView.image = [cell.iconImageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
            cell.iconImageView.tintColor = [UIColor darkGrayColor];
        } else if ([CSRUtilities isString:deviceName containsCharacters:@"Switch"]) {
            cell.iconImageView.image = [CSRmeshStyleKit imageOfLock_off];
            cell.iconImageView.image = [cell.iconImageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
            cell.iconImageView.tintColor = [UIColor darkGrayColor];
        } else if ([CSRUtilities isString:deviceName containsCharacters:@"Sensor"]) {
            cell.iconImageView.image = [CSRmeshStyleKit imageOfTemperature_off];
            cell.iconImageView.image = [cell.iconImageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
            cell.iconImageView.tintColor = [UIColor darkGrayColor];
        } else if ([CSRUtilities isString:deviceName containsCharacters:@"Heater"]) {
            cell.iconImageView.image = [CSRmeshStyleKit imageOfTemperature_on];
            cell.iconImageView.image = [cell.iconImageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
            cell.iconImageView.tintColor = [UIColor darkGrayColor];
        }
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (selectedDeviceIndex == indexPath.row) {
        [self setCellColor:[CSRUtilities colorFromHex:kColorAmber600] forCell:cell];
    } else {
       [self setCellColor:[UIColor darkGrayColor] forCell:cell];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CSRNewDeviceTableViewCell *cell = (CSRNewDeviceTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    [self setCellColor:[CSRUtilities colorFromHex:kColorAmber600] forCell:cell];

    selectedDeviceIndex = indexPath.row;
    _selectedDevice = nil;
    
    NSArray *unassociatedMeshDevices = [[CSRDevicesManager sharedInstance] unassociatedMeshDevices];
    
    if (unassociatedMeshDevices && indexPath.row<unassociatedMeshDevices.count>0 && indexPath.row<unassociatedMeshDevices.count) {
        
        _selectedDevice = [unassociatedMeshDevices objectAtIndex:indexPath.row];
        
    }
    
    if (_selectedDevice) {
        
        if (!_selectedDevice.isAssociated) {
            
            [[CSRDevicesManager sharedInstance] setAttentionPreAssociation:_selectedDevice.deviceHash attentionState:@(1) withDuration:@(6000)];
            
            _associateDeviceButton.enabled = YES;
            
        }
        
    }
    
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CSRNewDeviceTableViewCell *cell = (CSRNewDeviceTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
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
    CSRNewDeviceTableViewCell *selectedCell = (CSRNewDeviceTableViewCell*)cell;
    selectedCell.deviceNameLabel.textColor = color;
    selectedCell.deviceUUIDLabel.textColor = color;
    selectedCell.iconImageView.tintColor = color;
}

#pragma mark - Table reload

- (void)reloadTable
{
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [_devicesTableView reloadData];
    }];
}

#pragma mark - Notifications handlers

-(void)didDiscoverDeviceNotification:(NSNotification *)notification
{
    if (![self alreadyDiscoveredDeviceFilteringWithDeviceUUID:(NSUUID *)notification.userInfo[kDeviceUuidString]]) {
        [[CSRDevicesManager sharedInstance] addDeviceWithUUID:notification.userInfo [kDeviceUuidString] andRSSI:notification.userInfo [kDeviceRssiString]];
    
        [self reloadTable];
    }

    if ([[[CSRDevicesManager sharedInstance] unassociatedMeshDevices] count] > 0) {
        
        [_activityIndicatorView stopAnimating];
        
    }
}

- (void)didUpdateAppearanceNotification:(NSNotification *)notification
{
    NSData *updatedDeviceHash = notification.userInfo [kDeviceHashString];
    NSData *appearanceValue = notification.userInfo [kAppearanceValueString];
    NSData *shortName = notification.userInfo [kShortNameString];
    if (![self alreadyDiscoveredDeviceFilteringWithDeviceHash:notification.userInfo[kDeviceHashString]]) {
        [[CSRDevicesManager sharedInstance] updateAppearance:updatedDeviceHash appearanceValue:appearanceValue shortName:shortName];
    }
    
    updateRequired = YES;
}

#pragma mark - Hmmmm


- (void)reloadTableDataOnMainThread
{
    if (updateRequired) {
        updateRequired = NO;
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [_devicesTableView reloadData];
        }];
    }
}

#pragma mark - Device filtering

- (BOOL)alreadyDiscoveredDeviceFilteringWithDeviceUUID:(NSUUID *)uuid
{
    for (id value in [[CSRDevicesManager sharedInstance] unassociatedMeshDevices]) {
        if ([value isKindOfClass:[CSRmeshDevice class]]) {
            CSRmeshDevice *device = value;
            if ([device.uuid.UUIDString isEqualToString:uuid.UUIDString]) {
                return YES;
            }
        }
    }
    
    return NO;
}

- (BOOL)alreadyDiscoveredDeviceFilteringWithDeviceHash:(NSData *)data
{
    for (id value in [[CSRDevicesManager sharedInstance] unassociatedMeshDevices]) {
        if ([value isKindOfClass:[CSRmeshDevice class]]) {
            CSRmeshDevice *device = value;
            if ([device.deviceHash isEqualToData:data]) {
                return YES;
            }
        }
    }
    
    return NO;
}

#pragma mark - Alert controller

- (void)showAlertViewControllerWithMessage:(NSString *)message
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Validation"
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action) {
                                                         }];
    
    
    [alert addAction:cancelAction];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([segue.identifier isEqualToString:@"wizardPopoverSegue"]) {
        
        CSRWizardPopoverViewController *vc = segue.destinationViewController;
        vc.mode = wizardMode;
        vc.meshDevice = _selectedDevice;
        vc.authCode = authCode;
        vc.deviceHash = deviceHash;
        
        vc.popoverPresentationController.delegate = self;
        vc.popoverPresentationController.presentedViewController.view.layer.borderColor = [[UIColor lightGrayColor] CGColor];
        vc.popoverPresentationController.presentedViewController.view.layer.borderWidth = 0.5;
        
        vc.preferredContentSize = CGSizeMake(self.view.frame.size.width - 20., 150.);
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

@end
