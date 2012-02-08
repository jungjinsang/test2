//
//  MySingleton.h
//  HBNiOSTutorial
//
//  Created by Jung on 2/1/12.
//  Copyright 2012 saltfactory@gmail.com. All rights reserved.
//	File created using Singleton XCode Template by Mugunth Kumar (http://blog.mugunthkumar.com)
//  More information about this template on the post http://mk.sg/89
//  Permission granted to do anything, commercial/non-commercial with this file apart from removing the line/URL above

#import <Foundation/Foundation.h>

@interface MySingleton : NSObject
+ (MySingleton*) sharedInstance;
@end
