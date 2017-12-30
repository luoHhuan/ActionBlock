//
//  UIGestureRecognizer+LHActionBlocks.m
//  ActionBlock
//
//  Created by Luoh on 2017/11/13.
//  Copyright © 2017年 Luoh. All rights reserved.
//

#import "UIGestureRecognizer+LHActionBlocks.h"
#import "LHActionBlockWrapper.h"
#import <objc/runtime.h>

@implementation UIGestureRecognizer (LHActionBlocks)

- (instancetype)initWithBlock:(LHActionBlock)actionBlock {
    UIGestureRecognizer *gestureRecognizer = [[[self class] alloc] init];
    [gestureRecognizer setBlock:actionBlock];
    return gestureRecognizer;
}


- (void)setBlock:(LHActionBlock)actionBlock {
    NSMutableArray *actionBlocksArray = [self actionBlocksArray];
    
    LHActionBlockWrapper *blockActionWrapper = [[LHActionBlockWrapper alloc] init];
    blockActionWrapper.actionBlock = actionBlock;
    [actionBlocksArray addObject:blockActionWrapper];
    
    [self addTarget:blockActionWrapper action:@selector(invokeBlock:)];
}


- (NSMutableArray *)actionBlocksArray {
    NSMutableArray *actionBlocksArray = objc_getAssociatedObject(self, &LHActionBlocksArray);
    if (!actionBlocksArray) {
        actionBlocksArray = [NSMutableArray array];
        objc_setAssociatedObject(self, &LHActionBlocksArray, actionBlocksArray, OBJC_ASSOCIATION_RETAIN);
    }
    return actionBlocksArray;
}


@end
