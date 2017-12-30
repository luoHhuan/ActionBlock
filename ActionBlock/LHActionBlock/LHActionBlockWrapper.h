//
//  LHActionBlockWrapper.h
//  ActionBlock
//
//  Created by Luoh on 2017/11/13.
//  Copyright © 2017年 Luoh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LHActionBlock.h"

static NSString *const LHActionBlocksArray = @"LHActionBlocksArray";

@interface LHActionBlockWrapper : NSObject

@property (nonatomic, copy) LHActionBlock actionBlock;
@property (nonatomic, assign) UIControlEvents controlEvents;

- (void)invokeBlock:(id)sender;

@end
