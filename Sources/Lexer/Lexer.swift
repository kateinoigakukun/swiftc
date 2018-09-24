import Foundation

public class Lexer {

    let scanner: Scanner
    private var wasStringLast = false
    private var isStringStart = false

    public init(text: String) {
        self.scanner = Scanner(content: text)
    }

    public func lex() -> Token {
        let char = scanner.scan()
        func tokenKind(for char: Char) -> Token.Kind {
            switch char.kind {
            case .eof: return .eof
            case .lineFeed, .space:
                scanner.advance()
                return tokenKind(for: scanner.scan())
            case .leftParen: return .leftParen
            case .rightParen: return .rightParen
            case .leftBrace: return .leftBrace
            case .rightBrace: return .rightBrace
            case .leftBracket: return .leftBracket
            case .rightBracket: return .rightBracket
            case .identifierHead:
                return lexIdentifierOrKeyword(char: char.value)
            case .arrow:
                scanner.advance()
                return .arrow
            default:
                return .unknown(debug: String(describing: char))
            }
        }
        let kind = tokenKind(for: char)
        return Token(kind: kind)
    }
}

extension Lexer {
    enum Error: Swift.Error {
        case unrecognizedCharacter(Character, String.Index)
    }
}
