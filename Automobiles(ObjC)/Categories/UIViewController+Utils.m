//
//  UIViewController+Utils.m
//  PotBoiler
//
//  Created by Nikita Efimenko on 11/7/15.
//  Copyright © 2015 Nikita Efimenko. All rights reserved.
//

#import "UIViewController+Utils.h"

@implementation UIViewController (Utils)

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"OK"
                                                     style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction *action){}];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
                   handler:(void(^)())handler {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"OK"
                                                     style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction *action){
                                                       handler();
                                                   }];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
