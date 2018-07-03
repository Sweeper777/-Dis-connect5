extension PlayerSides {
    func reversed() -> PlayerSides {
        return self == .connect ? .disconnect : .connect
    }
}

class GameAI {
    var game: Game
    
    let mySide: PlayerSides
    
    init(game: Game, mySide: PlayerSides) {
        self.game = game
        self.mySide = mySide
    }
    
    func evaluateHeuristics() -> Int {
        if let winner = game.checkWinner() {
            return winner == mySide ? 10000 : -10000
        }
        let analysedResult = game.getRows().map(RowAnalyser.init).map { $0.analyse() }.reduce(0, +)
        switch mySide {
        case .connect:
            return analysedResult
        case .disconnect:
            return 1000 - analysedResult
        }
    }
    
    private func minimax(depth: Int, side: PlayerSides) -> (score: Int, position: Position, tile: Tile) {
        var bestScore = side == mySide ? Int.min : Int.max
        var currentScore: Int
        var bestMove: (position: Position, tile: Tile)?
        if game.checkWinner() != nil || depth == 0 {
            bestScore = evaluateHeuristics()
        } else {
            for move in getAvailableMoves() {
                game.board[move.position] = move.tile
                if side == mySide {
                    currentScore = minimax(depth: depth - 1, side: side.reversed()).score
                    if currentScore > bestScore {
                        bestScore = currentScore
                        bestMove = move
                    }
                } else {
                    currentScore = minimax(depth: depth - 1, side:  side.reversed()).score
                    if currentScore < bestScore {
                        bestScore = currentScore
                        bestMove = move
                    }
                }
                game.board[move.position] = .empty
            }
        }
        return (bestScore, bestMove?.position ?? Position(0, 0), bestMove?.tile ?? .empty)
    }
}
