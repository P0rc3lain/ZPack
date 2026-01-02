import simd
import Metal

extension MTLPackedFloat3 {
    var unpacked: simd_float3 {
        simd_float3(x, y, z)
    }
    var float4WithZero: simd_float4 {
        simd_make_float4(x, y, z, 0)
    }
    var float4WithOne: simd_float4 {
        simd_make_float4(x, y, z, 1)
    }
}
