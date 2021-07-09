//
//  NullStore.swift
//  EssentialApp
//
//  Created by Ángel Vázquez on 08/07/21.
//

import EssentialFeed
import Foundation

class NullStore: FeedStore, FeedImageDataStore {
    func deleteCachedFeed(completion: @escaping FeedStore.DeletionCompletion) {
        completion(.success(()))
    }
    
    func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping FeedStore.InsertionCompletion) {
        completion(.success(()))
    }
    
    func retrieve(completion: @escaping FeedStore.RetrievalCompletion) {
        completion(.success(.none))
    }
    
    func retrieve(dataForURL url: URL, completion: @escaping (FeedImageDataStore.RetrievalResult) -> Void) {
        completion(.success(.none))
    }
    
    func insert(_ data: Data, for url: URL, completion: @escaping (FeedImageDataStore.InsertionResult) -> Void) {
        completion(.success(()))
    }
}
