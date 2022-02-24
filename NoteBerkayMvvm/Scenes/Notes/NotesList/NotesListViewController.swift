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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
        subscribeViewModelEvents()
        viewModel.getMyNotes()
   }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let notificationCenter: NotificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(reloadData), name: .reloadDataNotification, object: nil)
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
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(pullToRefreshValueChanged), for: .valueChanged)
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
        let cellItem: NoteListCellProtocol
        cellItem = viewModel.cellItemAt(indexPath: indexPath)
        cell.setupCell(with: cellItem)
        cell.selectionStyle = .none
        return cell
    }
}

extension NotesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 102
    }
}
