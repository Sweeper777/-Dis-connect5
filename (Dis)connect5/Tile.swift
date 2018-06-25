

public enum Tile {
    case empty
    case blue
    case red
}

public enum PlayerSides {
    case connect
    case disconnect
}

public class Game: CustomStringConvertible {
    let boardSize = 6
    
    var board: Array2D<Tile>
    
    public init() {
        board = Array2D(columns: boardSize, rows: boardSize, initialValue: .empty)
    }
}
