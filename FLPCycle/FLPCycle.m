//
//  FLPCycle.m
//  FLPCycle
//
//  Created by Brian Ivan Gesiak on 9/27/13.
//  Copyright (c) 2013 Fullpath, LLC. All rights reserved.
//

#import "FLPCycle.h"

@implementation FLPCycle

#pragma mark - Object Lifecycle

- (id)init {
    NSArray *array = [NSArray array];
    return [self initWithArray:array];
}

- (id)initWithArray:(NSArray *)array {
    self = [super init];
    if (self) {
        _array = [array copy];
        _index = 0;
    }
    return self;
}

+ (id)cycleWithArray:(NSArray *)array {
    return [[FLPCycle alloc] initWithArray:array];
}

#pragma mark - Public Interface

- (id)nextObject {
    if ([_array count] == 0) {
        return nil;
    }

    id next = [_array objectAtIndex:_index];

    _index += 1;
    if (_index == [_array count]) {
        _index = 0;
    }

    return next;
}

- (id)previousObject {
    if ([_array count] == 0) {
        return nil;
    }

    _index -= 1;
    if (_index < 0) {
        _index = [_array count] - 1;
    }

    return [_array objectAtIndex:_index];
}

- (void)reset {
    _index = 0;
}

@end
