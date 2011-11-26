//
//  ViewController.h
//  CLKeypadDemo
//
//  Created by Cayden Liew on 11/26/11.
//  Copyright (c) 2011 Cayden Liew - http://caydenliew.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLKeypad.h"

@interface ViewController : UIViewController<UITextFieldDelegate, CLKeypadDelegate> {
    CLKeypad *keypad;
}

@end
