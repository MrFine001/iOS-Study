//
// Copyright 2015 Qualcomm Technologies International, Ltd.
//

#import "AppDelegate.h"
#import "CSRDatabaseManager.h"
#import "CSRAppStateManager.h"
#import "CSRUtilities.h"
#import <HockeySDK/HockeySDK.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "CSRmeshSettings.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Set the HockeyApp
    [[BITHockeyManager sharedHockeyManager] configureWithIdentifier:@"daca6ffc5a58bb858a6a8b32a265da3f"];
    [[BITHockeyManager sharedHockeyManager] startManager];
    [[BITHockeyManager sharedHockeyManager].authenticator authenticateInstallation];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    // Set the global cloud host URL
    if ([CSRUtilities getValueFromDefaultsForKey:kCSRGlobalCloudHost]) {
        
        [CSRAppStateManager sharedInstance].globalCloudHost = [CSRUtilities getValueFromDefaultsForKey:kCSRGlobalCloudHost];
        
    } else {
        
        [CSRAppStateManager sharedInstance].globalCloudHost = kCloudServerUrl;
        
    }
    
    // Check if there is a place ind DB
    [[CSRAppStateManager sharedInstance] createDefaultPlace];

    // Setup current place to be available from the start
    [[CSRAppStateManager sharedInstance] setupPlace];
    [[CSRAppStateManager sharedInstance] selectGatewayCommunicationChannel];
    
    
    [[CSRDatabaseManager sharedInstance] loadDatabase];
    
    [[CSRAppStateManager sharedInstance] switchConnectionForSelectedBearerType:CSRSelectedBearerType_Bluetooth];
    
    // Check for externally passed URL - place import
    if (launchOptions[@"UIApplicationLaunchOptionsURLKey"])
    {
        [self application:application openURL:launchOptions[@"UIApplicationLaunchOptionsURLKey"] sourceApplication:nil annotation:launchOptions];
    }
    
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                    didFinishLaunchingWithOptions:launchOptions];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [FBSDKAppEvents activateApp];
}

//- (void)applicationDidEnterBackground:(UIApplication *)application
//{
//    
//}
- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [[CSRDatabaseManager sharedInstance] saveContext];
}


- (void)applicationWillTerminate:(UIApplication *)application
{
    [[CSRDatabaseManager sharedInstance] saveContext];
}

- (BOOL) application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    
//    _loadDatabaseManager = [[CSRLoadDatabaseManager alloc] init];
//    if (url != nil && [url isFileURL]) {
//        [_loadDatabaseManager handleOpenURL:url];
//    }
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    _passingURL = url;
    if (url != nil && [url isFileURL]) {
        _managePlacesViewController = [[CSRManagePlacesViewController alloc] init];
        [_managePlacesViewController setImportedURL:url];
        [[CSRAppStateManager sharedInstance] setIsImportMode:YES];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kCSRImportPlaceDataNotification
                                                        object:self
                                                      userInfo:nil];
    
    return [[FBSDKApplicationDelegate sharedInstance]
            application:application
            openURL:url
            sourceApplication:sourceApplication
            annotation:annotation];
}

@end
