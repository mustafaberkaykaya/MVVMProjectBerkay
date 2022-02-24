//
//  NotesListViewController.swift
//  NoteBerkayMvvm
//
//  Created by Mustafa Berkay Kaya on 23.02.2022.
//

import TinyConstraints
import MobilliumBuilders

final class NotesListViewController: BaseViewController<NotesListViewModel> {
    
    private let tableView = UITableViewBuilder().build()
    private let addCustomButton = CustomButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()

   }
}

// MARK: - UILayout

extension NotesListViewController {
    private func addSubViews() {
        addTableView()
        addButton()
    }
    
    private func addTableView() {
        view.addSubview(tableView)
        tableView.edgesToSuperview()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NoteListCell.self,
                           forCellReuseIdentifier: NoteListCell.defaultReuseIdentifier)
    }
    
    private func addButton() {
        view.addSubview(addCustomButton)
        addCustomButton.bottomToSuperview(usingSafeArea: true).constant = -77
        addCustomButton.centerXToSuperview()
        addCustomButton.height(42)
 
    }
}

// MARK: - Configure & Set Localize
extension NotesListViewController {
    private func configureContents() {
        setLocalize()
        
        addCustomButton.addTarget(self, action: #selector(addNoteTapped), for: .touchUpInside)
    }
    
    private func setLocalize() {
        addCustomButton.buttonTitle = L10n.NoteList.button
        
    }
}

// MARK: - Actions
extension NotesListViewController {
    @objc
    private func addNoteTapped() {
        viewModel.addNoteTapped()
    }
}

extension NotesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       if let cell = tableView.dequeueReusableCell(withIdentifier: NoteListCell.defaultReuseIdentifier, for: indexPath) as? NoteListCell {
            return cell
        }
        return UITableViewCell()
    }
}

extension NotesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 102
    }
}
