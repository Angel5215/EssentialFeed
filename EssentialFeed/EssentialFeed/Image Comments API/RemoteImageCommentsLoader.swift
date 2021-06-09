//
//  RemoteImageCommentsLoader.swift
//  EssentialFeed
//
//  Created by Ángel Vázquez on 05/06/21.
//

import Foundation

public typealias RemoteImageCommentsLoader = RemoteLoader<[ImageComment]>

public extension RemoteImageCommentsLoader {
    convenience init(url: URL, client: HTTPClient) {
        self.init(url: url, client: client, mapper: ImageCommentsMapper.map)
    }
}
