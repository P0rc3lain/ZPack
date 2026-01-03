import simd

public extension simd_float4x4 {
    var droppedRow: simd_float4x3 {
        simd_float4x3(columns.0.xyz, columns.1.xyz, columns.2.xyz, columns.3.xyz)
    }
    var translation: simd_float3 {
        get {
            columns.3.xyz
        } set {
            columns.3 = simd_float4(newValue, columns.3.w)
        }
    }
    var rotation: simd_quatf {
        simd_quatf(self)
    }
    var scale: simd_float3 {
        simd_float3(simd_length(columns.0.xyz),
                    simd_length(columns.1.xyz),
                    simd_length(columns.2.xyz))
    }
    static func orientation(quaternion: simd_quatf) -> simd_float4x4 {
        simd_float4x4(quaternion)
    }
    static func translation(vector: simd_float3) -> simd_float4x4 {
        simd_float4x4(columns: (simd_float4(1, 0, 0, 0),
                                simd_float4(0, 1, 0, 0),
                                simd_float4(0, 0, 1, 0),
                                simd_float4(vector, 1)))
    }
    static func scale(_ factors: simd_float3) -> simd_float4x4 {
        simd_float4x4(diagonal: simd_float4(factors, 1))
    }
    static func scale(factor: Float) -> simd_float4x4 {
        simd_float4x4(diagonal: simd_float4([factor, factor, factor], 1))
    }
}
