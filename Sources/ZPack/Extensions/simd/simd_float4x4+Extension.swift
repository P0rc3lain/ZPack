import simd

extension simd_float4x4 {
    public var droppedRow: simd_float4x3 {
        simd_float4x3(columns.0.xyz, columns.1.xyz, columns.2.xyz, columns.3.xyz)
    }
    public var translation: simd_float3 {
        get {
            columns.3.xyz
        } set {
            columns.3 = simd_float4(newValue, columns.3.w)
        }
    }
    public var rotation: simd_quatf {
        simd_quatf(self)
    }
    public var scale: simd_float3 {
        simd_float3(simd_length(columns.0.xyz),
                    simd_length(columns.1.xyz),
                    simd_length(columns.2.xyz))
    }
    public static func orientation(quaternion: simd_quatf) -> simd_float4x4 {
        simd_float4x4(quaternion)
    }
    public static func translation(vector: simd_float3) -> simd_float4x4 {
        simd_float4x4(columns: (simd_float4(1, 0, 0, 0),
                                simd_float4(0, 1, 0, 0),
                                simd_float4(0, 0, 1, 0),
                                simd_float4(vector, 1)))
    }
    public static func scale(_ factors: simd_float3) -> simd_float4x4 {
        simd_float4x4(diagonal: simd_float4(factors, 1))
    }
    public static func scale(factor: Float) -> simd_float4x4 {
        simd_float4x4(diagonal: simd_float4([factor, factor, factor], 1))
    }
    public static var identity: simd_float4x4 {
        matrix_identity_float4x4
    }
    public init(_ matrix: simd_double4x4) {
        let columns = matrix.columns
        self.init(columns: (simd_float4(columns.0),
                            simd_float4(columns.1),
                            simd_float4(columns.2),
                            simd_float4(columns.3)))
    }
    public init(repeatingRow row: simd_float4) {
        self.init(rows: [row, row, row, row])
    }
    public init(repeatingColumn column: simd_float4) {
        self.init(columns: (column, column, column, column))
    }
    public static func perspectiveProjectionRightHand(fovyRadians: simd_float1,
                                                      aspect: simd_float1,
                                                      nearZ: simd_float1,
                                                      farZ: simd_float1) -> simd_float4x4 {
        let yScale = 1 / tan(fovyRadians * 0.5)
        let xScale = yScale / aspect
        let zScale = farZ / (nearZ - farZ)
        return simd_float4x4(rows: [simd_float4(yScale, 0, 0, 0),
                                    simd_float4(0, xScale, 0, 0),
                                    simd_float4(0, 0, zScale, nearZ * zScale),
                                    simd_float4(0, 0, -1, 0 )])
    }
    public static func orthographicProjection(left: Float,
                                              right: Float,
                                              top: Float,
                                              bottom: Float,
                                              near: Float,
                                              far: Float) -> simd_float4x4 {
        let sLength = 1.0 / (right - left)
        let aLength = right + left
        let sHeight = 1.0 / (top - bottom)
        let aHeight = top + bottom
        let sDepth = 1.0 / (far - near)
        let p = simd_float4(2 * sLength, 0, 0, 0)
        let q = simd_float4(0, 2 * sHeight, 0, 0)
        let r = simd_float4(0, 0, -sDepth, 0)
        let s = simd_float4(-aLength * sLength, -aHeight * sHeight, -near * sDepth, 1)
        return float4x4(p, q, r, s)
    }
    public static func from(directionVector: simd_float3) -> simd_float4x4 {
        simd_float3x3.from(directionVector: directionVector).expanded
    }
    public static func composeTRS(translation: simd_float3,
                                  rotation: simd_quatf,
                                  scale: simd_float3) -> simd_float4x4 {
        .translation(vector: translation) * rotation.rotationMatrix * .scale(scale)
    }
    public static func composeRTS(translation: simd_float3,
                                  rotation: simd_quatf,
                                  scale: simd_float3) -> simd_float4x4 {
        rotation.rotationMatrix * .translation(vector: translation) * .scale(scale)
    }
    public static func compose(translation: simd_float3,
                               scale: simd_float3) -> simd_float4x4 {
        .translation(vector: translation) * .scale(scale)
    }
}
