//
//  TestPaper.h
//  DesignPatterns
//  模板方法模式
//
//  Created by leichunfeng on 14/11/2.
//  Copyright (c) 2014年 zdnst. All rights reserved.
//
//  模板方法模式，既然用了继承，并且肯定这个继承有意义，就应该要成为子类的模板，所有重复的代码都应该要上升到父类去，而不是让每个子类都去重复
//  当我们要完成在某一细节层次一致的一个过程或一系统步骤，但其个别步骤在更详细的层次上的实现可能不同时，我们通常考虑用模板方法模式来处理。
//  模板方法模式：定义一个操作中的算法的骨架，而将一些步骤延迟到子类中。模板方法使得子类可以不改变一个算法的结构即可重定义该算法的某些特定步骤
//
//  模板方法模式是通过把不变行为搬移到超类，去除子类中的重复代码来体现它的优势。
//  模板方法模式就是提供了一个很好的代码复用平台。
//  当不变的和可变的行为在方法的子类实现中混合在一起的时候，不变的行为就会在子类中重复实现。我们通过模板方法模式吧这些行为搬移到单一的地方，这样就帮助子类摆脱重复的不变行为的纠缠
#import <Foundation/Foundation.h>

@interface TestPaper : NSObject

///  试题1
- (void)testQuestion1;

///  答案1
///
///  @return 答案1
- (NSString *)answer1;

///  试题2
- (void)testQuestion2;

///  答案2
///
///  @return 答案2
- (NSString *)answer2;

///  试题3
- (void)testQuestion3;

///  答案3
///
///  @return 答案3
- (NSString *)answer3;

@end
