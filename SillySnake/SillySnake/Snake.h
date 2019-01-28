//
//  Snake.h
//  SillySnake
//
//  Created by Annie Lee on 2019/1/22.
//  Copyright © 2019 Annie Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

//typedef NS_ENUM(NSUInteger, SnakeDirection) {
//    SnakeDirectionRight,
//    SnakeDirectionLeft,
//    SnakeDirectionUp,
//    SnakeDirectionDown
//};

typedef enum {
    RIGHT,
    LEFT,
    UP,
    DOWN
} SnakeDirection;

typedef struct {
    int x;
    int y;
} Dot;

NS_ASSUME_NONNULL_BEGIN

@interface Snake : NSObject
@property (readonly) SnakeDirection direction;
@property (readonly) NSArray *body;
@property (readonly) NSInteger maxX;
@property (readonly) NSInteger maxY;
@property (readonly) NSValue *fruit;
@property (readonly) BOOL eat;

- (instancetype) initWithDirection:(SnakeDirection) direction
                  maxX:(NSInteger)x
                  maxY:(NSInteger)y
                  length:(NSInteger)length;

- (void)changeDirection:(SnakeDirection) direction;
- (BOOL)addBody:(NSValue *) dot;
- (BOOL)move;

@end

@interface Snake (ForTesting)
- (NSValue*)getNextDot;
- (NSValue*)createDotWithX:(NSInteger)x y:(NSInteger)y;
- (NSValue*)generateFruit;
- (NSValue*)getFruit;
- (NSMutableArray*)getSnakeBody;
@end


NS_ASSUME_NONNULL_END
