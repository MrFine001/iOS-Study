

#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>
@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window.rootViewController = [[UIViewController alloc] init];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    CALayer* lay1 = [[CALayer alloc] init];
    lay1.frame = CGRectMake(113, 111, 132, 194);
    lay1.backgroundColor = [[UIColor colorWithRed:1 green:.4 blue:1 alpha:1] CGColor];
    [self.window.layer addSublayer:lay1];
    CALayer* lay2 = [[CALayer alloc] init];
    lay2.backgroundColor = [[UIColor colorWithRed:.5 green:1 blue:0 alpha:1] CGColor];
    lay2.frame = CGRectMake(41, 56, 132, 194);
    [lay1 addSublayer:lay2];
    CALayer* lay3 = [[CALayer alloc] init];
    lay3.backgroundColor = [[UIColor colorWithRed:1 green:0 blue:0 alpha:1] CGColor];
    lay3.frame = CGRectMake(43, 197, 160, 230);
    [self.window.layer addSublayer:lay3];
    
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{

}

- (void)applicationDidEnterBackground:(UIApplication *)application
{

}

- (void)applicationWillEnterForeground:(UIApplication *)application
{

}

- (void)applicationDidBecomeActive:(UIApplication *)application
{

}

- (void)applicationWillTerminate:(UIApplication *)application
{

}

@end
