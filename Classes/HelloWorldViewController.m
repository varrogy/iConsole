//
//  HelloWorldViewController.m
//  HelloWorld
//
//  Created by Nick Lockwood on 10/03/2010.
//  Copyright Charcoal Design 2010. All rights reserved.
//

#import "HelloWorldViewController.h"
#import "iConsole.h"


@implementation HelloWorldViewController

@synthesize label, field, swipeLabel, btnCrash, btnSayHello;

- (void)initGui
{
    self.view.autoresizesSubviews = YES;
    
    self.view.backgroundColor = [UIColor whiteColor];
    label = [[UILabel alloc] initWithFrame:CGRectMake(41.0f, 56.0f, 238.0f, 21.0f)];
    label.autoresizesSubviews = YES;
    label.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
    [label setTextAlignment:UITextAlignmentCenter];
    [self.view addSubview:label];
    
    field = [[UITextField alloc] initWithFrame:CGRectMake(41.0f, 110.0f, 238.0f, 31.0f)];
    field.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    field.delegate = self;
    [field setBorderStyle:UITextBorderStyleRoundedRect];
    [self.view addSubview:field];
    
    UIView *tmpView = [[[UIView alloc] initWithFrame:CGRectMake(41.0f, 151.0f, 238.0f, 73.0f)] autorelease];
    [tmpView setAutoresizesSubviews:YES];
    tmpView.autoresizingMask = UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleLeftMargin;
    
    self.btnCrash = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btnCrash setFrame:CGRectMake(126.0f, 20.0f, 92.0f, 37.0f)];
    [btnCrash setTitle:@"Crash" forState:UIControlStateNormal];
    [btnCrash addTarget:self action:@selector(crash:) forControlEvents:UIControlEventTouchUpInside];
    [tmpView addSubview:btnCrash];
    
    btnSayHello = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btnSayHello setFrame:CGRectMake(20.0f, 20.0f, 92.0f, 37.0f)];
    [btnSayHello setTitle:@"Say Hello" forState:UIControlStateNormal];
    [btnSayHello addTarget:self action:@selector(sayHello:) forControlEvents:UIControlEventTouchUpInside];
    [tmpView addSubview:btnSayHello];
    
    [self.view addSubview:tmpView];
    
    swipeLabel = [[UILabel alloc] initWithFrame:CGRectMake(41.0f, 371.0f, 238.0f, 81.0f)];
    swipeLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleTopMargin;
    [swipeLabel setTextAlignment:UITextAlignmentCenter];
    [swipeLabel setNumberOfLines:3];
    [swipeLabel setLineBreakMode:UILineBreakModeWordWrap];
    [self.view addSubview:swipeLabel];
}

- (void)sayHello:(id)sender
{	
	NSString *text = field.text;
	if ([text isEqualToString:@""])
	{
		text = @"World";
	}
	
	label.text = [NSString stringWithFormat:@"Hello %@", text];
	[iConsole info:@"Said '%@'", label.text];
}

- (void)crash:(id)sender
{
	[[NSException exceptionWithName:@"HelloWorldException" reason:@"Demonstrating crash logging" userInfo:nil] raise];
}

- (void)viewDidLoad
{
    [self initGui];
    
    [iConsole sharedConsole].delegate = self;
    
	int touches = (TARGET_IPHONE_SIMULATOR ? SIMULATOR_CONSOLE_TOUCHES: DEVICE_CONSOLE_TOUCHES);
	if (touches > 0 && touches < 11)
	{
		self.swipeLabel.text = [NSString stringWithFormat:
								@"\nSwipe up with %i finger%@ to show the console",
								touches, (touches != 1)? @"s": @""];
	}
	else if (TARGET_IPHONE_SIMULATOR ? SIMULATOR_SHAKE_TO_SHOW_CONSOLE: DEVICE_SHAKE_TO_SHOW_CONSOLE)
	{
		self.swipeLabel.text = @"\nShake device to show the console";
	}
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{	
	[textField resignFirstResponder];
	[self sayHello:self];
	return YES;
}

- (void)handleConsoleCommand:(NSString *)command
{
	if ([command isEqualToString:@"version"])
	{
		[iConsole info:@"%@ version %@",
		 [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"],
		 [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"]];
	}
	else 
	{
		[iConsole error:@"unrecognised command, try 'version' instead"];
	}
}

- (void)viewDidUnload
{
	self.label = nil;
	self.field = nil;
	self.swipeLabel = nil;
    self.btnCrash = nil;
    self.btnSayHello = nil;
}

- (void)dealloc
{
	[label release];
	[field release];
	[swipeLabel release];
    [btnCrash release];
    [btnSayHello release];
    [super dealloc];
}

@end
