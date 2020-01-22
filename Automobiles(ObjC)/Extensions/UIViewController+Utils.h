//
//  UIViewController+Utils.h
//  PotBoiler
//
//  Created by Nikita Efimenko on 11/7/15.
//  Copyright © 2015 Nikita Efimenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIViewController (Utils)

- (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message;

- (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
                   handler:(void(^)())handler;

@end
