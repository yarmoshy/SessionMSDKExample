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
    }
    return self;
}
- (void)present {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:self.data.name message:self.data.message delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:@"Claim", nil];
    
    self.alertView = alertView;
    [alertView show];
}

- (void)dismiss {
    [self.alertView dismissWithClickedButtonIndex:0 animated:YES];
}

// UIAlertViewDelegate

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
