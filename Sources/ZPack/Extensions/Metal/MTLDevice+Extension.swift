//
//  Copyright © 2026 Mateusz Stompór. All rights reserved.
//

import Metal

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
        return makeBuffer(array: [element])
    }
}
