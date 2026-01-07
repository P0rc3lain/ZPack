//
//  Copyright © 2026 Mateusz Stompór. All rights reserved.
//

import Metal
import simd

extension MTLPackedFloat4x3 {
    public var unpacked: simd_float4x3 {
        simd_float4x3(columns.0.unpacked,
                      columns.1.unpacked,
                      columns.2.unpacked,
                      columns.3.unpacked)
    }
    public static var identity: MTLPackedFloat4x3 {
        var matrix = MTLPackedFloat4x3()
        matrix.columns.0 = MTLPackedFloat3Make(1, 0, 0)
        matrix.columns.1 = MTLPackedFloat3Make(0, 1, 0)
        matrix.columns.2 = MTLPackedFloat3Make(0, 0, 1)
        matrix.columns.3 = MTLPackedFloat3Make(0, 0, 0)
        return matrix
    }
 }
