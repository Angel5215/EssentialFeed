//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Angel Vázquez on 05/10/20.
//

import XCTest

class RemoteFeedLoader {
    func load() {
        HTTPClient.shared.get(from: URL(string: "https://a-url.com")!)
    }
}

class HTTPClient {
    // Not a singleton anymore, we have some global mutable state but it allows this class
    // to be mocked during tests.
    static var shared = HTTPClient()
        
    func get(from url: URL) {
        
    }
}

class HTTPClientSpy: HTTPClient {
    override func get(from url: URL) {
        requestedURL = url
    }
    
    var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        _ = RemoteFeedLoader()
        
        // Assert we didn't make a URL Request since that should only happen when `load()` is invoked.
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL() {
        // Arrange. "Given a client and a sut"
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        let sut = RemoteFeedLoader()
        
        // Act. "When we invoke sut.load()"
        sut.load()
        
        // Assert. "Then assert that a URL request was initiated in the client"
        XCTAssertNotNil(client.requestedURL)
    }
}
