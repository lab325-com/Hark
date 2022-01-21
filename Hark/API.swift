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

public enum HarkRequestStatus: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case harkRequestStatusAccepted
  case harkRequestStatusPending
  case harkRequestStatusRejected
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "HARK_REQUEST_STATUS_ACCEPTED": self = .harkRequestStatusAccepted
      case "HARK_REQUEST_STATUS_PENDING": self = .harkRequestStatusPending
      case "HARK_REQUEST_STATUS_REJECTED": self = .harkRequestStatusRejected
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .harkRequestStatusAccepted: return "HARK_REQUEST_STATUS_ACCEPTED"
      case .harkRequestStatusPending: return "HARK_REQUEST_STATUS_PENDING"
      case .harkRequestStatusRejected: return "HARK_REQUEST_STATUS_REJECTED"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: HarkRequestStatus, rhs: HarkRequestStatus) -> Bool {
    switch (lhs, rhs) {
      case (.harkRequestStatusAccepted, .harkRequestStatusAccepted): return true
      case (.harkRequestStatusPending, .harkRequestStatusPending): return true
      case (.harkRequestStatusRejected, .harkRequestStatusRejected): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [HarkRequestStatus] {
    return [
      .harkRequestStatusAccepted,
      .harkRequestStatusPending,
      .harkRequestStatusRejected,
    ]
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

public final class HarksQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Harks($limit: Int!, $offset: Int!) {
      harks(limit: $limit, offset: $offset) {
        __typename
        Harks {
          __typename
          id
          nickName
          status
        }
        Pagination {
          __typename
          total
          totalPages
          nextPageExists
          previousPageExists
        }
        HarkRequests {
          __typename
          id
          Talk {
            __typename
            id
            duration {
              __typename
              hours
              minutes
              seconds
            }
            createdAt
          }
          sentByYou
          sentToYou
          status
        }
      }
    }
    """

  public let operationName: String = "Harks"

  public var limit: Int
  public var offset: Int

  public init(limit: Int, offset: Int) {
    self.limit = limit
    self.offset = offset
  }

  public var variables: GraphQLMap? {
    return ["limit": limit, "offset": offset]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("harks", arguments: ["limit": GraphQLVariable("limit"), "offset": GraphQLVariable("offset")], type: .object(Hark.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(harks: Hark? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "harks": harks.flatMap { (value: Hark) -> ResultMap in value.resultMap }])
    }

    public var harks: Hark? {
      get {
        return (resultMap["harks"] as? ResultMap).flatMap { Hark(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "harks")
      }
    }

    public struct Hark: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["HarkRequestsResponse"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("Harks", type: .list(.object(Hark.selections))),
          GraphQLField("Pagination", type: .object(Pagination.selections)),
          GraphQLField("HarkRequests", type: .list(.object(HarkRequest.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(harks: [Hark?]? = nil, pagination: Pagination? = nil, harkRequests: [HarkRequest?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "HarkRequestsResponse", "Harks": harks.flatMap { (value: [Hark?]) -> [ResultMap?] in value.map { (value: Hark?) -> ResultMap? in value.flatMap { (value: Hark) -> ResultMap in value.resultMap } } }, "Pagination": pagination.flatMap { (value: Pagination) -> ResultMap in value.resultMap }, "HarkRequests": harkRequests.flatMap { (value: [HarkRequest?]) -> [ResultMap?] in value.map { (value: HarkRequest?) -> ResultMap? in value.flatMap { (value: HarkRequest) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var harks: [Hark?]? {
        get {
          return (resultMap["Harks"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Hark?] in value.map { (value: ResultMap?) -> Hark? in value.flatMap { (value: ResultMap) -> Hark in Hark(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Hark?]) -> [ResultMap?] in value.map { (value: Hark?) -> ResultMap? in value.flatMap { (value: Hark) -> ResultMap in value.resultMap } } }, forKey: "Harks")
        }
      }

      public var pagination: Pagination? {
        get {
          return (resultMap["Pagination"] as? ResultMap).flatMap { Pagination(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "Pagination")
        }
      }

      public var harkRequests: [HarkRequest?]? {
        get {
          return (resultMap["HarkRequests"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [HarkRequest?] in value.map { (value: ResultMap?) -> HarkRequest? in value.flatMap { (value: ResultMap) -> HarkRequest in HarkRequest(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [HarkRequest?]) -> [ResultMap?] in value.map { (value: HarkRequest?) -> ResultMap? in value.flatMap { (value: HarkRequest) -> ResultMap in value.resultMap } } }, forKey: "HarkRequests")
        }
      }

      public struct Hark: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Hark"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("nickName", type: .scalar(String.self)),
            GraphQLField("status", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil, nickName: String? = nil, status: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Hark", "id": id, "nickName": nickName, "status": status])
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

        public var status: String? {
          get {
            return resultMap["status"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "status")
          }
        }
      }

      public struct Pagination: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Pagination"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("total", type: .scalar(Int.self)),
            GraphQLField("totalPages", type: .scalar(Int.self)),
            GraphQLField("nextPageExists", type: .scalar(Bool.self)),
            GraphQLField("previousPageExists", type: .scalar(Bool.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(total: Int? = nil, totalPages: Int? = nil, nextPageExists: Bool? = nil, previousPageExists: Bool? = nil) {
          self.init(unsafeResultMap: ["__typename": "Pagination", "total": total, "totalPages": totalPages, "nextPageExists": nextPageExists, "previousPageExists": previousPageExists])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var total: Int? {
          get {
            return resultMap["total"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "total")
          }
        }

        public var totalPages: Int? {
          get {
            return resultMap["totalPages"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "totalPages")
          }
        }

        public var nextPageExists: Bool? {
          get {
            return resultMap["nextPageExists"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "nextPageExists")
          }
        }

        public var previousPageExists: Bool? {
          get {
            return resultMap["previousPageExists"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "previousPageExists")
          }
        }
      }

      public struct HarkRequest: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["HarkRequest"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("Talk", type: .object(Talk.selections)),
            GraphQLField("sentByYou", type: .scalar(Bool.self)),
            GraphQLField("sentToYou", type: .scalar(Bool.self)),
            GraphQLField("status", type: .scalar(HarkRequestStatus.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil, talk: Talk? = nil, sentByYou: Bool? = nil, sentToYou: Bool? = nil, status: HarkRequestStatus? = nil) {
          self.init(unsafeResultMap: ["__typename": "HarkRequest", "id": id, "Talk": talk.flatMap { (value: Talk) -> ResultMap in value.resultMap }, "sentByYou": sentByYou, "sentToYou": sentToYou, "status": status])
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

        public var talk: Talk? {
          get {
            return (resultMap["Talk"] as? ResultMap).flatMap { Talk(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "Talk")
          }
        }

        public var sentByYou: Bool? {
          get {
            return resultMap["sentByYou"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "sentByYou")
          }
        }

        public var sentToYou: Bool? {
          get {
            return resultMap["sentToYou"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "sentToYou")
          }
        }

        public var status: HarkRequestStatus? {
          get {
            return resultMap["status"] as? HarkRequestStatus
          }
          set {
            resultMap.updateValue(newValue, forKey: "status")
          }
        }

        public struct Talk: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Talk"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .scalar(GraphQLID.self)),
              GraphQLField("duration", type: .object(Duration.selections)),
              GraphQLField("createdAt", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID? = nil, duration: Duration? = nil, createdAt: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Talk", "id": id, "duration": duration.flatMap { (value: Duration) -> ResultMap in value.resultMap }, "createdAt": createdAt])
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

          public var duration: Duration? {
            get {
              return (resultMap["duration"] as? ResultMap).flatMap { Duration(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "duration")
            }
          }

          public var createdAt: String? {
            get {
              return resultMap["createdAt"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "createdAt")
            }
          }

          public struct Duration: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["IntervalRepresentation"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("hours", type: .scalar(Int.self)),
                GraphQLField("minutes", type: .scalar(Int.self)),
                GraphQLField("seconds", type: .scalar(Int.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(hours: Int? = nil, minutes: Int? = nil, seconds: Int? = nil) {
              self.init(unsafeResultMap: ["__typename": "IntervalRepresentation", "hours": hours, "minutes": minutes, "seconds": seconds])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var hours: Int? {
              get {
                return resultMap["hours"] as? Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "hours")
              }
            }

            public var minutes: Int? {
              get {
                return resultMap["minutes"] as? Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "minutes")
              }
            }

            public var seconds: Int? {
              get {
                return resultMap["seconds"] as? Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "seconds")
              }
            }
          }
        }
      }
    }
  }
}

public final class MatchSettingsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query MatchSettings {
      matchSettings {
        __typename
        style
        mood
        fromAge
        toAge
        genders
      }
    }
    """

  public let operationName: String = "MatchSettings"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("matchSettings", type: .object(MatchSetting.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(matchSettings: MatchSetting? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "matchSettings": matchSettings.flatMap { (value: MatchSetting) -> ResultMap in value.resultMap }])
    }

    public var matchSettings: MatchSetting? {
      get {
        return (resultMap["matchSettings"] as? ResultMap).flatMap { MatchSetting(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "matchSettings")
      }
    }

    public struct MatchSetting: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["MatchSettings"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("style", type: .scalar(Int.self)),
          GraphQLField("mood", type: .scalar(Int.self)),
          GraphQLField("fromAge", type: .scalar(Int.self)),
          GraphQLField("toAge", type: .scalar(Int.self)),
          GraphQLField("genders", type: .list(.scalar(GenderType.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(style: Int? = nil, mood: Int? = nil, fromAge: Int? = nil, toAge: Int? = nil, genders: [GenderType?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "MatchSettings", "style": style, "mood": mood, "fromAge": fromAge, "toAge": toAge, "genders": genders])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var style: Int? {
        get {
          return resultMap["style"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "style")
        }
      }

      public var mood: Int? {
        get {
          return resultMap["mood"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "mood")
        }
      }

      public var fromAge: Int? {
        get {
          return resultMap["fromAge"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "fromAge")
        }
      }

      public var toAge: Int? {
        get {
          return resultMap["toAge"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "toAge")
        }
      }

      public var genders: [GenderType?]? {
        get {
          return resultMap["genders"] as? [GenderType?]
        }
        set {
          resultMap.updateValue(newValue, forKey: "genders")
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
