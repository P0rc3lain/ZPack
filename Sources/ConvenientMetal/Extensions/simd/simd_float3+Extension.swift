import Metal
import simd

extension simd_float3 {
    var packed: MTLPackedFloat3 {
        MTLPackedFloat3Make(x, y, z)
    }
    var float4WithZero: simd_float4 {
        simd_make_float4(x, y, z, 0)
    }
    var float4WithOne: simd_float4 {
        simd_make_float4(x, y, z, 1)
    }
}
