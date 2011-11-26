//
//  CLToolbar.m
//  CLKeypad
//
//  Created by Cayden Liew on 11/25/11.
//  Copyright (c) 2011 Cayden Liew http://caydenliew.com. All rights reserved.
//

#import "CLToolbar.h"

@implementation CLToolbar
@synthesize delegate;

- (void)drawRect:(CGRect)rect {
    //the toolbar image
    UIImage *image = [UIImage imageNamed: @"toolbar.png"];
    [image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    
    [self sizeToFit];
    
    //done button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"Done" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(done) forControlEvents:UIControlEventTouchUpInside];
    
    button.frame = CGRectMake(0, 0, 64, 29);
    
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    UIBarButtonItem *flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    [self setItems:[NSArray arrayWithObjects:flexible, doneButton, nil]];
    
    [doneButton release];
    [button release];
    [flexible release];
}

- (void)done {
    if ([delegate respondsToSelector:@selector(done)]) 
        [delegate done];
}

- (void)dealloc {
    [delegate release];
    [super dealloc];
}

@end
