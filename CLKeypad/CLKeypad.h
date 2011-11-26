//
//  CLKeypad.h
//  CLKeypad
//
//  Created by Cayden Liew on 11/25/11.
//  Copyright (c) 2011 Cayden Liew http://caydenliew.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLToolbar.h"

@protocol CLKeypadDelegate <NSObject> 

- (void)hideCLKeypad;
- (void)numberPressed:(NSInteger)number;

@end
@interface CLKeypad : UIView <CLToolbarDelegate> 

@property (nonatomic, retain) CLToolbar *toolbar;
@property (nonatomic, retain) id <CLKeypadDelegate> delegate;

@end
