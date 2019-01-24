//
//  Snake.h
//  SillySnake
//
//  Created by Annie Lee on 2019/1/22.
//  Copyright © 2019 Annie Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

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

@property SnakeDirection direction;
@property NSMutableArray *body;
@property int maxX;
@property int maxY;
@property NSValue *fruit;

- (id) initWithDirection:(SnakeDirection) direction
                  maxX:(int)x
                  maxY:(int)y
                  length:(int)length;
- (void)changeDirection:(SnakeDirection) direction;
- (bool)addBody:(NSValue *) dot;
- (bool)move;
- (NSValue*)getNextDot;
- (NSValue*)createDotWithX:(int)x y:(int)y;
- (NSValue*)generateFruit;

@end

NS_ASSUME_NONNULL_END
