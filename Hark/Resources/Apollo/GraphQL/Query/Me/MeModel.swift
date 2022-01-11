
import Foundation

struct MeModel: Codable {
    let me: MeMainModel
}

struct MeMainModel: Codable {
    let id: String
    let age: Int?
    let gender: GenderType?
    let isAnonymous: Bool?
    let nickName: String?
    let totalFavoriteTalks: Int?
    let totalTalks: Int?
    let verified: Bool?
}

extension GenderType: Codable {
    
}
