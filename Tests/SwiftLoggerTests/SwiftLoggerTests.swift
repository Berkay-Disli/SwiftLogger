import XCTest
@testable import SwiftLogger

final class SwiftLoggerTests: XCTestCase {
    
    func testInfoLog() {
        let logger = Logger.shared
        let expectation = self.expectation(description: "Info log expectation")
        
        let testOutput: (String) -> Void = { message in
            XCTAssertTrue(message.contains("[INFO]"))
            XCTAssertTrue(message.contains("This is an info message"))
            expectation.fulfill()
        }
        
        logger.setOutput(testOutput)
        logger.log("This is an info message", level: .info)
        
        waitForExpectations(timeout: 1, handler: nil)
    }

    func testWarningLog() {
        let logger = Logger.shared
        let expectation = self.expectation(description: "Warning log expectation")
        
        let testOutput: (String) -> Void = { message in
            XCTAssertTrue(message.contains("[WARNING]"))
            XCTAssertTrue(message.contains("This is a warning message"))
            expectation.fulfill()
        }
        
        logger.setOutput(testOutput)
        logger.log("This is a warning message", level: .warning)
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testErrorLog() {
        let logger = Logger.shared
        let expectation = self.expectation(description: "Error log expectation")
        
        let testOutput: (String) -> Void = { message in
            XCTAssertTrue(message.contains("[ERROR]"))
            XCTAssertTrue(message.contains("This is an error message"))
            expectation.fulfill()
        }
        
        logger.setOutput(testOutput)
        logger.log("This is an error message", level: .error)
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testDebugLog() {
        let logger = Logger.shared
        let expectation = self.expectation(description: "Debug log expectation")
        
        let testOutput: (String) -> Void = { message in
            XCTAssertTrue(message.contains("[DEBUG]"))
            XCTAssertTrue(message.contains("This is a debug message"))
            expectation.fulfill()
        }
        
        logger.setOutput(testOutput)
        logger.log("This is a debug message", level: .debug)
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testDefaultLogLevel() {
        let logger = Logger.shared
        let expectation = self.expectation(description: "Default log level expectation")
        
        let testOutput: (String) -> Void = { message in
            XCTAssertTrue(message.contains("[INFO]"))
            XCTAssertTrue(message.contains("This is a default level message"))
            expectation.fulfill()
        }
        
        logger.setOutput(testOutput)
        logger.log("This is a default level message")
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testCustomOutput() {
        let logger = Logger.shared
        let expectation = self.expectation(description: "Custom output expectation")
        
        let testOutput: (String) -> Void = { message in
            XCTAssertTrue(message.contains("[INFO]"))
            XCTAssertTrue(message.contains("This is a custom output message"))
            expectation.fulfill()
        }
        
        logger.setOutput(testOutput)
        logger.log("This is a custom output message", level: .info)
        
        waitForExpectations(timeout: 1, handler: nil)
    }

    static var allTests = [
        ("testInfoLog", testInfoLog),
        ("testWarningLog", testWarningLog),
        ("testErrorLog", testErrorLog),
        ("testDebugLog", testDebugLog),
        ("testDefaultLogLevel", testDefaultLogLevel),
        ("testCustomOutput", testCustomOutput)
    ]
}

