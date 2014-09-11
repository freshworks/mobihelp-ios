#import "FDAppDelegate.h"
#import "FDViewController.h"
#import "Mobihelp.h"

@implementation FDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    [self mobihelpIntegration];
    NSLog(@"Mobihelp Initialized");
    
    // Setup Some Custom Data
    [[Mobihelp sharedInstance]addCustomDataForKey:@"Game Difficulty" withValue:@"Hard"];
    [[Mobihelp sharedInstance]addCustomDataForKey:@"Character" withValue:@"Zerg"];
    [[Mobihelp sharedInstance]addCustomDataForKey:@"Level" withValue:@"Zergling"];
    
    // Setup Breadcrumbs
    [[Mobihelp sharedInstance]leaveBreadcrumb: @"Levelled Up to 3"];
    [[Mobihelp sharedInstance]leaveBreadcrumb: @"Attacked Terran base"];
    [[Mobihelp sharedInstance]leaveBreadcrumb: @"Upgraded Fort"];
    
    [self rootControllerSetup];
    return YES;
}

-(void)mobihelpIntegration{
    //Initialize configuration
    MobihelpConfig *config = [[MobihelpConfig alloc]initWithDomain:@"yourdomain.freshdesk.com" withAppKey:@"<app key>" andAppSecret:@"<app secret>"];
    config.feedbackType = FEEDBACK_TYPE_NAME_REQUIRED_AND_EMAIL_OPTIONAL;
    
    //Initialize Mobihelp. This needs to be called only once in the App.
    [[Mobihelp sharedInstance]initWithConfig:config];
}

-(void)rootControllerSetup{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    FDViewController *mainViewController = [[FDViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:mainViewController];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
}

@end
