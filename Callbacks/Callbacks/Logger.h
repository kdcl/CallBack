//
//  Logger.h
//  Callbacks
//
//  Created by Cheng MingChun on 12/1/5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Logger : NSObject{

  NSMutableData *incomingData;
  
}

-(void)sayOuch:(NSTimer *)t;



@end
