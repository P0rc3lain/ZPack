import simd

extension simd_quatf {
    public var rotationMatrix: simd_float4x4 {
        simd_float4x4(self)
    }
}
