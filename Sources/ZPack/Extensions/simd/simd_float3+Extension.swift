import Metal
import simd

extension simd_float3 {
    public var packed: MTLPackedFloat3 {
        MTLPackedFloat3Make(x, y, z)
    }
    public var float4WithZero: simd_float4 {
        simd_make_float4(x, y, z, 0)
    }
    public var float4WithOne: simd_float4 {
        simd_make_float4(x, y, z, 1)
    }
    public var norm: Float {
        length(self)
    }
    public static func random(componentRange: Range<Float> = 0 ..< 1) -> simd_float3 {
        simd_float3(.random(in: componentRange),
                    .random(in: componentRange),
                    .random(in: componentRange))
    }
    public var normalized: simd_float3 {
        self / norm
    }
    public mutating func normalize() {
        self /= norm
    }
    public func randomPerpendicular(length: Float = 1) -> simd_float3 {
        let randomVector = simd_float3.random()
        var perpendicular = cross(self, randomVector)
        perpendicular.normalize()
        perpendicular *= length
        return perpendicular
    }
    public init(_ x: Int, _ y: Int, _ z: Int) {
        self.init(Float(x), Float(y), Float(z))
    }
}
