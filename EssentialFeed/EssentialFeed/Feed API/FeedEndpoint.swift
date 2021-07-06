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
            var components = URLComponents()
            components.scheme = baseURL.scheme
            components.host = baseURL.host
            components.path = baseURL.path.appending("/v1/feed")
            components.queryItems = [
                URLQueryItem(name: "limit", value: "10")
            ]
            
            return components.url!
        }
    }
}
