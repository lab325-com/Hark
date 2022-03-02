//
//  AnalyticsHelper.swift
//  Lill
//
//  Created by Andrey S on 09.12.2021.
//

import Foundation
import AppsFlyerLib

enum AppsFlyerEvents: String {
    case appsflyer_first_open          = "appsflyer_first_open"
    case appsflyer_session_start       = "appsflyer_session_start"
    case appsflyer_registration        = "appsflyer_registration"
    case appsflyer_login               = "appsflyer_login"
    case appsflyer_skip_registration   = "appsflyer_skip_registration"
    case appsflyer_enter_phone         = "appsflyer_enter_phone"
    case appsflyer_enter_sms           = "appsflyer_enter_sms"
    case appsflyer_resend_sms          = "appsflyer_resend_sms"
    case appsflyer_wrong_code          = "appsflyer_wrong_code"
    case appsflyer_start_search        = "appsflyer_start_search"
    case appsflyer_stop_search         = "appsflyer_stop_search"
    case appsflyer_navigation_main     = "appsflyer_navigation_main"
    case appsflyer_navigation_settings = "appsflyer_navigation_settings"
    case appsflyer_navigation_harks    = "appsflyer_navigation_harks"
    case appsflyer_navigation_profile  = "appsflyer_navigation_profile"
    case appsflyer_profile_settings    = "appsflyer_profile_settings"
    case appsflyer_search_settings     = "appsflyer_search_settings"
    case appsflyer_talk_leave          = "appsflyer_talk_leave"
    case appsflyer_talk_speaker        = "appsflyer_talk_speaker_on"
    case appsflyer_talk_rate           = "appsflyer_talk_rate"
    case appsflyer_talk_add_to_hark    = "appsflyer_talk_add_to_hark"
    case appsflyer_talk_duration       = "appsflyer_talk_duration"
}

class AnalyticManager: NSObject {
    static func sendAppsFlyerEvent(event: AppsFlyerEvents, values: [AnyHashable : Any]? = nil) {
        AppsFlyerLib.shared().logEvent(event.rawValue, withValues: values)
    }
}
