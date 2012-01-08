//
//  main.m
//  Callbacks
//
//  Created by Cheng MingChun on 12/1/5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Logger.h"

int main (int argc, const char * argv[])
{

  @autoreleasepool {
      
      // insert code here...
    Logger *logger = [[Logger alloc] init];
    
    [[NSNotificationCenter defaultCenter] addObserver:logger selector:@selector(zoneChange:) name:NSSystemClockDidChangeNotification object:nil];
    
    NSURL *url = [NSURL URLWithString:@"http://www.gutenberg.org/cache/epub/205/pg205.txt"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    __unused NSURLConnection *fetchConn = [[NSURLConnection alloc] initWithRequest:request delegate:logger startImmediately:YES];
    
    __unused NSTimer *time = [NSTimer scheduledTimerWithTimeInterval:2.0 target:logger selector:@selector(sayOuch:) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop] run];
      NSLog(@"Hello, World!");
      
  }
    return 0;
}

