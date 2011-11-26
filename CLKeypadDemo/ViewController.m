//
//  ViewController.m
//  CLKeypadDemo
//
//  Created by Cayden Liew on 11/26/11.
//  Copyright (c) 2011 Cayden Liew - http://caydenliew.com. All rights reserved.
//

#import "ViewController.h"

#define KEYBOARD_HEIGHT 220

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    int width = 200, height =30;
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - width/2,
                                                                           100,
                                                                           width, 
                                                                           height)];
    textField.borderStyle = UITextBorderStyleLine;
    textField.placeholder = @"tap here";
    [self.view addSubview:textField];
    textField.delegate = self;
    [textField release];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    if (keypad == nil) {
        keypad = [[CLKeypad alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, KEYBOARD_HEIGHT)];
        keypad.delegate = self;
    }
//    if (textField.inputAccessoryView == nil) 
//        [textField setInputAccessoryView:keypad.toolbar];
//    if (textField.inputView == nil) 
//        textField.inputView = keypad;
}

#pragma mark CLKeypadDelegate

- (void)hideCLKeypad {
    for (UITextField *view in self.view.subviews) {
        if ([view isKindOfClass:[UITextField class]] && view.isFirstResponder) {
            [view resignFirstResponder];
        }
    }
}

- (void)numberPressed:(NSInteger)number {
    for (UITextField *view in self.view.subviews) {
        if ([view isKindOfClass:[UITextField class]] && view.isFirstResponder) {
            if (number <= 9) 
                view.text = [NSString stringWithFormat:@"%@%d",view.text, number];
            //decimal point
            else if (number == 10) {
                if ([view.text rangeOfString:@"."].location == NSNotFound)
                    view.text = [NSString stringWithFormat:@"%@.", view.text];
            }
            //0
            else if (number == 11) 
                view.text = [NSString stringWithFormat:@"%@0", view.text];
            //backspace
            else if (number == 12) {
                if ([view.text length] > 0)
                    view.text = [view.text substringToIndex:[view.text length] - 1];
                else
                    view.text = @"";
            }
        }
    }
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
