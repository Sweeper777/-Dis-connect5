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
    
}
