//
//  DataAccess.m
//  DesignPatterns
//
//  Created by zmj27404 on 16/5/25.
//  Copyright © 2016年 leichunfeng. All rights reserved.
//

#import "DataAccess.h"
#import "SQLServerUser.h"
#import "AccessUser.h"
#import "SQLServerDepartment.h"
#import "AccessDepartment.h"

static NSString *const db = @"Access";

@implementation DataAccess
#pragma mark - 简单工厂
- (id<IUser>)createUser {
    id<IUser> user = nil;
    if ([db isEqualToString:@"Access"]) {
        user = [AccessUser new];
    }
    else if ([db isEqualToString:@"SQLServer"]) {
        user = [SQLServerUser new];
    }
    return user;
}

- (id<IDepartment>)createDepartment {
    id<IDepartment> department = nil;
    if ([db isEqualToString:@"Access"]) {
        department = [AccessDepartment new];
    }
    else if ([db isEqualToString:@"SQLServer"]) {
        department = [SQLServerDepartment new];
    }
    return department;
}

#pragma mark - 反射
- (id<IUser>)reflectionUser {
    NSString *className = [NSString stringWithFormat:@"%@User", db];
    Class cls = NSClassFromString(className);
    id<IUser> user = nil;
    if (cls) {
        user = [cls new];
    }
    return user;
}

- (id<IDepartment>)reflectionDepartment {
    id<IDepartment> department = nil;
    NSString *className = [NSString stringWithFormat:@"%@Department", db];
    Class cls = NSClassFromString(className);
    if (cls) {
        department = [cls new];
    }
    return department;
}

#pragma mark - 反射+配置
- (id<IUser>)reflectionConfigureUser {
    id<IUser> user = nil;
    NSString *fileName = [[NSBundle mainBundle] pathForResource:@"configure" ofType:@"plist"];
    if (fileName) {
        NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:fileName];
        NSString *dbName = dict[@"dbName"];
        if (dbName) {
            NSString *className = [NSString stringWithFormat:@"%@User", dbName];
            Class cls = NSClassFromString(className);
            if (cls) {
                user = [cls new];
            }
        }
    }
    return user;
}

- (id<IDepartment>)reflectionConfigureDepartment {
    id<IDepartment> department = nil;
    NSString *fileName = [[NSBundle mainBundle] pathForResource:@"configure" ofType:@"plist"];
    if (fileName) {
        NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:fileName];
        NSString *dbName = dict[@"dbName"];
        if (dbName) {
            NSString *className = [NSString stringWithFormat:@"%@Department", dbName];
            Class cls = NSClassFromString(className);
            if (cls) {
                department = [cls new];
            }
        }
    }
    return department;
}

@end
