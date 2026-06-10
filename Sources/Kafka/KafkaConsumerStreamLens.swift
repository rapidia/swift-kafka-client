//===----------------------------------------------------------------------===//
//
// This source file is part of the swift-kafka-client open source project
//
// Copyright (c) 2026 Apple Inc. and the swift-kafka-client project authors
// Licensed under Apache License v2.0
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of swift-kafka-client project authors
//
// SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------===//

/// Topic metadata used by read-only browser clients.
public struct KafkaStreamLensTopicMetadata: Sendable, Hashable {
    public var name: String
    public var partitions: [KafkaPartition]

    public init(name: String, partitions: [KafkaPartition]) {
        self.name = name
        self.partitions = partitions
    }
}

/// Low and high watermark offsets for a topic partition.
public struct KafkaStreamLensWatermarkOffsets: Sendable, Hashable {
    public var topic: String
    public var partition: KafkaPartition
    public var lowOffset: KafkaOffset
    public var highOffset: KafkaOffset

    public init(
        topic: String,
        partition: KafkaPartition,
        lowOffset: KafkaOffset,
        highOffset: KafkaOffset
    ) {
        self.topic = topic
        self.partition = partition
        self.lowOffset = lowOffset
        self.highOffset = highOffset
    }
}

/// Poll result that preserves partition EOF events.
public enum KafkaStreamLensPollEvent: Sendable, Hashable {
    case message(KafkaConsumerMessage)
    case partitionEOF(KafkaPartition)
}
