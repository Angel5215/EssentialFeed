//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Angel Vázquez on 25/10/20.
//

import Foundation

// FeedItem represented in the context of the API to avoid
// leaking implementation details from the Boundaries module
struct RemoteFeedItem: Decodable {
    let id: UUID
    let description: String?
    let location: String?
    let image: URL
}
