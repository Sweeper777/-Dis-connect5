struct PortionInfo {
    let tile: Tile
    let length: Int
    let emptyCount: Int
    
    var tileCount: Int {
        return length - emptyCount
    }
}
