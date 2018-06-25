

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
    
    @discardableResult
    public func placeTile(_ tile: Tile, at position: Position) -> Bool {
        if tile == .empty {
            return false
        }
        
        switch board[position] {
        case .empty:
            board[position] = tile
            return true
        default:
            return false
        }
    }
    
    public var description: String {
        var desc = ""
        for y in 0..<boardSize {
            for x in 0..<boardSize {
                switch board[x, y] {
                case .empty:
                    desc += "⚪️"
                case .blue:
                    desc += "🔵"
                case .red:
                    desc += "🔴"
                }
            }
            desc += "\n"
        }
        return desc
    }
}
