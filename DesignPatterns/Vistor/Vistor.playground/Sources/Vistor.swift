import Foundation

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



