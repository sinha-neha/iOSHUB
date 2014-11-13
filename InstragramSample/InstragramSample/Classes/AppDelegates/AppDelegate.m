//
//  AppDelegate.m
//  InstragramSample
//
//  Created by Neha Sinha on 31/12/13.
//  Copyright (c) 2013 Mindfire Solutions. All rights reserved.
//

#import "PostToInstagramViewController.h"
#import "UILoadingView.h"
#import "ViewController.h"
#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
	self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
	ViewController* viewCtrl = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
	UINavigationController* navCtrl = [[UINavigationController alloc] initWithRootViewController:viewCtrl];
	
	self.window.rootViewController = navCtrl;
	[self.window makeKeyAndVisible];
	[navCtrl release];
	[viewCtrl release];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark -- Code to show loading view

- (void) showLoadingView:(BOOL)show
{
	if(show)
	{
		if(_loadingView == nil)
			_loadingView = [[UILoadingView loadingView] retain];
		[_loadingView showViewAnimated:NO onView:_window.rootViewController.view];
	}
	else
	{
		[_loadingView removeViewAnimated:NO];
	}
}

- (void) showPostToigViewController
{
	PostToInstagramViewController* postToIgViewC = [[PostToInstagramViewController alloc] initWithNibName:@"PostToInstagramView" bundle:nil];
    UINavigationController* navC = [[UINavigationController alloc]
                                    initWithRootViewController:postToIgViewC];
	_window.rootViewController = navC;
	[navC release];
    _ReleaseObject(postToIgViewC);
}
@end
