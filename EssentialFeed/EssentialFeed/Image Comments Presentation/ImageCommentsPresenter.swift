//
//  ImageCommentsPresenter.swift
//  EssentialFeed
//
//  Created by Ángel Vázquez on 19/06/21.
//

import Foundation

public class ImageCommentsPresenter {
    public static var title: String {
        NSLocalizedString(
            "IMAGE_COMMENTS_VIEW_TITLE",
            tableName: "ImageComments",
            bundle: Bundle(for: Self.self),
            comment: "Title for the image comments view"
        )
    }
}
