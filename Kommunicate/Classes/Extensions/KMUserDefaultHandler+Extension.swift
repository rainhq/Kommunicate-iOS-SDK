//
//  KMUserDefaultHandler+Extension.swift
//  Kommunicate
//
//  Created by Mukesh on 21/02/20.
//

import Foundation
import Applozic

extension KMUserDefaultHandler {
    static var isAppIdEmpty: Bool {
        guard let currentAppId = KMUserDefaultHandler.getApplicationKey() else { return true }
        return currentAppId.isEmpty
    }

    static var matchesCurrentAppId: (String) -> Bool = {
        guard let currentAppId = KMUserDefaultHandler.getApplicationKey() else { return false }
        return currentAppId == $0
    }

    static func setBotType(_ botType: String, botId: String) {
        let userDefaults = UserDefaults(suiteName: AL_DEFAULT_APP_GROUP)
        userDefaults?.setValue(botType, forKey: botId)
    }

    static func getBotType(botId: String) -> String? {
        let userDefaults = UserDefaults(suiteName: AL_DEFAULT_APP_GROUP)
        return userDefaults?.value(forKey: botId) as? String
    }
}
