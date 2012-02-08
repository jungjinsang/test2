//
//  PrintMessage.m
//  HBNiOSTutorial
//
//  Created by Jung on 2/3/12.
//  Copyright (c) 2012 saltfactory@gmail.com. All rights reserved.
//

#import "PrintMessage.h"

@implementation PrintMessage
@synthesize delegate;

-(void) echoFromObject {
    
    [delegate defineHelloMessage];
}



@end
