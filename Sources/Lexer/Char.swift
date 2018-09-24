public struct Char {

    enum Kind {
        case eof
        case lineFeed
        case space

        case leftParen, rightParen
        case leftBrace, rightBrace
        case leftBracket, rightBracket

        case identifierHead
        case identifierBody

        case arrow

        case unknown(debug: Character)
    }

    let kind: Kind
    let value: Character
}


extension Char {
    static let eof = Char(kind: .eof, value: Character(.init(0)))
}

extension Char.Kind: Equatable {}
