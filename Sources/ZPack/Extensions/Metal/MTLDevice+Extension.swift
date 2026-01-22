//
//  Copyright © 2026 Mateusz Stompór. All rights reserved.
//

import Metal
import simd

extension MTLDevice {
    public func makeBuffer<T>(bytes pointer: UnsafeRawPointer,
                              type: T.Type,
                              count: Int,
                              options: MTLResourceOptions = []) -> MTLBuffer? {
        let length = MemoryLayout<T>.stride * count
        return makeBuffer(bytes: pointer, length: length, options: options)
    }

    public func makeBuffer<T>(array: [T], options: MTLResourceOptions = []) -> MTLBuffer? {
        guard !array.isEmpty else { return nil }
        let length = MemoryLayout<T>.stride * array.count
        return makeBuffer(bytes: array, length: length, options: options)
    }

    public func makeBuffer<T>(element: T, options: MTLResourceOptions = []) -> MTLBuffer? {
        makeBuffer(array: [element])
    }

    public func makeTextureSolid2D(color: simd_float4) -> MTLTexture? {
        guard let texture = makeTexture(descriptor: .rgba32FloatTile) else {
            assertionFailure("Texture creation has failed")
            return nil
        }
        let region = MTLRegion(origin: .zero,
                               size: texture.size)
        let rawData = [simd_float4](repeating: color, count: 64)
        var failed = false
        rawData.withUnsafeBytes { ptr in
            guard let baseAddress = ptr.baseAddress else {
                failed = true
                return
            }
            texture.replace(region: region,
                            mipmapLevel: 0,
                            withBytes: baseAddress,
                            bytesPerRow: 128)
        }
        return failed ? nil : texture
    }
}
