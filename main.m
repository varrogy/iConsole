//
//  main.m
//  HelloWorld
//
//  Created by Nick Lockwood on 10/03/2010.
//  Copyright Charcoal Design 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HelloWorldAppDelegate.h"

int main(int argc, char *argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil,  NSStringFromClass([HelloWorldAppDelegate class]));
    [pool release];
    return retVal;
}
