//
//  AppDelegate.h
//  HBNiOSTutorial
//
//  Created by SungKwang Song on 2/1/12.
//  Copyright (c) 2012 saltfactory@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>


@class ViewController, SampleTableViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

@property (strong, nonatomic) SampleTableViewController *tableViewController;

@end
