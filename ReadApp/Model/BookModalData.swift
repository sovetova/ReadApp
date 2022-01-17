//
//  BookModalData.swift
//  ReadApp
//
//  Created by Dilsh on 23.12.2021.
//

import Foundation

// MARK: - BookModal
struct BookModal: Codable {
    var kind: String?
    var totalItems: Int?
    var items: [Item]?
}

// MARK: - Item
struct Item: Codable {
    var kind, id, etag: String?
    var selfLink: String?
    var volumeInfo: VolumeInfo?
    var saleInfo: SaleInfo?
    var accessInfo: AccessInfo?
    var searchInfo: SearchInfo?
}

// MARK: - AccessInfo
struct AccessInfo: Codable {
    var country, viewability: String?
    var embeddable, publicDomain: Bool?
    var textToSpeechPermission: String?
    var epub, pdf: Epub?
    var webReaderLink: String?
    var accessViewStatus: String?
    var quoteSharingAllowed: Bool?
}

// MARK: - Epub
struct Epub: Codable {
    var isAvailable: Bool?
    var downloadLink: String?
}

// MARK: - SaleInfo
struct SaleInfo: Codable {
    var country, saleability: String?
    var isEbook: Bool?
    var buyLink: String?
}

// MARK: - SearchInfo
struct SearchInfo: Codable {
    var textSnippet: String?
}

// MARK: - VolumeInfo
struct VolumeInfo: Codable {
    var title: String?
    var authors: [String]?
    var publisher, publishedDate, volumeInfoDescription: String?
    var industryIdentifiers: [IndustryIdentifier]?
    var readingModes: ReadingModes?
    var pageCount: Int?
    var printType: String?
    var categories: [String]?
    var averageRating, ratingsCount: Int?
    var maturityRating: String?
    var allowAnonLogging: Bool?
    var contentVersion: String?
    var panelizationSummary: PanelizationSummary?
    var imageLinks: ImageLinks?
    var language: String?
    var previewLink: String?
    var infoLink: String?
    var canonicalVolumeLink: String?
    var subtitle: String?

    enum CodingKeys: String, CodingKey {
        case title, authors, publisher, publishedDate
        case volumeInfoDescription = "description"
        case industryIdentifiers, readingModes, pageCount, printType, categories, averageRating, ratingsCount, maturityRating, allowAnonLogging, contentVersion, panelizationSummary, imageLinks, language, previewLink, infoLink, canonicalVolumeLink, subtitle
    }
}

// MARK: - ImageLinks
struct ImageLinks: Codable {
    var smallThumbnail, thumbnail: String?
}

// MARK: - IndustryIdentifier
struct IndustryIdentifier: Codable {
    var type, identifier: String?
}

// MARK: - PanelizationSummary
struct PanelizationSummary: Codable {
    var containsEpubBubbles, containsImageBubbles: Bool?
}

// MARK: - ReadingModes
struct ReadingModes: Codable {
    var text, image: Bool?
}
// MARK: - NoDataBookModal
struct NoDataBookModal: Codable {
    var kind: String?
    var totalItems: Int?
}

