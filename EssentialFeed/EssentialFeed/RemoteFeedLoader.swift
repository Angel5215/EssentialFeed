//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Angel Vázquez on 06/10/20.
//

import Foundation

// This can be public because it can be implemented by external modules.
public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (Error?, URLResponse?) -> Void)
}

public final class RemoteFeedLoader {
    private let url: URL
    private let client: HTTPClient
    
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    public func load(completion: @escaping (Error) -> Void) {
        client.get(from: url) { error, response in
            if response != nil {
                completion(.invalidData)
            } else {
                completion(.connectivity)
            }
        }
    }
}
