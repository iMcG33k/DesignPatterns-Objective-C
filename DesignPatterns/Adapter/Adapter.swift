//
//  Adapter.swift
//  DesignPatterns
//
//  Created by zmj27404 on 16/6/7.
//  Copyright © 2016年 leichunfeng. All rights reserved.
//
//  适配器模式：将一个类的接口转换成客户希望的另外一个接口。Adapter模式使得原本由于接口不兼容而不能一起工作的那些类可以一起工作
//            系统的数据和行为都正确，但接口不符时，我们应该考虑用适配器，目的是使控制范围之外的一个原有对象与某个接口匹配。适配器模式主要应用于
//            希望复用一些现存的类，但是接口又与复用环境要求不一致的情况。
//              适配器模式有两种类型：类适配器模式和对象适配器模式。
//  何时使用适配器模式：使用一个已经存在的类，但如果它的借口，也就是它的方法和你的要求不相同时，就应该考虑用适配器模式
//                  两个类所做的事情相同或相似，但是具有不同的接口时要使用它。
//                  客户代码可以统一调用同一接口，可以更简单，更直接，更紧凑。
//                  双方都不太容易修改的时候再使用适配器模式适配

import Foundation

class Player {
    var name: String
    init(name: String) { self.name = name }
    func Attack() {}
    func Defense() {}
}

class Forwards: Player {
    override func Attack() {
        print("前锋\(self.name) 进攻")
    }
    override func Defense() {
        print("前锋\(self.name) 防守")
    }
}

class Center: Player {
    override func Attack() {
        print("中锋\(self.name) 进攻")
    }
    override func Defense() {
        print("中锋\(self.name) 防守")
    }
}

class ForeignCenter: Player {
    override func Attack() {
        print("外籍中锋\(self.name) 进攻")
    }
    override func Defense() {
        print("外籍中锋\(self.name) 防守")
    }
}

class Guards: Player {
    override func Attack() {
        print("后卫\(self.name) 进攻")
    }
    override func Defense() {
        print("后卫\(self.name) 防守")
    }
}

class Translator: Player {
    private var foregin: ForeignCenter
    override init(name: String) {
        self.foregin = ForeignCenter(name: name)
        super.init(name: name)
    }
    override func Attack() {
        self.foregin.Attack()
    }
    override func Defense() {
        self.foregin.Defense()
    }
}