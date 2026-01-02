import simd

extension simd_float4 {
    var xyz: simd_float3 {
        simd_make_float3(x, y, z)
    }
}
