//
//  SillySnakeTests.m
//  SillySnakeTests
//
//  Created by Annie Lee on 2019/1/22.
//  Copyright © 2019 Annie Lee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Snake.h"

@interface Snake (ForTesting)
- (NSValue*)getNextDot;
- (NSValue*)createDotWithX:(NSInteger)x y:(NSInteger)y;
- (NSValue*)generateFruit;
- (NSValue*)getFruit;
- (NSMutableArray*)getSnakeBody;
@end

@interface SillySnakeTests : XCTestCase

@end

@implementation SillySnakeTests

- (void)testDirectionLeftToUp {
    
    Snake *snake = [[Snake alloc] initWithDirection:SnakeDirectionLeft maxX:9 maxY:9 length:2];
    
    [snake changeDirection:SnakeDirectionUp];
    
    XCTAssertEqual(snake.direction, SnakeDirectionUp);
}

- (void)testDirectionLeftToDown {
    
    Snake *snake = [[Snake alloc] initWithDirection:SnakeDirectionLeft maxX:9 maxY:9 length:2];

    [snake changeDirection:SnakeDirectionDown];
    
    XCTAssertEqual(snake.direction, SnakeDirectionDown);
}

- (void)testDirectionLeftToLeft {
    
    Snake *snake = [[Snake alloc] initWithDirection:SnakeDirectionLeft maxX:9 maxY:9 length:2];

    [snake changeDirection:SnakeDirectionLeft];
    
    XCTAssertEqual(snake.direction, SnakeDirectionLeft);
}

- (void)testDirectionLeftToRight {
    
    Snake *snake = [[Snake alloc] initWithDirection:SnakeDirectionLeft maxX:9 maxY:9 length:2];

    [snake changeDirection:SnakeDirectionRight];
    
    XCTAssertEqual(snake.direction, SnakeDirectionLeft);
}

- (void)testDirectionUpToUp {
    
    Snake *snake = [[Snake alloc] initWithDirection:SnakeDirectionLeft maxX:9 maxY:9 length:2];

    [snake changeDirection:SnakeDirectionUp];
    [snake changeDirection:SnakeDirectionUp];
    
    XCTAssertEqual(snake.direction, SnakeDirectionUp);
}

- (void)testDirectionUpToLeft {
    
    Snake *snake = [[Snake alloc] initWithDirection:SnakeDirectionLeft maxX:9 maxY:9 length:2];

    [snake changeDirection:SnakeDirectionUp];
    [snake changeDirection:SnakeDirectionLeft];
    
    XCTAssertEqual(snake.direction, SnakeDirectionLeft);
}

- (void)testDirectionUpToRight {
    
    Snake *snake = [[Snake alloc] initWithDirection:SnakeDirectionLeft maxX:9 maxY:9 length:2];

    [snake changeDirection:SnakeDirectionUp];
    [snake changeDirection:SnakeDirectionRight];
    
    XCTAssertEqual(snake.direction, SnakeDirectionRight);
}

- (void)testDirectionUpToDown {
    
    Snake *snake = [[Snake alloc] initWithDirection:SnakeDirectionLeft maxX:9 maxY:9 length:2];

    [snake changeDirection:SnakeDirectionUp];
    [snake changeDirection:SnakeDirectionDown];
    
    XCTAssertEqual(snake.direction, SnakeDirectionUp);
}

- (void)testAddBodyLength {
    
    Snake *snake = [[Snake alloc] initWithDirection:SnakeDirectionLeft maxX:9 maxY:9 length:2];

    unsigned long originLength = [snake.body count];
    
    NSValue *dot = [snake createDotWithX:3 y:4];
    [snake addBody:dot];
    
    unsigned long newLength = [snake.body count];

    XCTAssertEqual(newLength, originLength+1);
}

- (void)testAddBodyToFirst {
    
    Snake *snake = [[Snake alloc] initWithDirection:SnakeDirectionLeft maxX:9 maxY:9 length:2];

    NSValue *dot = [snake createDotWithX:3 y:4];
    [snake addBody:dot];

    NSUInteger index = [snake.body indexOfObject:dot];
   
    XCTAssertEqual(index, 0);
}

- (void)testAddValidDot {

    Snake *snake = [[Snake alloc] initWithDirection:SnakeDirectionLeft maxX:9 maxY:9 length:2];

    NSValue *dot = [snake createDotWithX:3 y:4];
    bool added = [snake addBody:dot];
    
    XCTAssertEqual(YES, added);
}

- (void)testAddValidMaxDot {
    
    Snake *snake = [[Snake alloc] initWithDirection:SnakeDirectionLeft maxX:9 maxY:9 length:2];

    NSValue *dot = [snake createDotWithX:9 y:9];
    bool added = [snake addBody:dot];
    
    XCTAssertEqual(YES, added);
}

- (void)testAddValidMinimumDot {
    
    Snake *snake = [[Snake alloc] initWithDirection:SnakeDirectionLeft maxX:9 maxY:9 length:2];

    NSValue *dot = [snake createDotWithX:0 y:0];
    bool added = [snake addBody:dot];
    
    XCTAssertEqual(YES, added);
}

- (void)testAddInvalidExistDot {

    Snake *snake = [[Snake alloc] initWithDirection:SnakeDirectionLeft maxX:9 maxY:9 length:2];

    NSValue *dot = [snake createDotWithX:4 y:4];
    bool added = [snake addBody:dot];
    
    XCTAssertEqual(NO, added);
}

- (void)testAddInvalidOverMaxXDot {
    
    Snake *snake = [[Snake alloc] initWithDirection:SnakeDirectionLeft maxX:9 maxY:9 length:2];

    NSValue *dot = [snake createDotWithX:10 y:5];
    bool added = [snake addBody:dot];
    
    XCTAssertEqual(NO, added);
}

- (void)testAddInvalidNegaDot {
    
    Snake *snake = [[Snake alloc] initWithDirection:SnakeDirectionLeft maxX:9 maxY:9 length:2];

    NSValue *dot = [snake createDotWithX:-5 y:5];
    bool added = [snake addBody:dot];
    
    XCTAssertEqual(NO, added);
}

- (void)testGetNextLeftDot {
    
    Snake *snake = [[Snake alloc] initWithDirection:SnakeDirectionLeft maxX:9 maxY:9 length:1];

    NSValue *dot = [snake createDotWithX:3 y:4];
    NSValue *nextDot = [snake getNextDot];
    
    bool result = [dot isEqualToValue:nextDot];
    
    XCTAssertEqual(result, YES);
}

- (void)testGetNextRightDot {
    
    Snake *snake = [[Snake alloc] initWithDirection:SnakeDirectionRight maxX:9 maxY:9 length:1];
    
    NSValue *dot = [snake createDotWithX:5 y:4];
    NSValue *nextDot = [snake getNextDot];
    
    bool result = [dot isEqualToValue:nextDot];
    
    XCTAssertEqual(result, YES);
}

- (void)testGetNextUpDot {
    
    Snake *snake = [[Snake alloc] initWithDirection:SnakeDirectionUp maxX:9 maxY:9 length:1];
    
    NSValue *dot = [snake createDotWithX:4 y:3];
    NSValue *nextDot = [snake getNextDot];
    
    bool result = [dot isEqualToValue:nextDot];
    
    XCTAssertEqual(result, YES);
}

- (void)testGetNextDownDot {
    
    Snake *snake = [[Snake alloc] initWithDirection:SnakeDirectionDown maxX:9 maxY:9 length:1];
    
    NSValue *dot = [snake createDotWithX:4 y:5];
    NSValue *nextDot = [snake getNextDot];
    
    bool result = [dot isEqualToValue:nextDot];
    
    XCTAssertEqual(result, YES);
}

- (void)testGetNextLeftmostDot {
    
    Snake *snake = [[Snake alloc] initWithDirection:SnakeDirectionLeft maxX:9 maxY:9 length:1];
    
    [snake addBody:[snake createDotWithX:0 y:4]];
    
    NSValue *dot = [snake createDotWithX:9 y:4];
    NSValue *nextDot = [snake getNextDot];
    
    bool result = [dot isEqualToValue:nextDot];
    
    XCTAssertEqual(result, YES);
}

- (void)testGetNextRightmostDot {
    
    Snake *snake = [[Snake alloc] initWithDirection:SnakeDirectionRight maxX:9 maxY:9 length:1];
    
    [snake addBody:[snake createDotWithX:9 y:4]];
    
    NSValue *dot = [snake createDotWithX:0 y:4];
    NSValue *nextDot = [snake getNextDot];
    
    bool result = [dot isEqualToValue:nextDot];
    
    XCTAssertEqual(result, YES);
}

- (void)testGetNextUpmostDot {
    
    Snake *snake = [[Snake alloc] initWithDirection:SnakeDirectionUp maxX:9 maxY:9 length:1];
    
    [snake addBody:[snake createDotWithX:4 y:0]];
    
    NSValue *dot = [snake createDotWithX:4 y:9];
    NSValue *nextDot = [snake getNextDot];
    
    bool result = [dot isEqualToValue:nextDot];
    
    XCTAssertEqual(result, YES);
}

- (void)testGetNextDownmostDot {
    
    Snake *snake = [[Snake alloc] initWithDirection:SnakeDirectionDown maxX:9 maxY:9 length:1];
    
    [snake addBody:[snake createDotWithX:4 y:9]];
    
    NSValue *dot = [snake createDotWithX:4 y:0];
    NSValue *nextDot = [snake getNextDot];
    
    bool result = [dot isEqualToValue:nextDot];
    
    XCTAssertEqual(result, YES);
}

- (void)testGenerateFruit {
    
    Snake *snake = [[Snake alloc] initWithDirection:SnakeDirectionDown maxX:9 maxY:9 length:2];
    
    [snake generateFruit];
    
    NSUInteger index = [snake.body indexOfObject:snake.fruit];
    
    XCTAssertEqual(index, NSNotFound);
}

- (void)testValidMove {
    
    Snake *snake = [[Snake alloc] initWithDirection:SnakeDirectionLeft maxX:3 maxY:3 length:3];
    
    bool moved = [snake move];
    
    XCTAssertEqual(moved, YES);
}

- (void)testInvalidMove {
    
    Snake *snake = [[Snake alloc] initWithDirection:SnakeDirectionLeft maxX:3 maxY:3 length:3];
    
    [snake addBody:[snake createDotWithX:0 y:1]];
    
    bool moved = [snake move];
    
    XCTAssertEqual(moved, NO);
}

@end
