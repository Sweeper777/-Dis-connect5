

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
    
    public func checkWinner() -> PlayerSides? {
        func fiveTilesInARow(positions: [Position]) -> Bool {
            if positions.count < 5 {
                return false
            }
            let tiles = positions.map { self.board[$0] }
            var currentTile: Tile = .red
            var count = 0
            loop: for tile in tiles {
                switch tile {
                case .empty:
                    continue loop
                default:
                    if tile == currentTile {
                        count += 1
                        if count == 5 {
                            return true
                        }
                    } else {
                        count = 1
                        currentTile = tile
                    }
                }
            }
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
