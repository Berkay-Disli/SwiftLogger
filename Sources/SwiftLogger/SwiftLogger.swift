// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import SwiftUI

public enum LogLevel: String {
    case info = "INFO"
    case warning = "WARNING"
    case error = "ERROR"
    case debug = "DEBUG"
}

public class Logger {
    public static let shared = Logger()

    private let dateFormatter: DateFormatter
    private let logQueue: DispatchQueue
    private var output: (String) -> Void

    private init() {
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        logQueue = DispatchQueue(label: "LoggerQueue")
        output = { message in print(message) }
    }

    public func log(_ message: Any, level: LogLevel = .info, file: String = #file, function: String = #function, line: Int = #line) {
        logQueue.async {
            let timestamp = self.dateFormatter.string(from: Date())
            let fileName = (file as NSString).lastPathComponent
            let logMessage = "[\(level.rawValue)] [\(timestamp)] [\(fileName):\(line)] \(function) - \(message)"
            self.output(logMessage)
        }
    }

    public func setOutput(_ output: @escaping (String) -> Void) {
        logQueue.sync {
            self.output = output
        }
    }
}
