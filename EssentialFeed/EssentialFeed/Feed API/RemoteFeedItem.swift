//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Angel Vázquez on 25/10/20.
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
