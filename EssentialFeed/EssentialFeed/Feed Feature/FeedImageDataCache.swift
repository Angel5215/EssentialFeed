//
//  FeedImageDataCache.swift
//  EssentialFeed
//
//  Created by Ángel Vázquez on 01/01/21.
//

import Foundation

public protocol FeedImageDataCache {
    typealias Result = Swift.Result<Void, Error>
    
    func save(_ data: Data, for url: URL, completion: @escaping (Result) -> Void)
}
