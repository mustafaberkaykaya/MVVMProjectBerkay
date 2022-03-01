//
//  ProfileViewModel.swift
//  NoteBerkayMvvm
//
//  Created by Mustafa Berkay Kaya on 1.03.2022.
//

import Foundation

protocol ProfileViewDataSource {}

protocol ProfileViewEventSource {}

protocol ProfileViewProtocol: ProfileViewDataSource, ProfileViewEventSource {
    func showNoteList()
    func pushSignOut()
    func pushChangePassword()
}

final class ProfileViewModel: BaseViewModel<ProfileRouter>, ProfileViewProtocol {
    func showNoteList() {
        router.close()
    }
    
    func pushSignOut() {
        router.placeOnWindowLogin()
    }
    
    func pushChangePassword() {
        router.presentChangePassword()
    }
}
