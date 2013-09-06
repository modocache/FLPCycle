//
//  FLPCycle.h
//  FLPCycle
//
//  Created by Brian Ivan Gesiak on 7/17/13.
//  Copyright (c) 2013 Fullpath, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FLPCycle : NSObject {
    NSArray *_array;
    NSInteger _index;
}

- (id)initWithArray:(NSArray *)array;
+ (id)cycleWithArray:(NSArray *)array;
- (id)nextObject;
- (id)previousObject;
- (void)reset;

@end
