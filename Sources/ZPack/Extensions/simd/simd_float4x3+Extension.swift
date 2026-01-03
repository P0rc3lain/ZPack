import Metal
import simd

public extension simd_float4x3 {
    var packed: MTLPackedFloat4x3 {
        MTLPackedFloat4x3(columns: (columns.0.packed,
                                    columns.1.packed,
                                    columns.2.packed,
                                    columns.3.packed))
        
    }
}
