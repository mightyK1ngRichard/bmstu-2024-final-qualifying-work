//
//  TLProductButton+Configuration.swift
//  Tорт&Land
//
//  Created by Dmitriy Permyakov on 22.12.2024.
//

import SwiftUI

extension TLProductButton {

    struct Configuration: Hashable {
        /// Color of the background view
        var backgroundColor: Color = .clear
        /// Size of the view
        var buttonSize: CGFloat = .zero
        /// Size of the icon
        var iconSize: CGFloat = .zero
        /// Color of the shadow
        var shadowColor: Color = .clear
        /// Shimmering flag
        var isShimmering: Bool = false
        /// Icon kind
        var kind: Kind = .clear
    }
}

// MARK: - Kind

extension TLProductButton.Configuration {

    /// Kind of the component icon
    enum Kind: Hashable {
        case favorite(isSelected: Bool = false)
        case basket
        case clear
    }
}

extension TLProductButton.Configuration.Kind {

    var isSelected: Bool {
        switch self {
        case let .favorite(isSelected):
            return isSelected
        default:
            return false
        }
    }

    func iconColor(iconIsSelected: Bool = false) -> Color {
        switch self {
        case .favorite:
            return iconIsSelected ? TLColor<IconPalette>.iconRed.color : TLColor<IconPalette>.iconGray.color
        case .basket:
            return TLColor<IconPalette>.iconBasket.color
        case .clear:
            return .clear
        }
    }

    func iconImage(isSelected: Bool) -> Image? {
        switch self {
        case .basket:
            return Image(.basketIcon)
        case .favorite:
            return isSelected ? Image(.favoritePressed) : Image(.favoriteBorder)
        case .clear:
            return nil
        }
    }

    var backgroundColor: Color {
        switch self {
        case .basket:
            return TLColor<BackgroundPalette>.bgBasketColor.color
        case .favorite:
            return TLColor<BackgroundPalette>.bgFavoriteIcon.color
        case .clear:
            return .clear
        }
    }

    var shadowColor: Color {
        switch self {
        case .basket:
            return TLColor<ShadowPalette>.basket.color
        case let .favorite(isSelected):
            return isSelected
            ? TLColor<ShadowPalette>.favoriteSeletected.color
            : TLColor<ShadowPalette>.favoriteUnseletected.color
        case .clear:
            return .clear
        }
    }
}

