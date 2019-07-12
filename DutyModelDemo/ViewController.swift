//
//  ViewController.swift
//  DutyModelDemo
//
//  Created by 沙庭宇 on 2019/7/12.
//  Copyright © 2019 沙庭宇. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let loggerChain: AbstractLogger = {
        //设置查找顺序,返回查找“头”
        let errorLogger = ErrorLog(level: .ERROR)
        let debugLogger = DebugLog(level: .DEBUG)
        let infoLogger  = InfoLog(level: .INFO)

        errorLogger.next = debugLogger
        debugLogger.next = infoLogger
//        infoLogger.next  = nil

        return errorLogger
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 100, height: 40)))
        label.text = "Touch Me"
        label.textColor = UIColor.orange
        label.center = self.view.center
        self.view.addSubview(label)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.loggerChain.logMessage(level: .UNKNOWN, message: "找到了呀😏")
    }

}

