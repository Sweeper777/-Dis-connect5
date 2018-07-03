struct PortionInfo {
    let tile: Tile
    let length: Int
    let emptyCount: Int
    
    var tileCount: Int {
        return length - emptyCount
    }
}

struct RowAnalyser {
    let row: [Tile]
    
    func countPortion(of targetTile: Tile) -> [PortionInfo] {
        var retVal = [PortionInfo]()
        var currentCount = 0
        var currentEmptyCount = 0
        
        for tile in row {
            switch tile {
            case .empty:
                currentEmptyCount += 1
                fallthrough
            case targetTile:
                currentCount += 1
            default:
                retVal.append(PortionInfo(tile: targetTile, length: currentCount, emptyCount: currentEmptyCount))
            }
        }
        if currentCount != 0 {
            retVal.append(PortionInfo(tile: targetTile, length: currentCount, emptyCount: currentEmptyCount))
        }
        return retVal
    }
    
    func analyse() -> Int {
        let portions = [countPortion(of: .red), countPortion(of: .blue)].flatMap { $0 }
        let connectablePortions = portions.filter { $0.length >= 5 }
        if connectablePortions.isEmpty {
            return 0
        }
        return connectablePortions.map { $0.tileCount }.reduce(0, +)
    }
}
