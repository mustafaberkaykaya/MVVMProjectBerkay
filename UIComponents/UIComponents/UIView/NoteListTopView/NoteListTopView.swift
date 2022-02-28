//
//  NoteListTopView.swift
//  UIComponents
//
//  Created by Mustafa Berkay Kaya on 28.02.2022.
//

import UIKit

public class NoteListTopView: UIView {
    
    weak var viewModel: NoteListTopViewProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
    }
    
    private func configureContents() {
        
    }
    
    public func set(viewModel: NoteListTopViewProtocol) {
        self.viewModel = viewModel
        
    }
    
}
