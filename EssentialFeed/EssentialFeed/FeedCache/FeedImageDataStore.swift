//
//  FeedImageDataStore.swift
//  EssentialFeed
//
//  Created by Ángel Vázquez on 26/12/20.
//

import Foundation

public protocol FeedImageDataStore {
    func insert(_ data: Data, for url: URL) throws
    func retrieve(dataForURL url: URL) throws -> Data?
}
