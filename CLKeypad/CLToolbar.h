//
//  CLToolbar.h
//  CLKeypad
//
//  Created by Cayden Liew on 11/25/11.
//  Copyright (c) 2011 Cayden Liew http://caydenliew.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CLToolbarDelegate <NSObject>

- (void)done;

@end
@interface CLToolbar : UIToolbar

@property (nonatomic, retain) id <CLToolbarDelegate> delegate;

@end
