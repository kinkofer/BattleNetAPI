//
//  AuthenticationViewModel.swift
//  BattleNetAPI-Example
//
//  Created by Christopher Jennewein on 2/8/21.
//

import AuthenticationServices
import Foundation


class AuthenicationViewModel: NSObject, ObservableObject, ASWebAuthenticationPresentationContextProviding {
    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        return ASPresentationAnchor()
    }
}
