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
    
}
