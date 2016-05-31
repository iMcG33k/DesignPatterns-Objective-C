//
//  PersonBuilder.h
//  DesignPatterns
//
//  Created by leichunfeng on 14/11/2.
//  Copyright (c) 2014年 zdnst. All rights reserved.
//
//  建造者模式:将一个复杂对象的构建与它的表示分离，使得同样的构建过程可以创建不同的表示。如果我们用了建造者模式，那么用户就只需指定需要建造的类型就可以得到它们，而具体建造的过程和细节就不要知道了。
//  什么时候使用建造者模式：主要是用于创建一些复杂的对象，这些对象内部构建键的建造顺序通常是稳定的，但对象内部的构建通常面临着复杂的变化。
//  建造者模式的好处就是使得建造代码与表示代码分离，由于建造者隐藏了该产品是如何组装的，所以若需要改变一个产品的内部表示，只需要再定义一个具体的建造者即可。
//  建造者欧式是在当创建复杂对象的算法应该独立于该对象的组成部分以及它们的装配方式时适用的模式

#import <Foundation/Foundation.h>

@protocol PersonBuilder <NSObject>

///  建造头部
- (void)buildHead;

///  建造身体
- (void)buildBody;

///  建造左手
- (void)buildArmLeft;

///  建造右手
- (void)buildArmRight;

///  建造左脚
- (void)buildLegLeft;

///  建造右脚
- (void)buildLegRight;

@end
