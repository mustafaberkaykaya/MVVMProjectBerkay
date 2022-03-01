//
//  ProfileViewModel.swift
//  NoteBerkayMvvm
//
//  Created by Mustafa Berkay Kaya on 1.03.2022.
//

import Foundation

protocol ProfileViewDataSource {}

protocol ProfileViewEventSource {}

protocol ProfileViewProtocol: ProfileViewDataSource, ProfileViewEventSource {}

final class ProfileViewModel: BaseViewModel<ProfileRouter>, ProfileViewProtocol {
    
}
