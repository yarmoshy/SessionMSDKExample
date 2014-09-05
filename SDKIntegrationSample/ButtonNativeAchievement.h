//
//  ButtonNativeAchievement.h
//  ModernButton
//
//  Created by Gerald Hewes on 8/7/14.
//  Copyright (c) 2014 Gerald Hewes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SessionM.h"

@interface ButtonNativeAchievement : SMAchievementActivity <UIAlertViewDelegate> {

}

@property (nonatomic, strong) UIAlertView *alert;

- (void)present;

- (id)initWithAchievmentData:(SMAchievementData *)theData;
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger) buttonIndex;

@end
