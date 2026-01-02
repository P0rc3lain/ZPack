import Metal
import simd

extension simd_float3 {
    var packed: MTLPackedFloat3 {
        MTLPackedFloat3Make(x, y, z)
    }
}
