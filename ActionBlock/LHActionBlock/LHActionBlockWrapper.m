//
//  LHActionBlockWrapper.m
//  ActionBlock
//
//  Created by Luoh on 2017/11/13.
//  Copyright © 2017年 Luoh. All rights reserved.
//

#import "LHActionBlockWrapper.h"

@implementation LHActionBlockWrapper

- (void)invokeBlock:(id)sender {
    if (self.actionBlock) {
        self.actionBlock(sender);
    }
}

@end
