//
//  SMCustomAchievementActivity.m
//  SDKIntegrationSample
//
//  Created by Kevin Yarmosh on 9/9/14.
//  Copyright (c) 2014 sessionm. All rights reserved.
//

#import "SMCustomAchievementActivity.h"

@implementation SMCustomAchievementActivity

-(id)initWithAchievmentData:(SMAchievementData *)theData {
    if(self = [super initWithAchievmentData:theData]) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dismiss) name:UIApplicationWillResignActiveNotification object:nil];
    }
    return self;
}

-(void)dealloc {
    // Be sure to hide any custom achievement UI that may be present upon app going to background,
    // as the acheivement will be invalid upon coming back to foreground. 
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillResignActiveNotification object:nil];
}

- (void)present {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:self.data.name message:self.data.message delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:@"Claim", nil];
    
    self.alertView = alertView;
    [alertView show];
}

- (void)dismiss {
    [self.alertView dismissWithClickedButtonIndex:0 animated:NO];
}

#pragma mark - UIAlertViewDelegate

- (void)didPresentAlertView:(UIAlertView *)alertView {
    [super notifyPresented];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    self.alertView = nil;
    if(buttonIndex == 0) {
        [super notifyDismissed:SMAchievementDismissTypeCanceled];
    } else if (buttonIndex == 1) {
        [super notifyDismissed:SMAchievementDismissTypeClaimed];
    }
}

@end
