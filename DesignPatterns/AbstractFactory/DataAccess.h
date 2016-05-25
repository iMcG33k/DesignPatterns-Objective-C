//
//  DataAccess.h
//  DesignPatterns
//
//  Created by zmj27404 on 16/5/25.
//  Copyright © 2016年 leichunfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IUser.h"
#import "IDepartment.h"

@interface DataAccess : NSObject

#pragma mark - 简单工厂
- (id<IUser>)createUser;
- (id<IDepartment>)createDepartment;

#pragma mark -  反射
- (id<IUser>)reflectionUser;
- (id<IDepartment>)reflectionDepartment;

#pragma mark - 反射+配置
- (id<IUser>)reflectionConfigureUser;
- (id<IDepartment>)reflectionConfigureDepartment;

@end
