//
//  LoginRequest.swift
//  Pods
//
//  Created by Mobin on 05/10/24.
//

struct PasskeyLoginRequest {
    let challenge: String
    let rpId: String
    let userVerification: String
    var allowCredentialIDs: [String]
    let conditionalUI: Bool

    static func fromJson(_ json: [String: Any]) -> PasskeyLoginRequest {
        let allowCredentialIDs: [String] = (json["allowCredentials"] as? [[String: Any]] ?? []).compactMap { credential in
            return credential["id"] as? String
        }

        return PasskeyLoginRequest(
            challenge: json["challenge"] as? String ?? "",
            rpId: json["rpId"] as? String ?? "",
            userVerification: json["userVerification"] as? String ?? "",
            allowCredentialIDs: allowCredentialIDs,
            conditionalUI: json["conditionalUI"] as? Bool ?? false
        )
    }

    func toJson() -> [String: Any] {
        return [
            "challenge": challenge,
            "rpId": rpId,
            "userVerification": userVerification,
            "allowCredentials": allowCredentialIDs.map { ["id": $0] },
            "conditionalUI": conditionalUI
        ]
    }
}

