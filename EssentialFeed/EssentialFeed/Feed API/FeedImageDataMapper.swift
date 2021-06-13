//
//  FeedImageDataMapper.swift
//  EssentialFeed
//
//  Created by Ángel Vázquez on 13/06/21.
//

import Foundation

public class FeedImageDataMapper {
    private enum Error: Swift.Error {
        case invalidData
    }
    
    public static func map(_ data: Data, from response: HTTPURLResponse) throws -> Data {
        guard response.isOK, !data.isEmpty else { throw Error.invalidData }
        return data
    }
}
