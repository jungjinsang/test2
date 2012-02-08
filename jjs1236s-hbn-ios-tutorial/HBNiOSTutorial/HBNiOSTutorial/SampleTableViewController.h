//
//  SampleTableViewController.h
//  HBNiOSTutorial
//
//  Created by Jung on 2/1/12.
//  Copyright (c) 2012 saltfactory@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SampleTableViewController : UITableViewController
{
    
    @private 
    NSArray *items;
}
- (void) loadAsyncImageFromURL:(NSURL *)url  imageBlock:(void (^) (UIImage *image))imageBlock errorBlock:(void(^)(void))errorBlock;
@end
