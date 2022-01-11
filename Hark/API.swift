// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct LoginRecordInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - authType
  ///   - lang
  ///   - timezone
  ///   - udid
  ///   - phone
  public init(authType: Swift.Optional<AuthType?> = nil, lang: Swift.Optional<String?> = nil, timezone: Swift.Optional<String?> = nil, udid: Swift.Optional<String?> = nil, phone: Swift.Optional<String?> = nil) {
    graphQLMap = ["authType": authType, "lang": lang, "timezone": timezone, "udid": udid, "phone": phone]
  }

  public var authType: Swift.Optional<AuthType?> {
    get {
      return graphQLMap["authType"] as? Swift.Optional<AuthType?> ?? Swift.Optional<AuthType?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "authType")
    }
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
}

public enum AuthType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
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

  public static func == (lhs: AuthType, rhs: AuthType) -> Bool {
    switch (lhs, rhs) {
      case (.accountTypeSms, .accountTypeSms): return true
      case (.accountTypeUdid, .accountTypeUdid): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [AuthType] {
    return [
      .accountTypeSms,
      .accountTypeUdid,
    ]
  }
}

public struct ProfileUpdateInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - age
  ///   - gender
  ///   - hideStatus
  ///   - nickName
  public init(age: Swift.Optional<Int?> = nil, gender: Swift.Optional<GenderType?> = nil, hideStatus: Swift.Optional<Bool?> = nil, nickName: Swift.Optional<String?> = nil) {
    graphQLMap = ["age": age, "gender": gender, "hideStatus": hideStatus, "nickName": nickName]
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

  public var nickName: Swift.Optional<String?> {
    get {
      return graphQLMap["nickName"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "nickName")
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
        age
        gender
        id
        isAnonymous
        nickName
        totalFavoriteTalks
        totalTalks
        verified
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
          GraphQLField("age", type: .scalar(Int.self)),
          GraphQLField("gender", type: .scalar(GenderType.self)),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("isAnonymous", type: .scalar(Bool.self)),
          GraphQLField("nickName", type: .scalar(String.self)),
          GraphQLField("totalFavoriteTalks", type: .scalar(Int.self)),
          GraphQLField("totalTalks", type: .scalar(Int.self)),
          GraphQLField("verified", type: .scalar(Bool.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(age: Int? = nil, gender: GenderType? = nil, id: GraphQLID, isAnonymous: Bool? = nil, nickName: String? = nil, totalFavoriteTalks: Int? = nil, totalTalks: Int? = nil, verified: Bool? = nil) {
        self.init(unsafeResultMap: ["__typename": "MeModel", "age": age, "gender": gender, "id": id, "isAnonymous": isAnonymous, "nickName": nickName, "totalFavoriteTalks": totalFavoriteTalks, "totalTalks": totalTalks, "verified": verified])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
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

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var isAnonymous: Bool? {
        get {
          return resultMap["isAnonymous"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isAnonymous")
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

      public var totalFavoriteTalks: Int? {
        get {
          return resultMap["totalFavoriteTalks"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "totalFavoriteTalks")
        }
      }

      public var totalTalks: Int? {
        get {
          return resultMap["totalTalks"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "totalTalks")
        }
      }

      public var verified: Bool? {
        get {
          return resultMap["verified"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "verified")
        }
      }
    }
  }
}

public final class VerifyPhoneMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation VerifyPhone($smsToken: String!, $code: Int!) {
      verifyPhone(smsToken: $smsToken, code: $code) {
        __typename
        authToken
      }
    }
    """

  public let operationName: String = "VerifyPhone"

  public var smsToken: String
  public var code: Int

  public init(smsToken: String, code: Int) {
    self.smsToken = smsToken
    self.code = code
  }

  public var variables: GraphQLMap? {
    return ["smsToken": smsToken, "code": code]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("verifyPhone", arguments: ["smsToken": GraphQLVariable("smsToken"), "code": GraphQLVariable("code")], type: .object(VerifyPhone.selections)),
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
        age
        gender
        id
        isAnonymous
        nickName
        totalFavoriteTalks
        totalTalks
        verified
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
          GraphQLField("age", type: .scalar(Int.self)),
          GraphQLField("gender", type: .scalar(GenderType.self)),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("isAnonymous", type: .scalar(Bool.self)),
          GraphQLField("nickName", type: .scalar(String.self)),
          GraphQLField("totalFavoriteTalks", type: .scalar(Int.self)),
          GraphQLField("totalTalks", type: .scalar(Int.self)),
          GraphQLField("verified", type: .scalar(Bool.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(age: Int? = nil, gender: GenderType? = nil, id: GraphQLID, isAnonymous: Bool? = nil, nickName: String? = nil, totalFavoriteTalks: Int? = nil, totalTalks: Int? = nil, verified: Bool? = nil) {
        self.init(unsafeResultMap: ["__typename": "MeModel", "age": age, "gender": gender, "id": id, "isAnonymous": isAnonymous, "nickName": nickName, "totalFavoriteTalks": totalFavoriteTalks, "totalTalks": totalTalks, "verified": verified])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
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

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var isAnonymous: Bool? {
        get {
          return resultMap["isAnonymous"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isAnonymous")
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

      public var totalFavoriteTalks: Int? {
        get {
          return resultMap["totalFavoriteTalks"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "totalFavoriteTalks")
        }
      }

      public var totalTalks: Int? {
        get {
          return resultMap["totalTalks"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "totalTalks")
        }
      }

      public var verified: Bool? {
        get {
          return resultMap["verified"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "verified")
        }
      }
    }
  }
}
