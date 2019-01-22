//
//  SillySnakeTests.m
//  SillySnakeTests
//
//  Created by Annie Lee on 2019/1/22.
//  Copyright © 2019 Annie Lee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Snake.h"

@interface SillySnakeTests : XCTestCase

@end

@implementation SillySnakeTests

- (void)testDirectionLeftToUp {
    
    Snake *snake = [[Snake alloc] init];
    
    [snake changeDirection:UP];
    
    XCTAssertEqual(snake.direction, UP);
}

- (void)testDirectionLeftToDown {
    
    Snake *snake = [[Snake alloc] init];
    
    [snake changeDirection:DOWN];
    
    XCTAssertEqual(snake.direction, DOWN);
}

- (void)testDirectionLeftToLeft {
    
    Snake *snake = [[Snake alloc] init];
    
    [snake changeDirection:LEFT];
    
    XCTAssertEqual(snake.direction, LEFT);
}

- (void)testDirectionLeftToRight {
    
    Snake *snake = [[Snake alloc] init];
    
    [snake changeDirection:RIGHT];
    
    XCTAssertEqual(snake.direction, LEFT);
}

- (void)testDirectionUpToUp {
    
    Snake *snake = [[Snake alloc] init];
    
    [snake changeDirection:UP];
    [snake changeDirection:UP];
    
    XCTAssertEqual(snake.direction, UP);
}

- (void)testDirectionUpToLeft {
    
    Snake *snake = [[Snake alloc] init];
    
    [snake changeDirection:UP];
    [snake changeDirection:LEFT];
    
    XCTAssertEqual(snake.direction, LEFT);
}

- (void)testDirectionUpToRight {
    
    Snake *snake = [[Snake alloc] init];
    
    [snake changeDirection:UP];
    [snake changeDirection:RIGHT];
    
    XCTAssertEqual(snake.direction, RIGHT);
}

- (void)testDirectionUpToDown {
    
    Snake *snake = [[Snake alloc] init];
    
    [snake changeDirection:UP];
    [snake changeDirection:DOWN];
    
    XCTAssertEqual(snake.direction, UP);
}

@end
