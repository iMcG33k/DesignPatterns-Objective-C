//
//  SWOperationFactory.h
//  DesignPatterns
//
//  抽象
//
//  Created by iMcG33k on 16/9/15.
//  Copyright © 2016年 leichunfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SWOperationProtocol.h"

@protocol SWOperationFactory <NSObject>

- (id<SWOperationProtocol>)createOperation;

@end
