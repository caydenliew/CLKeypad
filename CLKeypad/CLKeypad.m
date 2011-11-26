//
//  CLKeypad.m
//  CLKeypad
//
//  Created by Cayden Liew on 11/25/11.
//  Copyright (c) 2011 Cayden Liew http://caydenliew.com. All rights reserved.
//

#import "CLKeypad.h"

@implementation CLKeypad
@synthesize toolbar, delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.toolbar = [[CLToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 36)];
        self.toolbar.delegate = self;
        
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    int offset_x = 0, offset_y = 0;
    int width = 107, height = 55;
    for (int i = 1; i <= 12; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = i;
        
        if (i > 1) {
            if (i%3 == 1) {
                offset_x = 0;
                offset_y += height;
            }
            else
                offset_x += width;
        }     
        
        //column 1
        if (i%3 == 1) 
            width = 107;
        //column 2
        else if (i%3 == 2) 
            width = 106;
        //column 3
        else if (i%3 == 0) 
            width = 107;
        
        button.frame = CGRectMake(offset_x, offset_y, width, height);
        [button addTarget:self action:@selector(keypadPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
        //customization
        button.backgroundColor = [UIColor blueColor];
        UIImage *image;
        if (i <= 9) 
            image = [UIImage imageNamed:[NSString stringWithFormat:@"number%d.png",i]];
        else if (i == 10)
            image = [UIImage imageNamed:@"decimal.png"];
        else if (i == 11) 
            image = [UIImage imageNamed:@"number0.png"];
        else if (i == 12)
            image = [UIImage imageNamed:@"backButton.png"];
        
        [button setImage:image forState:UIControlStateNormal];
    }
}

- (void)keypadPressed:(id)sender {
    int number = [sender tag];
    
//    if (number <= 9) 
//        textEntered = [NSString stringWithFormat:@"%@%d",textEntered, number];
//    //decimal point
//    else if (number == 10) 
//        textEntered = [NSString stringWithFormat:@"%@.", textEntered];
//    //0
//    else if (number == 11) 
//        textEntered = [NSString stringWithFormat:@"%@0", textEntered];
//    //backspace
//    else if (number == 12) {
//        if ([textEntered length] > 0)
//            textEntered = [textEntered substringToIndex:[textEntered length] - 1];
//        else
//            textEntered = @"";
//    }
    if ([delegate respondsToSelector:@selector(numberPressed:)]) {
        [delegate numberPressed:number];
    }
}

#pragma mark CLToolbarDelegate

- (void)done {
    if ([delegate respondsToSelector:@selector(hideCLKeypad)]) 
        [delegate hideCLKeypad];
}

- (void)dealloc {
    [toolbar release];
    [delegate release];
    [super dealloc];
}

@end
