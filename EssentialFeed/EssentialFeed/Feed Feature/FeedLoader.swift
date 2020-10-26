//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Angel Vázquez on 04/10/20.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedImage])
    case failure(Error)
}

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
