//
//  AbstractLogger.swift
//  DutyModelDemo
//
//  Created by 沙庭宇 on 2019/7/12.
//  Copyright © 2019 沙庭宇. All rights reserved.
//

import Foundation

enum LoggerLevel: Int {
    case UNKNOWN = 0
    case INFO    = 1
    case DEBUG   = 2
    case ERROR   = 3
}

class AbstractLogger {
    
    var level: LoggerLevel = .UNKNOWN
    var next:AbstractLogger? = nil

    func logMessage(level:LoggerLevel, message:String) {
        if self.level.rawValue <= level.rawValue {
            self.write(message: message)
            return
        }
        //取当前对象指向的下一个查找类对象
        guard let next = self.next else {
            print("啥也没找到!🤷🏻‍♂️")
            return
        }
        next.logMessage(level: level, message: message)
    }

    func write(message:String){}
}

class InfoLog: AbstractLogger {
    init(level: LoggerLevel) {
        super.init()
        self.level = level
    }

    override func write(message: String) {
        super.write(message: message)
        print("InfoLog: %@", message)
    }
}

class DebugLog: AbstractLogger {
    init(level: LoggerLevel) {
        super.init()
        self.level = level
    }

    override func write(message: String) {
        super.write(message: message)
        print("DebugLog %@", message)
    }
}

class ErrorLog: AbstractLogger {
    init(level: LoggerLevel) {
        super.init()
        self.level = level
    }

    override func write(message: String) {
        super.write(message: message)
        print("ErrorLog %@", message)
    }
}
