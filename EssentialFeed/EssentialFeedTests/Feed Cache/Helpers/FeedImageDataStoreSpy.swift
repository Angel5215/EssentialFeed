//
//  FeedImageDataStoreSpy.swift
//  EssentialFeedTests
//
//  Created by Ángel Vázquez on 26/12/20.
//

import EssentialFeed
import Foundation

class FeedImageDataStoreSpy: FeedImageDataStore {
    enum Message: Equatable {
        case retrieve(dataFor: URL)
        case insert(data: Data, for: URL)
    }
    
    private var retrievalCompletions = [(FeedImageDataStore.RetrievalResult) -> Void]()
    private(set) var receivedMessages = [Message]()
    
    private var insertionCompletions = [(FeedImageDataStore.InsertionResult) -> Void]()
    
    func retrieve(dataForURL url: URL, completion: @escaping (FeedImageDataStore.RetrievalResult) -> Void) {
        receivedMessages.append(.retrieve(dataFor: url))
        retrievalCompletions.append(completion)
    }
    
    func insert(_ data: Data, for url: URL, completion: @escaping (InsertionResult) -> Void) {
        receivedMessages.append(.insert(data: data, for: url))
        insertionCompletions.append(completion)
    }
    
    func completeRetrieval(with error: Error, at index: Int = 0) {
        retrievalCompletions[index](.failure(error))
    }
    
    func completeRetrieval(with data: Data?, at index: Int = 0) {
        retrievalCompletions[index](.success(data))
    }
    
    func completeInsertion(with error: Error, at index: Int = 0) {
        insertionCompletions[index](.failure(error))
    }
}
