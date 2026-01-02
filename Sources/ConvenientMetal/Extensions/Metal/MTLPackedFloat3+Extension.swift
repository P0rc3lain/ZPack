import simd
import Metal

extension MTLPackedFloat3 {
    var unpacked: simd_float3 {
        simd_float3(x, y, z)
    }
}
