
public class Scanner {

    typealias Pointer = String.Index
    private let content: String

    var currentCursor: Pointer
    private var nextCursor: Pointer {
        return content.index(after: currentCursor)
    }

    init(content: String) {
        self.content = content
        self.currentCursor = content.startIndex
    }

    func advance() {
        currentCursor = nextCursor
    }

    func scan() -> Char {
        guard let character = character(at: currentCursor) else {
            return .eof
        }

        let kind = charKind(for: character)
        return Char(kind: kind, value: character)
    }

    func peek() -> Character? {
        return character(at: nextCursor)
    }

    private func character(at pointer: Pointer) -> Character? {
        guard pointer < content.endIndex else {
            return nil
        }
        return content[pointer]
    }

    func charKind(for character: Character) -> Char.Kind {
        switch character {
        case " ":
            return .space
        case "\n":
            return .lineFeed
        case "(":
            return .leftParen
        case ")":
            return .rightParen
        case "{":
            return .leftBrace
        case "}":
            return .rightBrace
        case "[":
            return .leftBracket
        case "]":
            return .rightBracket
        case "-":
            if let next = peek() {
                switch next {
                case ">":
                    return .arrow
                default:
                    return .unknown(debug: character)
                }
            }
            return .unknown(debug: character)
        default:
            if character.isIdentifierBody {
                return .identifierBody
            } else if character.isIdentifierHead {
                return .identifierHead
            }
            return .unknown(debug: character)
        }
    }
}


extension Character {

    // TODO
    fileprivate var isIdentifierHead: Bool {
        switch self {
        case "A"..."Z",
             "a"..."z":
            return true
        default:
            return false
        }
    }
    fileprivate var isIdentifierBody: Bool {
        switch self {
        case "0"..."9":
            return true
        default:
            return false
        }
    }
}
