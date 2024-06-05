# SwiftLogger

SwiftLogger is a lightweight, powerful logging utility for Swift applications. It supports multiple logging levels (info, warning, error, debug) and allows for easy integration into any Swift project. With SwiftLogger, you can easily add detailed logging with customizable outputs, such as console or file-based logging.

## Features

- **Multiple Log Levels:** Easily log messages under different severities: info, warning, error, and debug.
- **Thread Safety:** Ensures that log entries are safely added from multiple threads.
- **Customizable Outputs:** Configure logging outputs that suit your needs, from simple console outputs to complex file-based or network-based logging.
- **Simple API:** Easy to use API that can be integrated in just a few lines of code.

## Installation

### Swift Package Manager

You can install SwiftLogger using the Swift Package Manager by adding it to your project's dependencies:

```swift
dependencies: [
    .package(url: "https://github.com/yourgithubusername/SwiftLogger.git", .upToNextMajor(from: "1.0.0"))
]
```

## Usage
### Basic Logging
```swift
import SwiftLogger

Logger.shared.log("This is a default level message") // default level is info
Logger.shared.log("This is an info message", level: .info)
Logger.shared.log("This is a warning message", level: .warning)
Logger.shared.log("This is an error message", level: .error)
Logger.shared.log("This is a debug message", level: .debug)
```

### Custom Output
```swift
Logger.shared.setOutput { message in
    let logFileURL = URL(fileURLWithPath: "/path/to/your/logfile.txt")
    if let handle = try? FileHandle(forWritingTo: logFileURL) {
        handle.seekToEndOfFile()
        if let data = message.data(using: .utf8) {
            handle.write(data)
            handle.closeFile()
        }
    } else {
        try? message.write(to: logFileURL, atomically: true, encoding: .utf8)
    }
}
```

## Unit Tests
SwiftLogger includes a suite of unit tests to ensure its functionality.
You can run the tests using the following command:
```
swift test
```

## License
This project is licensed under the MIT License. See the [LICENSE](https://github.com/Berkay-Disli/SwiftLogger/blob/main/LICENSE) for details.

## Contributing
Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

## Contact
If you have any questions or feedback, feel free to reach out.
