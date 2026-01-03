public extension Float {
    var radians: Float {
        self / 180 * .pi
    }
    var half: Float16 {
        Float16(self)
    }
}
