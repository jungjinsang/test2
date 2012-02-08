//
//  ViewController.m
//  HBNiOSTutorial
//
//  Created by SungKwang Song on 2/1/12.
//  Copyright (c) 2012 saltfactory@gmail.com. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    

//        UIImageFromURL( [NSURL URLWithString:@"http://cfile30.uf.tistory.com/image/186A3A384EEAE043315B79"], ^( UIImage * image )
//                       {
//                           [self.view addSubview:[[UIImageView alloc] initWithImage:image]];
//                       }, ^(void){
//                           NSLog(@"%@",@"error!");
//                       });
    
    [self loadAsyncImageFromURL:[NSURL URLWithString:@"http://cfile27.uf.tistory.com/image/1349CD374EA43DFB2EF0B6"] 
                     imageBlock:^(UIImage *image){ 
                         [self.view addSubview:[[UIImageView alloc] initWithImage:image]];
                     } 
                     errorBlock:^(void){
                         NSLog(@"%@", @"error!");
                     }];
}

- (void) loadAsyncImageFromURL:(NSURL *)url  imageBlock:(void (^) (UIImage *image))imageBlock errorBlock:(void(^)(void))errorBlock
{
    dispatch_async( dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0 ), ^(void)
                   {
                       NSData * data = [[NSData alloc] initWithContentsOfURL:url];
                       UIImage * image = [[UIImage alloc] initWithData:data];
                       dispatch_async( dispatch_get_main_queue(), ^(void){
                           if( image != nil )
                           {
                               imageBlock( image );
                           } else {
                               errorBlock();
                           }
                       });
                   });
}

void UIImageFromURL( NSURL * URL, void (^imageBlock)(UIImage * image), void (^errorBlock)(void))
{
    dispatch_async( dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0 ), ^(void)
                   {
                       NSData * data = [[NSData alloc] initWithContentsOfURL:URL];
                       UIImage * image = [[UIImage alloc] initWithData:data];
                       dispatch_async( dispatch_get_main_queue(), ^(void){
                           if( image != nil )
                           {
                               imageBlock( image );
                           } else {
                               errorBlock();
                           }
                       });
                   });
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
