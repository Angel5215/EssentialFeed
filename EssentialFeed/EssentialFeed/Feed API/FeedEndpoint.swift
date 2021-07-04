//
//  FeedEndpoint.swift
//  EssentialFeed
//
//  Created by Ángel Vázquez on 02/07/21.
//

import Foundation

public enum FeedEndpoint {
    case get
    
    public func url(baseURL: URL) -> URL {
        switch self {
        case .get:
            return baseURL.appendingPathComponent("v1/feed")
        }
    }
}
