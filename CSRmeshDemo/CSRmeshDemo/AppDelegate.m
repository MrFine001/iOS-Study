//
// Copyright 2015 Qualcomm Technologies International, Ltd.
//

#import "AppDelegate.h"
#import "CSRDatabaseManager.h"
#import "CSRAppStateManager.h"
#import "CSRUtilities.h"
#import "CSRmeshSettings.h"
#import "CSRWatchManager.h"
#import "CSRMesh/TimeModelApi.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    // Set the global cloud host URL
    if ([CSRUtilities getValueFromDefaultsForKey:kCSRGlobalCloudHost]) {
        
        [CSRAppStateManager sharedInstance].globalCloudHost = [CSRUtilities getValueFromDefaultsForKey:kCSRGlobalCloudHost];
        
    } else {
        
        [CSRAppStateManager sharedInstance].globalCloudHost = kCloudServerUrl;
        
    }
    
    // Check if there is a place in DB
    [[CSRAppStateManager sharedInstance] createDefaultPlace];

    // Setup current place to be available from the start
    [[CSRAppStateManager sharedInstance] setupPlace];
    
    [[CSRAppStateManager sharedInstance] switchConnectionForSelectedBearerType:CSRSelectedBearerType_Bluetooth];
    
    // Check for externally passed URL - place import
    if (launchOptions[@"UIApplicationLaunchOptionsURLKey"])
    {
        [self application:application openURL:launchOptions[@"UIApplicationLaunchOptionsURLKey"] sourceApplication:nil annotation:launchOptions];
    }
    
    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Broadcast time
    [self broadcastTime];
    
}

//- (void)applicationDidEnterBackground:(UIApplication *)application
//{
//    
//}
- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [[CSRDatabaseManager sharedInstance] saveContext];
    [[CSRAppStateManager sharedInstance] connectivityCheck];
}


- (void)applicationWillTerminate:(UIApplication *)application
{
//    [[CSRConnectionManager sharedInstance] shutDown];
    [[CSRDatabaseManager sharedInstance] saveContext];
}

- (BOOL) application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    
    if (url != nil && [url isFileURL]) {
        _managePlacesViewController = [[CSRManagePlacesViewController alloc] init];
        [_managePlacesViewController setImportedURL:url];
        _passingURL = url;
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kCSRImportPlaceDataNotification
                                                        object:self
                                                      userInfo:nil];
    return YES;
}

#define SecondsPerHour  3600

-(void)broadcastTime {
    
    // Compute timezone, BST -> GMT=1 | Delhi=+5.5
    
    [[TimeModelApi sharedInstance] broadcastTimeWithCurrentTime:@([[NSDate date] timeIntervalSince1970] * 1000)
                                                       timeZone:@(([[NSTimeZone localTimeZone] secondsFromGMT]) / SecondsPerHour)
                                                     masterFlag:@1];
    
}


@end
