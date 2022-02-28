//
//  AddNoteRoute.swift
//  NoteBerkayMvvm
//
//  Created by Mustafa Berkay Kaya on 24.02.2022.
//

protocol AddNoteRoute {
    func pushNote(titleText: String, descriptionText: String, noteId: Int, type: DetailVCShowType)
}

extension AddNoteRoute where Self: RouterProtocol {
    func pushNote(titleText: String, descriptionText: String, noteId: Int, type: DetailVCShowType) {
           let router = AddNoteRouter()
           let viewModel = AddNoteViewModel(type: type, titleText: titleText, descriptionText: descriptionText, noteId: noteId, router: router)
           let viewController = AddNoteViewController(viewModel: viewModel)
        
           let transition = PushTransition()
           router.viewController = viewController
           router.openTransition = transition
           
           open(viewController, transition: transition)
       }
}
