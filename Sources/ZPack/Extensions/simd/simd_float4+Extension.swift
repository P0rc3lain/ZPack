import simd

public extension simd_float4 {
    var xyz: simd_float3 {
        simd_make_float3(x, y, z)
    }
    var zyxw: simd_float4 {
        simd_float4(z, y, x, w)
    }
    var norm: Float {
        length(self)
    }

}
