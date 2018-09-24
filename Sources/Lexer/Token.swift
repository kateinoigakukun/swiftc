public struct Token {

    public enum Kind {

        case eof

        case arrow

        case leftParen, rightParen
        case leftBrace, rightBrace
        case leftBracket, rightBracket

        case identifier(String)

        case `func`

        case unknown(debug: String)
    }

    let kind: Kind
}

public enum Constant: Equatable {
    case string(String)
}

extension Token.Kind: Equatable {}
