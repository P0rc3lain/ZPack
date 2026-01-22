extension Float {
    public var radians: Float {
        self / 180 * .pi
    }
#if arch(arm64)
    public var half: Float16 {
        Float16(self)
    }
#endif
}
