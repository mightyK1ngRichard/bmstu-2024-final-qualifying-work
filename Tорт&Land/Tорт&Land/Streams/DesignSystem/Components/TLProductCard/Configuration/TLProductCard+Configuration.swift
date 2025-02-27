//
//  TLProductCard+Configuration.swift
//  Tорт&Land
//
//  Created by Dmitriy Permyakov on 21.12.2024.
//

import Foundation
import SwiftUI

extension TLProductCard {

    struct Configuration: Hashable {
        /// Configuration of the image view
        var imageConfiguration: TLImageView.Configuration = .init()
        /// Configuration of the badge view
        var badgeViewConfiguration: TLBadgeView.Configuration?
        /// Height of the image view
        var imageHeight: CGFloat = .zero
        /// Configuration of the product info
        var productButtonConfiguration: TLProductButton.Configuration = .init()
        /// Configuration of the product rating
        var starsViewConfiguration: TLStarsView.Configuration = .init()
        /// Product info
        var productText: ProductText = .init()
    }
}

// MARK: - ProductText

extension TLProductCard.Configuration {

    struct ProductText: Hashable {
        var seller: String?
        var productName: String?
        var productPrice: String = ""
        var productDiscountedPrice: String?
    }
}

// MARK: - Shimmering

extension TLProductCard.Configuration {

    var isShimmering: Bool {
        imageConfiguration.isShimmering
        || productButtonConfiguration.isShimmering
        || starsViewConfiguration.isShimmering
    }
}
