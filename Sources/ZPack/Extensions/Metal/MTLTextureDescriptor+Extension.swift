//
//  Copyright © 2026 Mateusz Stompór. All rights reserved.
//

import Metal

extension MTLTextureDescriptor {
    static var rgba32FloatTile: MTLTextureDescriptor {
        let descriptor = MTLTextureDescriptor()
        descriptor.width = 8
        descriptor.height = 8
        descriptor.mipmapLevelCount = 1
        descriptor.storageMode = .shared
        descriptor.arrayLength = 1
        descriptor.sampleCount = 1
        descriptor.cpuCacheMode = .defaultCache
        descriptor.allowGPUOptimizedContents = false
        descriptor.pixelFormat = .rgba32Float
        descriptor.textureType = .type2D
        descriptor.usage = .shaderRead
        return descriptor
    }
}
