//
//  Decorator.swift
//  DesignPatterns
//
//  Created by zmj27404 on 16/5/28.
//  Copyright © 2016年 leichunfeng. All rights reserved.
//
//  需要把所需的功能按正确的顺序串联起来进行控制
//  装饰模式(Decorator),动态地给一个对象添加一些额外的职责，就增加功能来说，装饰模式比生成子类更为灵活
//  每个装饰对象的实现就和如何使用这个对象分离开了，每个装饰对象只关心自己的功能，不需要关心如何被添加到对象链当中(DPE)
//

import Foundation

//基类，人
public class Person {
    private var name: String
    init() { name = "hello" }
    init(name: String) { self.name = name }
    func show() -> String {
        return "装饰的\(self.name)" + "\n"
    }
}

//服饰类(装饰类, Decorator)
public class Finery:   Person {
    var person: Person?
    override func show() -> String {
        if let lastPerson = person {
            return lastPerson.show() + "\n"
        }
        return ""
    }
}

//具体服饰类(ConcreteDecorator)
public class TShirts: Finery {
    override func show() -> String {
        return "大T恤," + super.show() + "\n"
    }
}

public class BigTrouser: Finery {
    override func show() -> String {
        return "垮裤," + super.show() + "\n"
    }
}

//show code
public class ShowClothes {
    public init() {}
    public func show() -> String {
        var result = "第一种穿衣方式\n"
        let xc = Person(name: "小明")
        
        let pqx = TShirts()
        let bgtx = BigTrouser()
        pqx.person = xc
        bgtx.person = pqx
        result += bgtx.show()
        
        return result
    }
}
