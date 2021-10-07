//
//  ImageData.swift
//  UIKit-CRUD
//
//  Created by Alejandro De Leon on 10/7/21.
//

import Foundation

struct FetchedImage: Codable {
    let albumID, id: Int
    let title: String
    let url, thumbnailURL: String

    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }
}
