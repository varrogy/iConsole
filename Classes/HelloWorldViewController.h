//
//  HelloWorldViewController.h
//  HelloWorld
//
//  Created by Nick Lockwood on 10/03/2010.
//  Copyright Charcoal Design 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iConsole.h"


@interface HelloWorldViewController : UIViewController <UITextFieldDelegate, iConsoleDelegate>


@property (nonatomic, retain) UILabel *label;
@property (nonatomic, retain) UITextField *field;
@property (nonatomic, retain) UILabel *swipeLabel;
@property (nonatomic, retain) UIButton *btnCrash;
@property (nonatomic, retain) UIButton *btnSayHello;


-(void)sayHello:(id)sender;
-(void)crash:(id)sender;


@end