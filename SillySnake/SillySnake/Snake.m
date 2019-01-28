//
//  Snake.m
//  SillySnake
//
//  Created by Annie Lee on 2019/1/22.
//  Copyright © 2019 Annie Lee. All rights reserved.
//

#import "Snake.h"
#import <UIKit/UIKit.h>
#include <stdlib.h>

@interface Snake ()
{
    NSMutableArray *body;
}
@property SnakeDirection direction;
//@property NSMutableArray *body;
@property NSInteger maxX;
@property NSInteger maxY;
@property NSValue *fruit;
@property bool eat;
@end

@implementation Snake

- (instancetype)initWithDirection:(SnakeDirection) direction
                             maxX:(NSInteger)maxX
                             maxY:(NSInteger)maxY
                           length:(NSInteger)length
{
    self = [super init];
    if (self) {
        self.direction = direction;
        self.maxX = maxX;
        self.maxY = maxY;
        body = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < length; i++) {
            
            [body addObject:[self createDotWithX:(self.maxX/2)+i y:self.maxY/2]];
        }
        
        self.fruit = [self generateFruit];
        
        self.eat = NO;
    }
    return self;
}

//- (NSValue*)getFruit {
//
//    return self.fruit;
//}
//
//- (NSArray*)getSnakeBody
//{
//    return self.body;
//}

- (NSArray *)body
{
    return [body copy];
}

- (NSValue*)createDotWithX:(int)x y:(int)y {
    
    Dot dot;
    dot.x = x;
    dot.y = y;
    
    NSValue *nsValue = [NSValue valueWithBytes:&dot objCType:@encode(Dot)];
    
    return nsValue;
}

- (NSValue*)generateFruit {
    
    NSValue *food = [[NSValue alloc] init];
    NSUInteger index = 0;
    
    do {
        int randomX = arc4random_uniform(self.maxX);
        int randomY = arc4random_uniform(self.maxY);
        
        food = [self createDotWithX:randomX y:randomY];
        
        index = [self.body indexOfObject:food];
        
    } while (index != NSNotFound);
    
    return food;
}

- (BOOL)move {
    
    NSValue *nextDot = [self getNextDot];
    
    bool added = [self addBody:nextDot];
    
    if ([nextDot isEqualToValue:self.fruit]) {
        
        self.fruit = [self generateFruit];
                
        self.eat = YES;
        
    } else if (self.eat) {
        
        self.eat = NO;
        
    } else {
        
        [self removeLastBody];
    }
    
    return added;
}

- (BOOL)addBody:(NSValue *) dot {
    
    NSUInteger index = [self.body indexOfObject:dot];
    
    Dot dotType;
    [dot getValue:&dotType];
    int x = dotType.x;
    int y = dotType.y;
    
    if ((index == NSNotFound)
        && (x >= 0 && x <= self.maxX)
        && (y >= 0 && y <= self.maxY)) {
        
        [body insertObject:dot atIndex:0];
        
        return YES;
    }

    return NO;
}

- (void)removeLastBody {
    [body removeLastObject];
}

- (NSValue*)getNextDot {
    
    NSValue *firstValue = self.body[0];
    Dot firstDot;
    [firstValue getValue:&firstDot];
    int nextX = firstDot.x;
    int nextY = firstDot.y;
    
    switch (self.direction) {
        case RIGHT:
            if (nextX == self.maxX) nextX = 0;
            else nextX += 1;
            break;
        case LEFT:
            if (nextX == 0) nextX = self.maxX;
            else nextX -= 1;
            break;
        case UP:
            if (nextY == 0) nextY = self.maxY;
            else nextY -= 1;
            break;
        case DOWN:
            if (nextY == self.maxY) nextY = 0;
            else nextY += 1;
            break;
    }
    
    return [self createDotWithX:nextX y:nextY];
}

- (void)changeDirection:(SnakeDirection) gesture {
    
    BOOL changed = YES;
        
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
