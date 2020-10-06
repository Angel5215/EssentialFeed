//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Angel Vázquez on 05/10/20.
//

import XCTest

class RemoteFeedLoader {
    
}

class HTTPClient {
    var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClient()
        _ = RemoteFeedLoader()
        
        // Assert we didn't make a URL Request since that should only happen when `load()` is invoked.
        XCTAssertNil(client.requestedURL)
    }
}
