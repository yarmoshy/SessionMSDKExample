//
//  SMViewController.m
//  SDKIntegrationSample
//
//  Created by Kevin Yarmosh on 9/5/14.
//  Copyright (c) 2014 sessionm. All rights reserved.
//

#import "SMViewController.h"
#import "ButtonNativeAchievement.h"

@interface SMViewController ()

@end

#define YOUR_APP_ID @"401c5af1432b5c9a04f99d82a9821541ef88aa86"
#define YOUR_TEST_EVENT @"shoot_bunny"

@implementation SMViewController

@synthesize bigRedButton;
@synthesize bigGreenButton;
@synthesize bigBlueButton;
@synthesize memberSwitch;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Set the delegate so we get notified from the SDK
    [[SessionM sharedInstance] setDelegate:self];
    // Init the SDK
    SMStart(YOUR_APP_ID);
    
    // Create SMPortalButton
    SMPortalButton *portalButton=[SMPortalButton buttonWithType:UIButtonTypeSystem];
    [portalButton.button setTitle:@"Portal Button" forState:UIControlStateNormal];
    portalButton.frame = CGRectMake(40, 40, 100, 30);
    portalButton.layer.cornerRadius = 4;
    portalButton.layer.borderColor = [UIColor blackColor].CGColor;
    portalButton.layer.borderWidth = 1;
    [self.view addSubview:portalButton];
    
    // Manually Enable / Disable Portal Button
    [bigGreenButton setTitle: @"Offline" forState: UIControlStateDisabled ];
    [self updateButton: [SessionM sharedInstance].sessionState ];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)redButtonAction:(id)sender{
    SMAction(YOUR_TEST_EVENT);
}

- (IBAction)greenButtonAction:(id)sender{
    [[SessionM sharedInstance] presentActivity:SMActivityTypePortal];
}

- (IBAction)blueButtonAction:(id)sender{
    
    SMAchievementData *achievementData =
    [SessionM sharedInstance].unclaimedAchievement;
    
    if (achievementData) {
        ButtonNativeAchievement *activity = [[ButtonNativeAchievement alloc] initWithAchievmentData:achievementData];
        [activity present];
    }
    
    
    return;
}

- (IBAction)memberSwitchAction:(id)sender{
    [SessionM sharedInstance].user.isOptedOut = !memberSwitch.on;
    
    
    [self updateButton: [SessionM sharedInstance].sessionState  ];
}

- (void)updateButton:  (SessionMState) state  {
    
    if ([SessionM sharedInstance].user.isOptedOut) {
        [bigGreenButton setTitle: @"OptedOut" forState: UIControlStateNormal ];
    } else {
        [bigGreenButton setTitle: @"Portal" forState: UIControlStateNormal ];
    }
    
    if (state == SessionMStateStartedOnline) {
        bigGreenButton.enabled = YES;
    } else {
        bigGreenButton.enabled = NO;
    }

    // Update the switch
    memberSwitch.on = ![SessionM sharedInstance].user.isOptedOut;
}


#pragma mark SMSessionDelegate

- (void)sessionM: (SessionM *)session didTransitionToState: (SessionMState)state {
    [self updateButton: state ];
    
}

@end
