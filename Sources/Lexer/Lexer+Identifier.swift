
private let keywords: [String: Token.Kind] = [
    "func": .func
]

extension Lexer {

    func lexIdentifierOrKeyword(char: Character) -> Token.Kind {
        var id = String(char)
        scanner.advance()

        var current = scanner.scan()
        while current.kind.isIdentifier {
            id += String(current.value)
            scanner.advance()
            current = scanner.scan()
        }

        if let keyword = keywords[id] {
            return keyword
        }
        return .identifier(id)
    }
}

extension Char.Kind {
    fileprivate var isIdentifier: Bool {
        switch self {
        case .identifierHead, .identifierBody:
            return true
        default:
            return false
        }
    }
}
