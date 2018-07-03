extension PlayerSides {
    func reversed() -> PlayerSides {
        return self == .connect ? .disconnect : .connect
    }
}

