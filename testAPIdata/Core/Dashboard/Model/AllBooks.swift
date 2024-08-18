//
//  AllBooks.swift
//  testAPIdata
//
//  Created by Eranga Prabath on 2024-08-18.
//

import Foundation
struct AllBooks: Codable {
    let data: [BookData]
}

struct BookData: Codable {
    let id, year: Int
    let title, handle, publisher, isbn: String
    let pages: Int
    let notes: [String]
    let createdAt: String
    let villains: [Villain]

    enum CodingKeys: String, CodingKey {
        case id
        case year = "Year"
        case title = "Title"
        case handle
        case publisher = "Publisher"
        case isbn = "ISBN"
        case pages = "Pages"
        case notes = "Notes"
        case createdAt = "created_at"
        case villains
    }
}

struct Villain: Codable {
    let name: String
    let url: String
}
