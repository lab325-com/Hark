// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

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
