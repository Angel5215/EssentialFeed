//
//  CoreDataFeedStore.swift
//  EssentialFeed
//
//  Created by Angel Vázquez on 13/11/20.
//

import Foundation

public class CoreDataFeedStore: FeedStore {
    
    public init() { }
    
    public func retrieve(completion: @escaping RetrievalCompletion) {
        completion(.empty)
    }
    
    public func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion) {
        
    }
    
    public func deleteCachedFeed(completion: @escaping DeletionCompletion) {
        
    }
}
