//
//  Snake.m
//  SillySnake
//
//  Created by Annie Lee on 2019/1/22.
//  Copyright © 2019 Annie Lee. All rights reserved.
//

#import "Snake.h"
#import <UIKit/UIKit.h>

//@interface Snake()
//
//@end

@implementation Dot
- (id)initWithX:(int)x y:(int)y
{
    if (self = [super init]) {
        self.x = x;
        self.y = y;
    }
    return self;
}
@end

@implementation Snake

- (id) init {
        
    self.direction = LEFT;
    
    [self initSnakeBody];
        
    return self;
}

//- (Dot)makeDotWithX:(int)x andY:(int)y {
//
//    Dot dot;
//
//    dot.x = x;
//    dot.y = y;
//
//    return dot;
//}

- (void)initSnakeBody {
    
    Dot *dots[] = {
        [[Dot alloc] initWithX:50 y:50],
        [[Dot alloc] initWithX:100 y:100]
    };

    for (int i = 0; i < sizeof(dots)/sizeof(dots[0]); i++)
        [self.body addObject:[NSValue valueWithBytes:&dots[i] objCType:@encode(Dot)]];
}

- (void)changeDirection:(SnakeDirection) gesture {
    
    bool changed = YES;
        
    switch (gesture) {
        case RIGHT:
            changed = self.direction != LEFT;
            break;
        case LEFT:
            changed = self.direction != RIGHT;
            break;
        case UP:
            changed = self.direction != DOWN;
            break;
        case DOWN:
            changed = self.direction != UP;
            break;
    }

    if (changed)
        self.direction = gesture;
}

@end
