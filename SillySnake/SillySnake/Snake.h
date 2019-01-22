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

//typedef struct Dot {
//    int x;
//    int y;
//} Dot;

NS_ASSUME_NONNULL_BEGIN

@interface Snake : NSObject

@property SnakeDirection direction;

@property NSMutableArray *body;

- (void)changeDirection:(SnakeDirection) direction;

@end

@interface Dot : NSObject
@property int x;
@property int y;
- (id)initWithX:(int)x y:(int)y;
@end



NS_ASSUME_NONNULL_END
