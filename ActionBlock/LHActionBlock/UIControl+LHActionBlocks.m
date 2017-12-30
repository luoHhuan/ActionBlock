//
//  UIControl+LHActionBlocks.m
//  ActionBlock
//
//  Created by Luoh on 2017/11/13.
//  Copyright © 2017年 Luoh. All rights reserved.
//

#import "UIControl+LHActionBlocks.h"
#import "LHActionBlockWrapper.h"
#import <objc/runtime.h>

@implementation UIControl (LHActionBlocks)

- (void)handleControlEvents:(UIControlEvents)controlEvents withBlock:(LHActionBlock)actionBlock
{
    NSMutableArray * actionBlocksArray = [self actionBlocksArray];
    
    LHActionBlockWrapper *blockActionWrapper = [[LHActionBlockWrapper alloc] init];
    blockActionWrapper.actionBlock = actionBlock;
    blockActionWrapper.controlEvents = controlEvents;
    [actionBlocksArray addObject:blockActionWrapper];
    
    [self addTarget:blockActionWrapper action:@selector(invokeBlock:) forControlEvents:controlEvents];
}

- (void)removeActionBlocksForControlEvents:(UIControlEvents)controlEvents {
    NSMutableArray *actionBlocksArray = [self actionBlocksArray];
    NSMutableArray *wrappersToRemove = [NSMutableArray arrayWithCapacity:[actionBlocksArray count]];
    
    [actionBlocksArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        LHActionBlockWrapper *wrapperTmp = obj;
        if (wrapperTmp.controlEvents == controlEvents) {
            [wrappersToRemove addObject:wrapperTmp];
            [self removeTarget:wrapperTmp action:@selector(invokeBlock:) forControlEvents:controlEvents];
        }
    }];
    
    [actionBlocksArray removeObjectsInArray:wrappersToRemove];
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
