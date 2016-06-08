//
//  Composite.swift
//  DesignPatterns
//
//  Created by zmj27404 on 16/6/8.
//  Copyright © 2016年 leichunfeng. All rights reserved.
//
//  组合模式(Composite),将对象组合成树行结构以表示‘部分-整体’的层次结构。组合模式使得用户对某个对象和组合对象的使用具有一致性
//  透明方式，也就是说在Component中声明所有用来管理子对象的方法，其中包括Add, Remove等。这样实现Component接口的所有子类都具备了Add和Remove.
//          这样做的好处就是叶节点和枝节点对于外界没有区别，它们具备完全一致的行为接口。但问题也很明显，因为Leaf类本身不具备Add(),Remove()方法的功能。所以实现它是没有意义的
//  安全方式，也就是在Component接口中不去声明Add和Remove方法，那么子类的Leaf也就不需要去实现它，而是在Composite声明所有用来管理子类对象的方法，不过由于不够透明，所以树叶和树枝类将不具有相同的接口，客户端的调用需要作出相应的判断，带来了不便
//  何时使用组合模式：需求中体现部分与整体层次的结构时，以及你希望用户可以忽悠组合对象与单个对象的不同，统一地使用组合结构中的所有对象时。

//  组合模式定义了包含基本对象，组合对象的类层次结构。基本对象可以被组合成更复杂的组合对象，而这个组合对象又可以被组合，这样不断地递归下去，客户代码中，任何用到基本对象的地方都可以使用组合对象
//  用户是不用关心到底是处理一个叶节点还是处理一个组合组件，也就用不着为定义组合而写一些选择判断语句了。
//  组合模式让客户可以一致地使用组合结构和单个对象

import Foundation

/// 组合基类
class Company: Equatable {
    var name: String
    init(name: String){ self.name = name }
    
    func add(c: Company) {}
    func remove(c: Company) {}
    func display(depth: Int) {}
    func lineOfDuty() {}
}

func ==(lhs: Company, rhs: Company) -> Bool {
    return lhs.name == rhs.name
}

/// 具体公司类，实现接口，树枝节点
class ConcreteCompany: Company {
    private var children = [Company]()
    
    override func add(c: Company) {
        children.append(c)
    }
    
    override func remove(c: Company) {
        children.removeObject(c)
    }
    
    override func display(depth: Int) {
        print("- \(depth), \(self.name)")
        children.forEach { (c) in
            c.display(depth + 2)
        }
    }
    
    override func lineOfDuty() {
        children.forEach { (c) in
            c.lineOfDuty()
        }
    }
}

/// 人力资源部
class HRDepartment: Company {
    override func display(depth: Int) {
        print("- \(depth) \(self.name)")
    }
    override func lineOfDuty() {
        print("\(self.name) 员工招聘培训管理")
    }
}

class FinanceDepartment: Company {
    override func display(depth: Int) {
        print("- \(depth) \(self.name)")
    }
    
    override func lineOfDuty() {
        print("\(self.name) 公司财务收支管理")
    }
}

