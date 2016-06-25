import Foundation

//  解释器模式（interpreter),给定一定语言，定义它的文法的一种表示，并定义一个解析器，这个解析器使用该表示来解析语言中的句子。
//  如果一种特定类型的问题发生的频率足够高，那么可能就值得该问题的各个实例表述为一个简单语言中的句子。这样就可以构建一个解析器，该解析器通过解析这些句子来解决该问题。
//  当有一个语言需要解析执行，并且你可将该语言中的句子表示为一个抽象语法树时，可使用解释器模式
//  解释器模式很容易地改变和扩展文法，因为该模式使用类来表示文法规则，你可使用继承来改变或扩展方法。也比较容易实现文法，因为定义抽象语法书中各个节点的类的实现大体类似，这些类都易于直接编写。
//  解释器模式也有不足的，解释器模式为文法中的每一条规则至少定义了一个类，因此包含许多规则的文法可能难以管理和维护。建议当文法非常复杂时，使用其他的技术如语法分析程序或编译器生成器来处理。


public class Context {
    public var input: String
    public var output: String?
    
    public init(input: String) {
        self.input = input
    }
}

public struct PlayContext {
    public let text: String
}

public protocol AbstractExpression {
    associatedtype T
    static func interpret(context: T)
}

public struct TerminalExpression: AbstractExpression {
    static public func interpret(context: Context) {
        context.output = "Termial Nice to meet you"
        print("\(context.input)终端解析器--> \(context.output!)")
    }
    init(){}
}

public struct NonterminalExpression: AbstractExpression {
    static public func interpret(context: Context) {
        context.output = "Nice to meet you"
        print("\(context.input)非终端解析器--> \(context.output!)")
    }
    init(){}
}



