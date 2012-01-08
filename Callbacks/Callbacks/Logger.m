//
//  Logger.m
//  Callbacks
//
//  Created by Cheng MingChun on 12/1/5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Logger.h"

@implementation Logger

-(void)sayOuch:(NSTimer *)t
{
  NSLog(@"Ouch!!!!");
}

  //Called each time a chunk of data arrives
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
  NSLog(@"received %lu bytes",[data length]);
  
  if (!incomingData) {
    incomingData = [[NSMutableData alloc] init ];
  }
  [incomingData appendData:data];
}

  //Called when the last chunk has been processed

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
  NSLog(@"Got it all!!");
  NSString *string = [[NSString alloc] initWithData:incomingData encoding:NSUTF8StringEncoding];
  incomingData = nil;
  NSLog(@"String has %lu Characters",[string length]);
  
    //UNcomment the next line to see the entire fetched file
  NSLog(@"The whole string is %@",string);
  
}

  //Called if the fetch fails
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
  NSLog(@"connection Failed: %@",[error localizedDescription]);
  incomingData = nil;
}

-(void)zoneChange:(NSNotification *)note
{
  NSLog(@"The system time zone has changed");
}

@end
