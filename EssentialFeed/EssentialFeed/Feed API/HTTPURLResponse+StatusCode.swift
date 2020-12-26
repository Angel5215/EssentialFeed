//
//  HTTPURLResponse+StatusCode.swift
//  EssentialFeed
//
//  Created by Ángel Vázquez on 26/12/20.
//

import Foundation

extension HTTPURLResponse {
    private static var OK_200: Int { 200 }

    var isOK: Bool {
        return statusCode == HTTPURLResponse.OK_200
    }
}
