//
//  Memonto.swift
//  DesignPatterns
//
//  Created by zmj27404 on 16/6/7.
//  Copyright © 2016年 leichunfeng. All rights reserved.
//
//  备忘录（Memento):在不破坏封装性的前提下，捕获一个对象的内部状态，并在该对象之外保存这个状态。这样以后就可将该对象恢复到原先保存的状态
//  Memnto模式比较适用于功能比较复杂的，但需要维护或记录属性历史的类，或者需要保存的属性只是众多属性中的一小部分时，Originator可以根据保存的Memento信息还原前一状态
//  如果在某个系统中适用命令模式时，需要实现命令的撤销功能，那么命令模式可以使用备忘录模式来存储可撤销操作的状态。使用备忘录可以把复杂的对象内部信息对其他的对象屏蔽起来
//  当角色的状态改变的时候，有可能这个状态无效，这时候就可以使用暂时存储起来的备忘录将状态复原。

import Foundation

//角色状态存储箱
class RoleStateMemento {
    private var vit: Int = 0
    private var atk: Int = 0
    private var def: Int = 0
    init(vit: Int, atk: Int, def: Int){
        self.vit = vit
        self.atk = atk
        self.def = def
    }
    init(){}
}

//角色状态管理器
class RoleStateCaretaker {
    var memento = RoleStateMemento()
    init() {}
}

//游戏角色
class GamePlayer {
    var vit: Int = 100
    var atk: Int = 100
    var def: Int = 100
    
    //保存状态
    func saveState() -> RoleStateMemento {
        return RoleStateMemento(vit: vit, atk: atk, def: def)
    }
    
    //恢复状态
    func restoreState(memento: RoleStateMemento) {
        self.atk = memento.atk
        self.vit = memento.vit
        self.def = memento.def
    }
}

