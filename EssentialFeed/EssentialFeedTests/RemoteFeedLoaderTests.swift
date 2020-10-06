//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Angel Vázquez on 05/10/20.
//

import XCTest

class RemoteFeedLoader {
    
    let url: URL
    let client: HTTPClient
    
    init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    func load() {
        client.get(from: url)
    }
}

protocol HTTPClient {
    func get(from url: URL)
}

class HTTPClientSpy: HTTPClient {
    func get(from url: URL) {
        requestedURL = url
    }
    
    var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {
    func test_init_doesNotRequestDataFromURL() {
        let url = URL(string: "https://a-url.com")!
        let client = HTTPClientSpy()
        _ = RemoteFeedLoader(url: url, client: client)
        
        // Assert we didn't make a URL Request since that should only happen when `load()` is invoked.
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL() {
        // Arrange. "Given a client and a sut"
        let url = URL(string: "https://a-given-url.com")!
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        
        // Act. "When we invoke sut.load()"
        sut.load()
        
        // Assert. "Then assert that a URL request was initiated in the client"
        XCTAssertEqual(client.requestedURL, url)
    }
}
