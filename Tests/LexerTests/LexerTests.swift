
import XCTest
@testable import Lexer

class LexerTests: XCTestCase {

    func lex(_ content: String, _ closure: (Token) -> Void) {
        let lexer = Lexer(text: content)
        closure(lexer.lex())
    }

    func testEOF() {
        lex("") { token in
            XCTAssertEqual(token.kind, .eof)
        }
    }

    func testArrow() {
        lex("->") { token in
            XCTAssertEqual(token.kind, .arrow)
        }
    }

    func testFunc() {
        lex("func") { token in
            XCTAssertEqual(token.kind, .func)
        }
    }

    func testIdentifier() {
        lex("foo") { token in
            XCTAssertEqual(token.kind, .identifier("foo"))
        }
    }

    func testParen() {
        lex("(") { token in
            XCTAssertEqual(token.kind, .leftParen)
        }
    }
}
