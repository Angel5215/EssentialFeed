//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Angel Vázquez on 04/10/20.
//

import Foundation

public protocol FeedLoader {
    typealias Result = Swift.Result<[FeedImage], Error>
    
    func load(completion: @escaping (Result) -> Void)
}
