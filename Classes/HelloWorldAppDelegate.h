//
//  HelloWorldAppDelegate.h
//  HelloWorld
//
//  Created by Nick Lockwood on 10/03/2010.
//  Copyright Charcoal Design 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iConsoleWindow.h"

@class HelloWorldViewController;

@interface HelloWorldAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) iConsoleWindow *window;
@property (nonatomic, retain) HelloWorldViewController *viewController;

@end
