//
//  UIBarButtonItem+LHActionBlocks.m
//  ActionBlock
//
//  Created by Luoh on 2017/11/13.
//  Copyright © 2017年 Luoh. All rights reserved.
//

#import "UIBarButtonItem+LHActionBlocks.h"
#import "LHActionBlockWrapper.h"
#import <objc/runtime.h>
@implementation UIBarButtonItem (LHActionBlocks)

- (instancetype)initWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem block:(LHActionBlock)actionBlock {
    UIBarButtonItem *barButtonItem = [[[self class] alloc] initWithBarButtonSystemItem:systemItem target:nil action:nil];
    [barButtonItem setBlock:actionBlock];
    return barButtonItem;
}


- (instancetype)initWithImage:(UIImage *)image landscapeImagePhone:(UIImage *)landscapeImagePhone style:(UIBarButtonItemStyle)style block:(LHActionBlock)actionBlock {
    UIBarButtonItem *barButtonItem = [[[self class] alloc] initWithImage:image landscapeImagePhone:landscapeImagePhone style:style target:nil action:nil];
    [barButtonItem setBlock:actionBlock];
    return barButtonItem;
}


- (instancetype)initWithImage:(UIImage *)image style:(UIBarButtonItemStyle)style block:(LHActionBlock)actionBlock {
    UIBarButtonItem *barButtonItem = [[[self class] alloc] initWithImage:image style:style target:nil action:nil];
    [barButtonItem setBlock:actionBlock];
    return barButtonItem;
}


- (instancetype)initWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style block:(LHActionBlock)actionBlock {
    UIBarButtonItem *barButtonItem = [[[self class] alloc] initWithTitle:title style:style target:nil action:nil];
    [barButtonItem setBlock:actionBlock];
    return barButtonItem;
}


- (void)setBlock:(LHActionBlock)actionBlock {
    NSMutableArray *actionBlocksArray = [self actionBlocksArray];
    
    LHActionBlockWrapper *blockActionWrapper = [[LHActionBlockWrapper alloc] init];
    blockActionWrapper.actionBlock = actionBlock;
    [actionBlocksArray addObject:blockActionWrapper];
    
    [self setTarget:blockActionWrapper];
    [self setAction:@selector(invokeBlock:)];
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
