#import "FDAppDelegate.h"
#import "FDViewController.h"
#import "Mobihelp.h"

@implementation FDAppDelegate

@synthesize mainViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];

    mainViewController = [[FDViewController alloc] init];

    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:mainViewController];
    
    self.window.rootViewController = navigationController;
    
    [self mobihelpIntegration];
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)mobihelpIntegration{
    //Initialize configuration
    MobihelpConfig *config = [[MobihelpConfig alloc]initWithDomain:@"yourdomain.freshdesk.com" withAppKey:@"<app key>" andAppSecret:@"<app secret>"];

    config.feedbackType = FEEDBACK_TYPE_NAME_AND_EMAIL_REQUIRED;
    
    //Initialize Mobihelp . This needs to be called only once in the App.
    [[Mobihelp sharedInstance]initWithConfig:config];
}
@end
