import Foundation
import ArgumentParser

@main
struct PlusMail: ParsableCommand {
    @Option(name: .shortAndLong, help: "Provide an email address.")
    public var email: String
    
    @Option(name: .shortAndLong, help: "Number of emails to generate.")
    var count: Int = 1
    
    @Option(name: .shortAndLong, help: "Path to words file.")
    var file: String = "/usr/share/dict/words"

    public func run() throws {
        
        let components: [String] = self.email.components(separatedBy: "@")
        
        guard components.filter({ !$0.isEmpty }).count == 2 else {
            throw Error.invalidEmail
        }
        
        let words = try String(contentsOfFile: file, encoding: .utf8)
            .components(separatedBy: .newlines)
        
        for _ in 0..<self.count {
            guard let word = words.randomElement() else {
                throw Error.noRandomWord
            }
            
            print("\(components[0])+\(word)@\(components[1])")
        }
    }
}

extension PlusMail {
    enum Error: LocalizedError {
        case invalidEmail
        case noRandomWord
        
        var errorDescription: String? {
            switch self {
            case .invalidEmail:
                return "Invalid email address."
            case .noRandomWord:
                return "No random word available."
            }
        }
    }
}
