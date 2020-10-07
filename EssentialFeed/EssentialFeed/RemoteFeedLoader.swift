//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Angel Vázquez on 06/10/20.
//

import Foundation

// This can be public because it can be implemented by external modules.
public protocol HTTPClient {
    func get(from url: URL)
}

public final class RemoteFeedLoader {
    private let url: URL
    private let client: HTTPClient
    
    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    public func load() {
        client.get(from: url)
    }
}
