//
//  ProfileSettings.swift
//  ProfileApp
//
//  Created by Валера Шавлягин on 22.09.2024.
//

import Foundation
import SwiftUI


class NavigationManager {
    func navigateToProfile(firstName: Binding<String>, lastName: Binding<String>, nickname: Binding<String>) -> some View {
            return ProfileView(firstName: firstName, lastName: lastName, nickname: nickname)
        }
}

