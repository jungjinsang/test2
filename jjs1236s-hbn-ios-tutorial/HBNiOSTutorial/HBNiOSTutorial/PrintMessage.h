//
//  PrintMessage.h
//  HBNiOSTutorial
//
//  Created by Jung on 2/3/12.
//  Copyright (c) 2012 saltfactory@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MessageDelegate; // precompile conception

@interface PrintMessage : NSObject
{
    id<MessageDelegate> delegate;
}

@property (nonatomic , retain) id<MessageDelegate> delegate;

-(NSString *) getHelloMessage;
-(void) printNSLog;
-(void) echoFromObject;

@end



@protocol MessageDelegate <NSObject>

@required
- (void *)defineHelloMessage;

@optional
- (NSString *)defineHelloMessage;

@end
