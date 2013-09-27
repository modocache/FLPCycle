//
//  FLPCycleSpec.m
//  FLPCycle
//
//  Created by Brian Ivan Gesiak on 9/27/13.
//  Copyright 2013 Fullpath, LLC. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "FLPCycle.h"

SPEC_BEGIN(FLPCycleSpec)

describe(@"FLPCycle", ^{
    __block FLPCycle *cycle = nil;

    describe(@"-nextObject", ^{
        context(@"when the cycle is empty", ^{
            beforeEach(^{
                cycle = [[FLPCycle alloc] init];
            });

            it(@"returns nil", ^{
                [[cycle nextObject] shouldBeNil];
            });
        });

        context(@"when the cycle has one object", ^{
            beforeEach(^{
                NSArray *array = [NSArray arrayWithObjects:@"red", nil];
                cycle = [FLPCycle cycleWithArray:array];
            });

            it(@"returns that one object", ^{
                [[[cycle nextObject] should] equal:@"red"];
                [[[cycle nextObject] should] equal:@"red"];
            });
        });

        context(@"when the cycle has multiple objects", ^{
            beforeEach(^{
                NSArray *array = [NSArray arrayWithObjects:@"red", @"green", @"refactor", nil];
                cycle = [FLPCycle cycleWithArray:array];
            });

            it(@"cycles through the objects", ^{
                [[[cycle nextObject] should] equal:@"red"];
                [[[cycle nextObject] should] equal:@"green"];
                [[[cycle nextObject] should] equal:@"refactor"];
                [[[cycle nextObject] should] equal:@"red"];
            });
        });
    });

    describe(@"-previousObject", ^{
        context(@"when the cycle is empty", ^{
            beforeEach(^{
                cycle = [[FLPCycle alloc] init];
            });

            it(@"returns nil", ^{
                [[cycle previousObject] shouldBeNil];
            });
        });

        context(@"when the cycle has one object", ^{
            beforeEach(^{
                NSArray *array = [NSArray arrayWithObjects:@"red", nil];
                cycle = [FLPCycle cycleWithArray:array];
            });

            it(@"returns that one object", ^{
                [[[cycle previousObject] should] equal:@"red"];
                [[[cycle previousObject] should] equal:@"red"];
            });
        });

        context(@"when the cycle has multiple objects", ^{
            beforeEach(^{
                NSArray *array = [NSArray arrayWithObjects:@"red", @"green", @"refactor", nil];
                cycle = [FLPCycle cycleWithArray:array];
            });

            it(@"cycles through the objects", ^{
                [[[cycle previousObject] should] equal:@"refactor"];
                [[[cycle previousObject] should] equal:@"green"];
                [[[cycle previousObject] should] equal:@"red"];
                [[[cycle previousObject] should] equal:@"refactor"];
            });
        });
    });

    describe(@"-reset", ^{
        it(@"returns the cycle to the beginning", ^{
            NSArray *array = [NSArray arrayWithObjects:@"red", @"green", nil];
            cycle = [FLPCycle cycleWithArray:array];
            [cycle nextObject];

            [cycle reset];

            [[[cycle nextObject] should] equal:@"red"];
        });
    });
});

SPEC_END
