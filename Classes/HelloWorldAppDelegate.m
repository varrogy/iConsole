//
//  HelloWorldAppDelegate.m
//  HelloWorld
//
//  Created by Nick Lockwood on 10/03/2010.
//  Copyright Charcoal Design 2010. All rights reserved.
//

#import "HelloWorldAppDelegate.h"
#import "HelloWorldViewController.h"

@implementation HelloWorldAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{   
    self.window = [[[iConsoleWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    self.viewController = [[[HelloWorldViewController alloc] init] autorelease];    
    self.window.rootViewController = self.viewController;
    [_window makeKeyAndVisible];
    return YES;
}

- (void)dealloc
{
    [_viewController release];
    [_window release];
    [super dealloc];
}

@end
