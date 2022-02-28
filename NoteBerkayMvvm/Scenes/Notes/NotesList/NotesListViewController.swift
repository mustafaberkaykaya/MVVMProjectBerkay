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
    private let refreshControl = UIRefreshControl()
    private let topView = NoteListTopView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        setLocalize()
        viewModel.getMyNotes()
        configureContents()
        subscribeViewModelEvents()
        notificationCenter()
   }
}

// MARK: - UILayout
extension NotesListViewController {
    private func addSubViews() {
        makeTopView()
        addTableView()
        addButton()
    }
    
    private func makeTopView() {
        view.addSubview(topView)
        topView.backgroundColor = .white
        topView.topToSuperview().constant = 44
        topView.leadingToSuperview()
        topView.trailingToSuperview()
        topView.height(66)
    }
    
    private func addTableView() {
        view.addSubview(tableView)
        tableView.topToBottom(of: topView)
        tableView.leadingToSuperview()
        tableView.trailingToSuperview()
        tableView.bottomToSuperview()
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
        navigationController?.navigationBar.isHidden = true
        addCustomButton.addTarget(self, action: #selector(addNoteTapped), for: .touchUpInside)
        refreshControl.addTarget(self, action: #selector(pullToRefreshValueChanged), for: .valueChanged)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NoteListCell.self,
                           forCellReuseIdentifier: NoteListCell.defaultReuseIdentifier)
        tableView.refreshControl = refreshControl
}
    
    private func setLocalize() {
        addCustomButton.buttonTitle = L10n.NoteList.button
    }
}

// MARK: - Actions
extension NotesListViewController {
    @objc
    private func addNoteTapped() {
        viewModel.configureRow(titleText: "", descriptionText: "", noteId: 0, type: .add)
    }
    
    @objc
    private func pullToRefreshValueChanged() {
        viewModel.cellItems.isEmpty ? viewModel.getMyNotes() : tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    private func subscribeViewModelEvents() {
         viewModel.didSuccessFetchRecipes = { [weak self] in
             guard let self = self else { return }
             self.tableView.reloadData()
         }
    }
    
    @objc
    private func reloadData() {
           viewModel.getMyNotes()
           subscribeViewModelEvents()
       }
}

extension NotesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItemsAt(section: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NoteListCell = tableView.dequeueReusableCell(for: indexPath)
        let cellItem: NoteListCellProtocol = viewModel.cellItemAt(indexPath: indexPath)
        cell.setupCell(with: cellItem)
        cell.selectionStyle = .none
        return cell
    }
}

extension NotesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 102
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellItem: NoteListCellProtocol = viewModel.cellItemAt(indexPath: indexPath)
        let note = self.viewModel.cellItems[indexPath.row]
        viewModel.configureRow(titleText: note.titleText, descriptionText: note.descriptionText, noteId: note.noteID, type: .showNote)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAct = UIContextualAction(style: .destructive, title: "") {_, _, completionHandler in
            AlertUtility.shared.multiButton(title: L10n.NoteList.deleteTitle1,
                                            message: L10n.NoteList.deleteMessage1,
                                            firstButtonTitle: L10n.NoteList.deletefirstButton,
                                            secondButtonTitle1: L10n.NoteList.deletesecondButton,
                                            firstButtonHandler: { _ in },
                                            secondButtonHandler: { _ in
        self.swipeDeleteAction(indexPath: indexPath) }, delegate: self )
        completionHandler(true) }

        deleteAct.image = .icTrash
        deleteAct.backgroundColor = .appRed
        let editAct = UIContextualAction(style: .normal, title: "") { _, _, completionHandler in
            self.swipeEditAction(indexPath: indexPath)
            completionHandler(true)
        }
        editAct.backgroundColor = .appYellow
        editAct.image = .icEdit
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAct, editAct])
        swipeConfiguration.performsFirstActionWithFullSwipe = false
        return swipeConfiguration
        
    }
    
    private func swipeDeleteAction(indexPath: IndexPath) {
        let noteID = self.viewModel.cellItems[indexPath.row].noteID
        self.viewModel.deleteNote(noteID: noteID)
        tableView.reloadData()
    }
    
    private func swipeEditAction(indexPath: IndexPath) {
        let title = self.viewModel.cellItems[indexPath.row].titleText
        let description = self.viewModel.cellItems[indexPath.row].descriptionText
        let noteID = self.viewModel.cellItems[indexPath.row].noteID
        self.viewModel.configureRow(titleText: title, descriptionText: description, noteId: noteID, type: .update)
    }
}

extension NotesListViewController {
    func notificationCenter() {
        let notificationCenter: NotificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(reloadData), name: .reloadDataNotification, object: nil)
    }
}
