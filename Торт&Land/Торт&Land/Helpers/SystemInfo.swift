//
//  SystemInfo.swift
//  Tорт&Land
//
//  Created by Dmitriy Permyakov on 08.02.2025.
//

import Foundation
import UIKit

struct SystemInfo {
    private static let device = UIDevice.current
    private static let screen = UIScreen.main
    private static let bundle = Bundle.main

    static let systemVersion = device.systemVersion
    static let modelName = device.modelName
    static let width = screen.bounds.width
    static let height = screen.bounds.height
    static let bounds = screen.bounds
    static let appVersion = bundle.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
}
