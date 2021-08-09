//
//  JXMediaUtil.swift
//  JXMediaBrowser
//
//  Created by Jason on 2021/5/17.
//

import Foundation

public struct JXMediaUtil {
    
    public enum LogLevel: Int {
        case error = 0
        case warning
        case normal
    }
    
    /// 允许打印的最高日志级别。
    /// 本级别以下的日志都会被允许打印。
    /// 级别排序：normal > warning > error
    public static var logLevel: LogLevel = .warning
    
    public static func log(level: LogLevel = .normal, message: @autoclosure () -> Any) {
        if level.rawValue <= self.logLevel.rawValue {
            var name: String = ""
            switch level {
            case .error:
                name = "error"
            case .warning:
                name = "warning"
            case .normal:
                name = "normal"
            }
            print("[JXPhotoBrowser] [\(name)]", message())
        }
    }
}
