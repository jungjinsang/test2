//
//  ViewController.h
//  HBNiOSTutorial
//
//  Created by SungKwang Song on 2/1/12.
//  Copyright (c) 2012 saltfactory@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

void UIImageFromURL( NSURL * URL, void (^imageBlock)(UIImage * image), void (^errorBlock)(void));

- (void) loadAsyncImageFromURL:(NSURL *)url  imageBlock:(void (^) (UIImage *image))imageBlock errorBlock:(void(^)(void))errorBlock;

@end
