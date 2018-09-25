import AST
import Lexer

class Parser {
    let lexer: Lexer

    init(content: String) {
        self.lexer = Lexer(text: content)
    }
    public func parse() -> TopLevelCodeDecl {
        return parseTopLevelDecl()
    }
}

