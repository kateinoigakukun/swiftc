public struct TopLevelCodeDecl: ASTNode {
    let parent: ASTNode?
    let statements: [Statement]
}
