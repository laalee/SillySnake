//
//  Snake.h
//  SillySnake
//
//  Created by Annie Lee on 2019/1/22.
//  Copyright © 2019 Annie Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, SnakeDirection) {
    SnakeDirectionRight,
    SnakeDirectionLeft,
    SnakeDirectionUp,
    SnakeDirectionDown
};

typedef struct {
    NSInteger x;
    NSInteger y;
} Dot;

NS_ASSUME_NONNULL_BEGIN

@interface Snake : NSObject
@property (readonly) SnakeDirection direction;
@property (readonly) NSArray<NSValue *> *body;
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

NS_ASSUME_NONNULL_END
