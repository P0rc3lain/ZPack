//
//  Copyright © 2026 Mateusz Stompór. All rights reserved.
//

import Metal
import simd

extension MTLPackedFloat3 {
    public var unpacked: simd_float3 {
        simd_float3(x, y, z)
    }
    public var float4WithZero: simd_float4 {
        simd_make_float4(x, y, z, 0)
    }
    public var float4WithOne: simd_float4 {
        simd_make_float4(x, y, z, 1)
    }
}
