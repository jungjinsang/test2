//
//  ImplProtocol.m
//  HBNiOSTutorial
//
//  Created by Jung on 2/3/12.
//  Copyright (c) 2012 saltfactory@gmail.com. All rights reserved.
//

#import "ImplProtocol.h"
#import "PrintMessage.h"

@implementation ImplProtocol 

-(id)init {
    
    self = [super init];
    PrintMessage *printMessage = [[PrintMessage alloc] init];
    [printMessage echoFromObject];
    return self;
}

#pragma mark - PrintMessage Delegate Method
-(void *) defineHelloMessage {
    NSLog(@"End Delegate");
}

@end
