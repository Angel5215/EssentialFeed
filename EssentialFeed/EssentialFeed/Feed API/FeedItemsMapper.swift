//
//  FeedItemsMapper.swift
//  EssentialFeed
//
//  Created by Angel Vázquez on 08/10/20.
//

import Foundation

// FeedItem represented in the context of the API to avoid
// leaking implementation details from the Boundaries module
internal struct RemoteFeedItem: Decodable {
    internal let id: UUID
    internal let description: String?
    internal let location: String?
    internal let image: URL
}

internal final class FeedItemsMapper {
    
    private struct Root: Decodable {
        let items: [RemoteFeedItem]
    }
    
    private static var OK_200: Int { return 200 }
    
    internal static func map(_ data: Data, from response: HTTPURLResponse) throws -> [RemoteFeedItem] {
        
        guard response.statusCode == OK_200,
              let root = try? JSONDecoder().decode(Root.self, from: data)  else {
            throw RemoteFeedLoader.Error.invalidData
        }
        
        return root.items
    }
}
