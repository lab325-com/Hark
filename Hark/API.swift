// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct LoginRecordInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - lang
  ///   - timezone
  ///   - udid
  ///   - phone
  ///   - authType
  public init(lang: Swift.Optional<String?> = nil, timezone: Swift.Optional<String?> = nil, udid: Swift.Optional<String?> = nil, phone: Swift.Optional<String?> = nil, authType: AccountType) {
    graphQLMap = ["lang": lang, "timezone": timezone, "udid": udid, "phone": phone, "authType": authType]
  }

  public var lang: Swift.Optional<String?> {
    get {
      return graphQLMap["lang"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lang")
    }
  }

  public var timezone: Swift.Optional<String?> {
    get {
      return graphQLMap["timezone"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "timezone")
    }
  }

  public var udid: Swift.Optional<String?> {
    get {
      return graphQLMap["udid"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "udid")
    }
  }

  public var phone: Swift.Optional<String?> {
    get {
      return graphQLMap["phone"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "phone")
    }
  }

  public var authType: AccountType {
    get {
      return graphQLMap["authType"] as! AccountType
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "authType")
    }
  }
}

public enum AccountType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case accountTypeSms
  case accountTypeUdid
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "ACCOUNT_TYPE_SMS": self = .accountTypeSms
      case "ACCOUNT_TYPE_UDID": self = .accountTypeUdid
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .accountTypeSms: return "ACCOUNT_TYPE_SMS"
      case .accountTypeUdid: return "ACCOUNT_TYPE_UDID"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: AccountType, rhs: AccountType) -> Bool {
    switch (lhs, rhs) {
      case (.accountTypeSms, .accountTypeSms): return true
      case (.accountTypeUdid, .accountTypeUdid): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [AccountType] {
    return [
      .accountTypeSms,
      .accountTypeUdid,
    ]
  }
}

public struct ProfileUpdateInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - nickName
  ///   - age
  ///   - gender
  ///   - hideStatus
  public init(nickName: Swift.Optional<String?> = nil, age: Swift.Optional<Int?> = nil, gender: Swift.Optional<GenderType?> = nil, hideStatus: Swift.Optional<Bool?> = nil) {
    graphQLMap = ["nickName": nickName, "age": age, "gender": gender, "hideStatus": hideStatus]
  }

  public var nickName: Swift.Optional<String?> {
    get {
      return graphQLMap["nickName"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "nickName")
    }
  }

  public var age: Swift.Optional<Int?> {
    get {
      return graphQLMap["age"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "age")
    }
  }

  public var gender: Swift.Optional<GenderType?> {
    get {
      return graphQLMap["gender"] as? Swift.Optional<GenderType?> ?? Swift.Optional<GenderType?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gender")
    }
  }

  public var hideStatus: Swift.Optional<Bool?> {
    get {
      return graphQLMap["hideStatus"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "hideStatus")
    }
  }
}

public enum GenderType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case genderTypeCommon
  case genderTypeMan
  case genderTypeWoman
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "GENDER_TYPE_COMMON": self = .genderTypeCommon
      case "GENDER_TYPE_MAN": self = .genderTypeMan
      case "GENDER_TYPE_WOMAN": self = .genderTypeWoman
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .genderTypeCommon: return "GENDER_TYPE_COMMON"
      case .genderTypeMan: return "GENDER_TYPE_MAN"
      case .genderTypeWoman: return "GENDER_TYPE_WOMAN"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: GenderType, rhs: GenderType) -> Bool {
    switch (lhs, rhs) {
      case (.genderTypeCommon, .genderTypeCommon): return true
      case (.genderTypeMan, .genderTypeMan): return true
      case (.genderTypeWoman, .genderTypeWoman): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [GenderType] {
    return [
      .genderTypeCommon,
      .genderTypeMan,
      .genderTypeWoman,
    ]
  }
}

public struct MatchSettingsUpdateInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - style
  ///   - mood
  ///   - fromAge
  ///   - toAge
  ///   - genders
  public init(style: Swift.Optional<Int?> = nil, mood: Swift.Optional<Int?> = nil, fromAge: Swift.Optional<Int?> = nil, toAge: Swift.Optional<Int?> = nil, genders: Swift.Optional<[GenderType?]?> = nil) {
    graphQLMap = ["style": style, "mood": mood, "fromAge": fromAge, "toAge": toAge, "genders": genders]
  }

  public var style: Swift.Optional<Int?> {
    get {
      return graphQLMap["style"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "style")
    }
  }

  public var mood: Swift.Optional<Int?> {
    get {
      return graphQLMap["mood"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "mood")
    }
  }

  public var fromAge: Swift.Optional<Int?> {
    get {
      return graphQLMap["fromAge"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "fromAge")
    }
  }

  public var toAge: Swift.Optional<Int?> {
    get {
      return graphQLMap["toAge"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "toAge")
    }
  }

  public var genders: Swift.Optional<[GenderType?]?> {
    get {
      return graphQLMap["genders"] as? Swift.Optional<[GenderType?]?> ?? Swift.Optional<[GenderType?]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "genders")
    }
  }
}

public final class LoginMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation Login($record: LoginRecordInput!) {
      login(record: $record) {
        __typename
        authToken
        smsToken
      }
    }
    """

  public let operationName: String = "Login"

  public var record: LoginRecordInput

  public init(record: LoginRecordInput) {
    self.record = record
  }

  public var variables: GraphQLMap? {
    return ["record": record]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("login", arguments: ["record": GraphQLVariable("record")], type: .object(Login.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(login: Login? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "login": login.flatMap { (value: Login) -> ResultMap in value.resultMap }])
    }

    public var login: Login? {
      get {
        return (resultMap["login"] as? ResultMap).flatMap { Login(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "login")
      }
    }

    public struct Login: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["LoginResponse"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("authToken", type: .scalar(String.self)),
          GraphQLField("smsToken", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(authToken: String? = nil, smsToken: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "LoginResponse", "authToken": authToken, "smsToken": smsToken])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var authToken: String? {
        get {
          return resultMap["authToken"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "authToken")
        }
      }

      public var smsToken: String? {
        get {
          return resultMap["smsToken"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "smsToken")
        }
      }
    }
  }
}

public final class ProfileUpdateMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation ProfileUpdate($record: ProfileUpdateInput!) {
      profileUpdate(record: $record) {
        __typename
        id
        nickName
        age
        gender
        hideStatus
        totalHarks
        isGuest
        profileFilled
        hasNewRequests
      }
    }
    """

  public let operationName: String = "ProfileUpdate"

  public var record: ProfileUpdateInput

  public init(record: ProfileUpdateInput) {
    self.record = record
  }

  public var variables: GraphQLMap? {
    return ["record": record]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("profileUpdate", arguments: ["record": GraphQLVariable("record")], type: .object(ProfileUpdate.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(profileUpdate: ProfileUpdate? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "profileUpdate": profileUpdate.flatMap { (value: ProfileUpdate) -> ResultMap in value.resultMap }])
    }

    public var profileUpdate: ProfileUpdate? {
      get {
        return (resultMap["profileUpdate"] as? ResultMap).flatMap { ProfileUpdate(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "profileUpdate")
      }
    }

    public struct ProfileUpdate: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["MeModel"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("nickName", type: .scalar(String.self)),
          GraphQLField("age", type: .scalar(Int.self)),
          GraphQLField("gender", type: .scalar(GenderType.self)),
          GraphQLField("hideStatus", type: .scalar(Bool.self)),
          GraphQLField("totalHarks", type: .scalar(Int.self)),
          GraphQLField("isGuest", type: .scalar(Bool.self)),
          GraphQLField("profileFilled", type: .scalar(Bool.self)),
          GraphQLField("hasNewRequests", type: .scalar(Bool.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID? = nil, nickName: String? = nil, age: Int? = nil, gender: GenderType? = nil, hideStatus: Bool? = nil, totalHarks: Int? = nil, isGuest: Bool? = nil, profileFilled: Bool? = nil, hasNewRequests: Bool? = nil) {
        self.init(unsafeResultMap: ["__typename": "MeModel", "id": id, "nickName": nickName, "age": age, "gender": gender, "hideStatus": hideStatus, "totalHarks": totalHarks, "isGuest": isGuest, "profileFilled": profileFilled, "hasNewRequests": hasNewRequests])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID? {
        get {
          return resultMap["id"] as? GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var nickName: String? {
        get {
          return resultMap["nickName"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "nickName")
        }
      }

      public var age: Int? {
        get {
          return resultMap["age"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "age")
        }
      }

      public var gender: GenderType? {
        get {
          return resultMap["gender"] as? GenderType
        }
        set {
          resultMap.updateValue(newValue, forKey: "gender")
        }
      }

      public var hideStatus: Bool? {
        get {
          return resultMap["hideStatus"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "hideStatus")
        }
      }

      public var totalHarks: Int? {
        get {
          return resultMap["totalHarks"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "totalHarks")
        }
      }

      public var isGuest: Bool? {
        get {
          return resultMap["isGuest"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isGuest")
        }
      }

      public var profileFilled: Bool? {
        get {
          return resultMap["profileFilled"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "profileFilled")
        }
      }

      public var hasNewRequests: Bool? {
        get {
          return resultMap["hasNewRequests"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "hasNewRequests")
        }
      }
    }
  }
}

public final class UpdateMatchSettingsMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation UpdateMatchSettings($record: MatchSettingsUpdateInput!) {
      updateMatchSettings(record: $record)
    }
    """

  public let operationName: String = "UpdateMatchSettings"

  public var record: MatchSettingsUpdateInput

  public init(record: MatchSettingsUpdateInput) {
    self.record = record
  }

  public var variables: GraphQLMap? {
    return ["record": record]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("updateMatchSettings", arguments: ["record": GraphQLVariable("record")], type: .scalar(Bool.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateMatchSettings: Bool? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "updateMatchSettings": updateMatchSettings])
    }

    public var updateMatchSettings: Bool? {
      get {
        return resultMap["updateMatchSettings"] as? Bool
      }
      set {
        resultMap.updateValue(newValue, forKey: "updateMatchSettings")
      }
    }
  }
}

public final class VerifyPhoneMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation VerifyPhone($smsToken: String!, $verificationCode: Int!) {
      verifyPhone(smsToken: $smsToken, verificationCode: $verificationCode) {
        __typename
        authToken
      }
    }
    """

  public let operationName: String = "VerifyPhone"

  public var smsToken: String
  public var verificationCode: Int

  public init(smsToken: String, verificationCode: Int) {
    self.smsToken = smsToken
    self.verificationCode = verificationCode
  }

  public var variables: GraphQLMap? {
    return ["smsToken": smsToken, "verificationCode": verificationCode]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("verifyPhone", arguments: ["smsToken": GraphQLVariable("smsToken"), "verificationCode": GraphQLVariable("verificationCode")], type: .object(VerifyPhone.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(verifyPhone: VerifyPhone? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "verifyPhone": verifyPhone.flatMap { (value: VerifyPhone) -> ResultMap in value.resultMap }])
    }

    public var verifyPhone: VerifyPhone? {
      get {
        return (resultMap["verifyPhone"] as? ResultMap).flatMap { VerifyPhone(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "verifyPhone")
      }
    }

    public struct VerifyPhone: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["AuthToken"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("authToken", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(authToken: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "AuthToken", "authToken": authToken])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var authToken: String? {
        get {
          return resultMap["authToken"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "authToken")
        }
      }
    }
  }
}

public final class MeQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Me {
      me {
        __typename
        id
        nickName
        age
        gender
        hideStatus
        totalHarks
        isGuest
        profileFilled
        hasNewRequests
      }
    }
    """

  public let operationName: String = "Me"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("me", type: .object(Me.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(me: Me? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "me": me.flatMap { (value: Me) -> ResultMap in value.resultMap }])
    }

    public var me: Me? {
      get {
        return (resultMap["me"] as? ResultMap).flatMap { Me(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "me")
      }
    }

    public struct Me: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["MeModel"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("nickName", type: .scalar(String.self)),
          GraphQLField("age", type: .scalar(Int.self)),
          GraphQLField("gender", type: .scalar(GenderType.self)),
          GraphQLField("hideStatus", type: .scalar(Bool.self)),
          GraphQLField("totalHarks", type: .scalar(Int.self)),
          GraphQLField("isGuest", type: .scalar(Bool.self)),
          GraphQLField("profileFilled", type: .scalar(Bool.self)),
          GraphQLField("hasNewRequests", type: .scalar(Bool.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID? = nil, nickName: String? = nil, age: Int? = nil, gender: GenderType? = nil, hideStatus: Bool? = nil, totalHarks: Int? = nil, isGuest: Bool? = nil, profileFilled: Bool? = nil, hasNewRequests: Bool? = nil) {
        self.init(unsafeResultMap: ["__typename": "MeModel", "id": id, "nickName": nickName, "age": age, "gender": gender, "hideStatus": hideStatus, "totalHarks": totalHarks, "isGuest": isGuest, "profileFilled": profileFilled, "hasNewRequests": hasNewRequests])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID? {
        get {
          return resultMap["id"] as? GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var nickName: String? {
        get {
          return resultMap["nickName"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "nickName")
        }
      }

      public var age: Int? {
        get {
          return resultMap["age"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "age")
        }
      }

      public var gender: GenderType? {
        get {
          return resultMap["gender"] as? GenderType
        }
        set {
          resultMap.updateValue(newValue, forKey: "gender")
        }
      }

      public var hideStatus: Bool? {
        get {
          return resultMap["hideStatus"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "hideStatus")
        }
      }

      public var totalHarks: Int? {
        get {
          return resultMap["totalHarks"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "totalHarks")
        }
      }

      public var isGuest: Bool? {
        get {
          return resultMap["isGuest"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isGuest")
        }
      }

      public var profileFilled: Bool? {
        get {
          return resultMap["profileFilled"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "profileFilled")
        }
      }

      public var hasNewRequests: Bool? {
        get {
          return resultMap["hasNewRequests"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "hasNewRequests")
        }
      }
    }
  }
}

public final class OnlineStatisticsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query OnlineStatistics {
      onlineStatistics {
        __typename
        totalCommons
        totalInTalk
        totalMen
        totalOnline
        totalWomen
      }
    }
    """

  public let operationName: String = "OnlineStatistics"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("onlineStatistics", type: .object(OnlineStatistic.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(onlineStatistics: OnlineStatistic? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "onlineStatistics": onlineStatistics.flatMap { (value: OnlineStatistic) -> ResultMap in value.resultMap }])
    }

    public var onlineStatistics: OnlineStatistic? {
      get {
        return (resultMap["onlineStatistics"] as? ResultMap).flatMap { OnlineStatistic(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "onlineStatistics")
      }
    }

    public struct OnlineStatistic: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["OnlineStatistic"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("totalCommons", type: .scalar(Int.self)),
          GraphQLField("totalInTalk", type: .scalar(Int.self)),
          GraphQLField("totalMen", type: .scalar(Int.self)),
          GraphQLField("totalOnline", type: .scalar(Int.self)),
          GraphQLField("totalWomen", type: .scalar(Int.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(totalCommons: Int? = nil, totalInTalk: Int? = nil, totalMen: Int? = nil, totalOnline: Int? = nil, totalWomen: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "OnlineStatistic", "totalCommons": totalCommons, "totalInTalk": totalInTalk, "totalMen": totalMen, "totalOnline": totalOnline, "totalWomen": totalWomen])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var totalCommons: Int? {
        get {
          return resultMap["totalCommons"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "totalCommons")
        }
      }

      public var totalInTalk: Int? {
        get {
          return resultMap["totalInTalk"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "totalInTalk")
        }
      }

      public var totalMen: Int? {
        get {
          return resultMap["totalMen"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "totalMen")
        }
      }

      public var totalOnline: Int? {
        get {
          return resultMap["totalOnline"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "totalOnline")
        }
      }

      public var totalWomen: Int? {
        get {
          return resultMap["totalWomen"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "totalWomen")
        }
      }
    }
  }
}
