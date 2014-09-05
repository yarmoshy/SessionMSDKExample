//
//  ButtonNativeAchievement.m
//  ModernButton
//
//  Created by Gerald Hewes on 8/7/14.
//  Copyright (c) 2014 Gerald Hewes. All rights reserved.
//

#import "ButtonNativeAchievement.h"

@implementation ButtonNativeAchievement

@synthesize alert;

-(id)initWithAchievmentData:(SMAchievementData *)theData {
    self = [super initWithAchievmentData:theData];
    return self;
}

- (void)present {
    alert = [[UIAlertView alloc] initWithTitle:self.data.name
                                       message:self.data.message
                                      delegate:self
                             cancelButtonTitle:@"Dismiss"
                             otherButtonTitles:@"Claim",nil];
    [alert show];
    
}

- (void)didPresentAlertView:(UIAlertView *)alertView {
    [super notifyPresented];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    self.alert = nil;
    if(buttonIndex == 0) {
        [super notifyDismissed:SMAchievementDismissTypeCanceled];
    } else if (buttonIndex == 1) {
        [super notifyDismissed:SMAchievementDismissTypeClaimed];
    }
}

@end
