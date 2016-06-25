import Foundation

//  访问者模式适用于数据结构相对稳定的系统
//  它把数据结构和作用于结构上的操作之间的耦合解脱开，使得操作集合可以相对自由地演化
//  访问者模式的母的是要把处理从数据解分离出来。有比较稳定的数据结构，又有易于变化的算法的话，使用访问者模式就是比较合适的，因为访问者模式使得算法操作的增加变得容易。
//  访问者模式的优点就是增加新的操作很容易，因为增加新的操作就意味着增加一个新的访问者。访问者模式将有关的行为集中到一个访问者对象中
//  访问者的缺点其实也就是使增加新的数据结构变得困难了。

//  Action协议
protocol Action {
    func GetManConclusion(man: Man)
    func GetWomanConclusion(woman: Woman)
}

class Success: Action {
    func GetManConclusion(man: Man) {
        print("\(self.dynamicType),\(man.dynamicType)时，背后多半有个伟大的女人.")
    }
    func GetWomanConclusion(woman: Woman) {
        print("\(self.dynamicType),\(woman.dynamicType)时，背后大多有一个不成功的男人")
    }
}

class Failing: Action {
    func GetManConclusion(man: Man) {
        print("\(self.dynamicType),\(man.dynamicType)时，背后多半有个失败的女人.")
    }
    func GetWomanConclusion(woman: Woman) {
        print("\(self.dynamicType),\(woman.dynamicType)时，背后大多有一个失败的男人")
    }
}

class Amativeness: Action {
    func GetManConclusion(man: Man) {
        print("\(self.dynamicType),\(man.dynamicType)时，背后多半有个恋爱的女人.")
    }
    func GetWomanConclusion(woman: Woman) {
        print("\(self.dynamicType),\(woman.dynamicType)时，背后大多有一个恋爱的男人")
    }
}


//  Person协议
protocol Person {
    func Accept(vistor: Action)
}

struct Man: Person {
    func Accept(vistor: Action) {
        vistor.GetManConclusion(self)
    }
}

struct Woman: Person {
    func Accept(vistor: Action) {
        vistor.GetWomanConclusion(self)
    }
}

//  对象结构
class ObjectStructure {
    private var elments = [Person]()
    
    func addPerson(person: Person) {
        elments.append(person)
    }
    
    internal func removeLastPerson() {
        elments.removeLast()
    }
    
    internal func display(vistor: Action) {
        elments.forEach{ $0.Accept(vistor) }
    }
    internal init(){}
}

public func VistorMain() {
    let o = ObjectStructure()
    let man = Man()
    let woman = Woman()
    o.addPerson(man)
    o.addPerson(woman)
    let action = Success()
    let fialure = Failing()
    let native = Amativeness()
    o.display(action)
    o.display(fialure)
    o.display(native)
}



