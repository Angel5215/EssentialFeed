//
//  FeedCache.swift
//  EssentialFeed
//
//  Created by Ángel Vázquez on 01/01/21.
//

import Foundation

public protocol FeedCache {
    typealias Result = Swift.Result<Void, Error>
    
    func save(_ feed: [FeedImage], completion: @escaping (Result) -> Void)
}
