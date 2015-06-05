#import "FDViewController.h"
#import "Mobihelp.h"

@interface FDViewController ()

@property (nonatomic) UILabel *supportText;
@property (nonatomic) UIButton *supportButton;
@property (nonatomic) UILabel *talkToUsText;
@property (nonatomic) UIButton *talkToUsButton;
@property (nonatomic) UILabel *appReviewText;
@property (nonatomic) UIButton *appReviewButton;

@end

@implementation FDViewController

@synthesize supportText, supportButton, talkToUsText, talkToUsButton, appReviewText, appReviewButton;

- (void)showSupport:(id)sender {
    //Show the Support View
    [[Mobihelp sharedInstance] presentSupport:self];
}

- (void)showFeedback:(id)sender {
    //Show the Feedback View
    [[Mobihelp sharedInstance] presentFeedback:self];
}

- (void)showAppReview:(id)sender {
    //Show the App Review Dialog
    [[Mobihelp sharedInstance] launchAppReviewRequest];
}

/*
 * Setup up Views
 */

- (void)viewDidLoad{
    [super viewDidLoad];
    NSLog(@"App Launched");
    [self setupSubviews];
    [self setupConstraints];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[Mobihelp sharedInstance]leaveBreadcrumb:@"Launched main viewcontroller"];
    [self updateUnreadNotesCount];
}

/*
 * Show unread Notification Count to User
 */
-(void)updateUnreadNotesCount{
    [[Mobihelp sharedInstance]unreadCountWithCompletion:^(NSInteger count) {
        [[UIApplication sharedApplication]setApplicationIconBadgeNumber:count];
        NSString *supportButtonTitle = (count) ? [NSString stringWithFormat:@"Support(%d)",(int)count] : @"Support";
        NSLog(@"Unread Notes Count %d",(int)count);
        [self.supportButton setTitle:supportButtonTitle forState:UIControlStateNormal];
    }];
}

- (void)setupSubviews {
    
    self.title = @"Mobihelp Sample";
    self.view.frame = [UIScreen mainScreen].bounds;
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    
    supportText = [[UILabel alloc] init];
    [supportText setTranslatesAutoresizingMaskIntoConstraints:NO];
    supportText.text = @"Integrate support in your app to allow users to quickly browse through the FAQs, submit feedback and talk to you directly from within the app in real-time!";
    supportText.font = [UIFont fontWithName:@"HelveticaNeue" size:14.0f];
    supportText.lineBreakMode = NSLineBreakByWordWrapping;
    supportText.textAlignment = NSTextAlignmentCenter;
    supportText.numberOfLines = 0;
    [self.view addSubview:supportText];
    
    supportButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [supportButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [supportButton setTitle:@"Support" forState:UIControlStateNormal];
    [supportButton addTarget:self action:@selector(showSupport:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:supportButton];

    talkToUsText = [[UILabel alloc] init];
    [talkToUsText setTranslatesAutoresizingMaskIntoConstraints:NO];
    talkToUsText.text = @"Integrate Feedback anywhere in the app to collect feedback from your users instantly!";
    talkToUsText.font = [UIFont fontWithName:@"HelveticaNeue" size:14.0f];
    talkToUsText.lineBreakMode = NSLineBreakByWordWrapping;
    talkToUsText.textAlignment = NSTextAlignmentCenter;
    talkToUsText.numberOfLines = 0;
    [self.view addSubview:talkToUsText];
    
    talkToUsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [talkToUsButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [talkToUsButton setTitle:@"Talk To Us" forState:UIControlStateNormal];
    [talkToUsButton addTarget:self action:@selector(showFeedback:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:talkToUsButton];

    appReviewText = [[UILabel alloc] init];
    [appReviewText setTranslatesAutoresizingMaskIntoConstraints:NO];
    appReviewText.text = @"Use the rating prompt to quickly collect ratings from your users and boost your App store rankings!";
    appReviewText.font = [UIFont fontWithName:@"HelveticaNeue" size:14.0f];
    appReviewText.lineBreakMode = NSLineBreakByWordWrapping;
    appReviewText.textAlignment = NSTextAlignmentCenter;
    appReviewText.numberOfLines = 0;
    [self.view addSubview:appReviewText];
    
    appReviewButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [appReviewButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [appReviewButton setTitle:@"App Rate Alert" forState:UIControlStateNormal];
    [appReviewButton addTarget:self action:@selector(showAppReview:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:appReviewButton];
}

- (void)setupConstraints {
    NSDictionary *views = NSDictionaryOfVariableBindings(supportText, supportButton, talkToUsText, talkToUsButton, appReviewText, appReviewButton);
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[supportText]-|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[talkToUsText]-|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[appReviewText]-|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[supportText]-[supportButton]-[talkToUsText]-[talkToUsButton]-[appReviewText]-[appReviewButton]" options:NSLayoutFormatAlignAllCenterX metrics:nil views:views]];
}

@end