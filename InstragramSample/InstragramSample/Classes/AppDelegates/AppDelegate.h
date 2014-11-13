//
//  AppDelegate.h
//  InstragramSample
//
//  Created by Neha Sinha on 31/12/13.
//  Copyright (c) 2013 Mindfire Solutions. All rights reserved.
//

@class UILoadingView;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    UILoadingView*	_loadingView;

}

@property (strong, nonatomic) UIWindow *window;

- (void) showLoadingView:(BOOL)show;
- (void) showPostToigViewController;

@end

#define _gAppDelegate (AppDelegate*)[[UIApplication sharedApplication] delegate]
