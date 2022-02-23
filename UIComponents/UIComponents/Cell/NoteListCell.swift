//
//  NoteListCell.swift
//  UIComponents
//
//  Created by Mustafa Berkay Kaya on 23.02.2022.
//

import UIKit

public class NoteListCell: UITableViewCell, ReusableView {
    
    weak var viewModel: NoteListCellProtocol?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureContents()
    }
    
    private func configureContents() {
        
    }
    
    public func set(viewModel: NoteListCellProtocol) {
        self.viewModel = viewModel
        
    }
    
}
