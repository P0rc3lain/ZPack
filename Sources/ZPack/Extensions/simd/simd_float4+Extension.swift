import simd

extension simd_float4 {
    public var xyz: simd_float3 {
        simd_make_float3(x, y, z)
    }
    public var zyxw: simd_float4 {
        simd_float4(z, y, x, w)
    }
    public var norm: Float {
        length(self)
    }

}
