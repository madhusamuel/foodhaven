/****
 *    BDLocationManager+BDPointSDK.h
 *
 *    Copyright (C) 2015 Bluedot.  All rights reserved.
 */

#import <Foundation/Foundation.h>

#import "BDPSessionDelegate.h"
#import "BDPLocationDelegate.h"

/**
  @brief Convenience Protocol aggregating @ref BDPSessionDelegate and @ref BDPLocationDelegate.

  @see <a href="https://github.com/Bluedot-Innovation/PointSDK-SampleApp-iOS/blob/1.3/BDPoint/EXAppDelegate.m">EXAppDelegate.m</a> from the <a href="https://github.com/Bluedot-Innovation/PointSDK-SampleApp-iOS">PointSDK-SampleApp-iOS</a> sample project, for an example of @ref BDPointDelegate implementation.
*/
@protocol BDPointDelegate <BDPSessionDelegate, BDPLocationDelegate>

@end
