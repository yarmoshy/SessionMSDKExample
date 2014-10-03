//
//  SMPortalBarButtonItem.h
//  SessionM
//
//  Copyright (c) 2012 Session M. All rights reserved.
//

#import <UIKit/UIKit.h>

/*!
 @class SMPortalBarButtonItem
 @abstract Portal bar button item.
 */
@interface SMPortalBarButtonItem : UIBarButtonItem

/*!
 @property presentingController
 @discussion UIViewController object to use as presenting controller for portal view controller.
 */
@property(nonatomic, retain) UIViewController *presentingController;

/*!
 Returns new instance.
 @result New SMPortalBarButtonItem object
 */
+ (SMPortalBarButtonItem *)newInstance;

@end
