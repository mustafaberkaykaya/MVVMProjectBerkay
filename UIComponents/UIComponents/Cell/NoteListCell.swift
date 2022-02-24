//
//  NoteListCell.swift
//  UIComponents
//
//  Created by Mustafa Berkay Kaya on 23.02.2022.
//

import UIKit
import MobilliumBuilders

public class NoteListCell: UITableViewCell, ReusableView {
    public static var defaultReuseIdentifier = "noteCell"
    
    weak var viewModel: NoteListCellProtocol?
    
    private let containerView = UIView()
    private let textStackView = UIStackViewBuilder()
               .spacing(12)
               .axis(.vertical)
               .alignment(.fill)
               .distribution(.fillEqually)
               .build()
    private let titleLabel = UILabelBuilder()
                .font(.font(.josefinSansSemiBold, size: 13))
                .build()
    private let descriptionLabel = UILabelBuilder()
            .font(.font(.josefinSansRegular, size: 13))
            .build()
    
    public func setupCell(with viewModel: NoteListCellProtocol) {
        self.viewModel = viewModel
        self.titleLabel.text = viewModel.titleText
        self.descriptionLabel.text = viewModel.descriptionText
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViews()
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubViews()
        configureContents()
    }
    
    private func configureContents() {
    
    }
}

extension NoteListCell {
    private func addSubViews() {
       addContainerView()
       addTextStackView()
       addLabels()
    }
    
    private func addContainerView() {
        contentView.addSubview(containerView)
        containerView.edgesToSuperview()
    }
    
    private func addTextStackView() {
        containerView.addSubview(textStackView)
        textStackView.edgesToSuperview()
    }
    
    private func addLabels() {
        textStackView.addArrangedSubview(titleLabel)
        textStackView.addArrangedSubview(descriptionLabel)
    }
}
