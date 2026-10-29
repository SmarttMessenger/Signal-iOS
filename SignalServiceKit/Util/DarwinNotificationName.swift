//
// Copyright 2020 Signal Messenger, LLC
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation

public struct DarwinNotificationName: ExpressibleByStringLiteral {
    // [Smartt: app-identity]
    // Darwin notifications are system-wide. Prefixing them with our own bundle ID prefix
    // keeps Signal, installed on the same phone, from posting or answering ours.
    private static let prefix = Bundle.main.bundleIdPrefix

    public static let nseDidReceiveNotification = DarwinNotificationName("\(prefix).nseDidReceiveNotification")
    public static let mainAppHandledNotification = DarwinNotificationName("\(prefix).mainAppHandledNotification")
    public static let mainAppLaunched = DarwinNotificationName("\(prefix).mainAppLaunched")
    static let primaryDBFolderNameDidChange = DarwinNotificationName("\(prefix).primaryDBFolderNameDidChange")

    static func sdsCrossProcess(for type: AppContextType) -> DarwinNotificationName {
        DarwinNotificationName("\(prefix).sdscrossprocess.\(type)")
    }

    static func connectionLock(for priority: Int) -> DarwinNotificationName {
        return DarwinNotificationName("\(prefix).connection.\(priority)")
    }
    // [/Smartt]

    public typealias StringLiteralType = String

    public let rawValue: String

    public init(stringLiteral name: String) {
        owsPrecondition(!name.isEmpty)
        self.rawValue = name
    }

    public init(_ name: String) {
        owsAssertDebug(!name.isEmpty)
        self.rawValue = name
    }
}
