//
//  iConsole.h
//  iConsole
//
//  Created by Nick Lockwood on 20/12/2010.
//  Copyright 2010 Charcoal Design. All rights reserved.
//

#import <UIKit/UIKit.h>


#define LOG_LEVEL_NONE 0
#define LOG_LEVEL_CRASH 1
#define LOG_LEVEL_ERROR 2
#define LOG_LEVEL_WARNING 3
#define LOG_LEVEL_INFO 4

#define VERBOSE 1 // Verbose logging (Pretty function names and Line numbers)

#define CONSOLE_ENABLED 0 //suggest setting this is as a compiler macro instead
#define LOG_LEVEL LOG_LEVEL_INFO //minimum logging level
#define ADD_CRASH_HANDLER 1 //add automatic crash logging
#define USE_GOOGLE_STACK_TRACE 1 //use GTM functions to improve stack trace
#define SAVE_LOG_TO_DISK 1 //save log between launches, required for crash logging
#define MAX_LOG_ITEMS 1000

#define SIMULATOR_CONSOLE_TOUCHES 2 //touches to show/hide console on simulator
#define DEVICE_CONSOLE_TOUCHES 3 //touches to show/hide console on device

#define SIMULATOR_SHAKE_TO_SHOW_CONSOLE 1 //show/hide console when simulating shake
#define DEVICE_SHAKE_TO_SHOW_CONSOLE 0 //show/hide console when device is shaken

#define CONSOLE_BRANDING @"iConsole: Copyright © 2010 Charcoal Design"
#define CONSOLE_INPUT_PLACEHOLDER @"Enter command..."

#define LOG_SUBMIT_EMAIL @"" //default email address to submit logs

#define CONSOLE_BACKGROUND_COLOR [UIColor blackColor]
#define CONSOLE_TEXT_COLOR [UIColor greenColor]
#define CONSOLE_BUTTON_TYPE UIButtonTypeInfoLight

#if CONSOLE_ENABLED > 0
    #if VERBOSE > 0
    #	define DLog(fmt, ...) [iConsole log:(@"%s [row %d.] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__];
    #	define DInfo(fmt, ...) [iConsole info:(@"%s [row %d.] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__];
    #	define DWarning(fmt, ...) [iConsole warn:(@"%s [row %d.] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__];
    #	define DError(fmt, ...) [iConsole error:(@"%s [row %d.] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__];
    #	define DCrash(fmt, ...) [iConsole crash:(@"%s [row %d.] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__];
    #else
    #	define DLog(fmt, ...) [iConsole log:(fmt), ##__VA_ARGS__];
    #	define DInfo(fmt, ...) [iConsole info:(fmt), ##__VA_ARGS__];
    #	define DWarning(fmt, ...) [iConsole warn:(fmt), ##__VA_ARGS__];
    #	define DError(fmt, ...) [iConsole error:(fmt), ##__VA_ARGS__];
    #	define DCrash(fmt, ...) [iConsole crash:(fmt), ##__VA_ARGS__];
    #endif
    #define ALog(...) NSLog(__VA_ARGS__)
#else
    #define DLog(...) /* */
    #define DInfo(fmt, ...) /* */
    #define DWarning(fmt, ...) /* */
    #define DError(fmt, ...) /* */
    #define DCrash(fmt, ...) /* */
#endif

@protocol iConsoleDelegate

- (void)handleConsoleCommand:(NSString *)command;

@end


@interface iConsole : UIViewController <UITextFieldDelegate, UIActionSheetDelegate>

@property (nonatomic, assign) id<iConsoleDelegate> delegate;

+ (iConsole *)sharedConsole;

+ (void)log:(NSString *)format, ...;
+ (void)info:(NSString *)format, ...;
+ (void)warn:(NSString *)format, ...;
+ (void)error:(NSString *)format, ...;
+ (void)crash:(NSString *)format, ...;

+ (void)clear;

+ (void)show;
+ (void)hide;

@end
