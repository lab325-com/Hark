
import Foundation

struct MeModel: Codable {
    let me: MeMainModel
}

struct MeMainModel: Codable {
    let id: String
    let nickName: String?
    let age: Int?
    let gender: GenderType?
    let hideStatus: Bool?
    let totalHarks: Int?
    let isGuest: Bool?
    let profileFilled: Bool?
    let hasNewRequests: Bool?
}

extension GenderType: Codable {
    
}
