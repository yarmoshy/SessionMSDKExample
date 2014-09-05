//
//  ButtonNativeAchievement.m
//  ModernButton
//
//  Created by Gerald Hewes on 8/7/14.
//  Copyright (c) 2014 Gerald Hewes. All rights reserved.
//

#import "ButtonNativeAchievement.h"

// This class is a simple way of showing how you can implement
// custom views for claiming achievements. All this class
// does is present a UIAlert with 2 options. Dismiss, or claim.
@implementation ButtonNativeAchievement

-(id)initWithAchievmentData:(SMAchievementData *)theData {
    self = [super initWithAchievmentData:theData];
    return self;
}

- (void)present {
    self.alert = [[UIAlertView alloc] initWithTitle:self.data.name
                                       message:self.data.message
                                      delegate:self
                             cancelButtonTitle:@"Dismiss"
                             otherButtonTitles:@"Claim",nil];
    [self.alert show];
    
}

- (void)didPresentAlertView:(UIAlertView *)alertView {
    [super notifyPresented];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    self.alert = nil;
    if(buttonIndex == 0) {
        // Achievement will not be claimed.
        [super notifyDismissed:SMAchievementDismissTypeCanceled];
    } else if (buttonIndex == 1) {
        // Achievement will be claimed and mPoints added to account.
        [super notifyDismissed:SMAchievementDismissTypeClaimed];
    }
}

@end
