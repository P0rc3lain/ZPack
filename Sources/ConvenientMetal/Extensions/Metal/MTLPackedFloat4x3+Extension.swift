import Metal
import simd

extension MTLPackedFloat4x3 {
    var unpacked: simd_float4x3 {
        simd_float4x3(columns.0.unpacked,
                      columns.1.unpacked,
                      columns.2.unpacked,
                      columns.3.unpacked)
    }
}
