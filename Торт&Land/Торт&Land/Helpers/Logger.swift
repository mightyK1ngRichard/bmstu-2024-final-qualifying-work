//
//  Logger.swift
//  Tорт&Land
//
//  Created by Dmitriy Permyakov on 09.02.2025.
//

import Foundation

final class Logger {
    private init() {}

    static func log(kind: Kind = .info, _ message: Any, fileName: String = #file, function: String = #function, line: Int = #line) {
        #if DEBUG
        let swiftFileName = fileName.split(separator: "/").last ?? "file not found"
        print("[ \(kind.rawValue.uppercased()) ]: [ \(Date()) ]: [ \(swiftFileName) ] [ \(function) ]: [ #\(line) ]")
        print(message)
        print()
        #else
        // TODO: Добавить FirebaseCrashAnalitics, если ошибка
        #endif
    }

    enum Kind: String, Hashable {
        case info  = "ℹ️ info"
        case error = "⛔️ error"
        case debug = "⚙️ debug"
        case warning = "⚠️ warning"
    }
}
