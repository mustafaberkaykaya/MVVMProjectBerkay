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
    private let profilImageView = UIImageViewBuilder()
        .contentMode(.scaleAspectFill)
        .masksToBounds(true)
        .clipsToBounds(true)
        .backgroundColor(.red)
        .cornerRadius(15)
        .borderWidth(2)
        .image(.icCheck.withRenderingMode(.alwaysTemplate))
        .build()
    private let titleView: UIView = {
        var view = UIView()
        let frame = CGRect(x: 0, y: 0, width: 300, height: 44)
        view.frame = frame
        return view
    }()
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.autocapitalizationType = .none
        searchBar.backgroundImage = UIImage()
        searchBar.becomeFirstResponder()
        let frame = CGRect(x: 0, y: 0, width: 300, height: 44)
        searchBar.frame = frame
        return searchBar
  }()
    private let leftIcon = UIBarButtonItem()
    private let rightIcon = UIBarButtonItem()
    private var filteredItems: [NoteListCellProtocol] = []
    private var searchText: String = ""
       var isSearchTextEmpty: Bool {
           return searchText.isEmpty ?? true
       }
       var isFiltering: Bool {
           return !isSearchTextEmpty
       }
 
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
        addTopBar()
        addTableView()
        addButton()
    }
    
    private func addTopBar() {
        titleView.addSubview(searchBar)
        searchBar.becomeFirstResponder()
        titleView.centerInSuperview()
        navigationItem.titleView = titleView
        
        leftIcon.image = .icHamburger
        leftIcon.style = .plain
        rightIcon.image = profilImageView.image
        rightIcon.style = .done
        
        navigationItem.rightBarButtonItems = [rightIcon]
        navigationItem.leftBarButtonItems = [leftIcon]
    }
    
    private func addTableView() {
        view.addSubview(tableView)
        tableView.edgesToSuperview()
    }
    
    private func addButton() {
        view.addSubview(addCustomButton)
        addCustomButton.bottomToSuperview(usingSafeArea: true).constant = -77
        addCustomButton.centerXToSuperview()
        addCustomButton.height(42)
        addCustomButton.titleLabel?.font = .font(.josefinSansSemiBold, size: 13)
        addCustomButton.setImage(.icAdd.withRenderingMode(.alwaysTemplate), for: .normal)
        addCustomButton.contentEdgeInsets = .init(top: 13, left: 12, bottom: 13, right: 12)
        addCustomButton.titleEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 0)
        addCustomButton.imageEdgeInsets = .init(top: 0, left: -12, bottom: 0, right: 0)
    }
    
    private func createSpinnerFooter() -> UIView {
         let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 70))
         let spinner = UIActivityIndicatorView()
         spinner.center = footerView.center
         footerView.addSubview(spinner)
         spinner.startAnimating()
         
         return footerView
     }
}

// MARK: - Configure & Set Localize
extension NotesListViewController {
    private func configureContents() {
        addCustomButton.addTarget(self, action: #selector(addNoteTapped), for: .touchUpInside)
        refreshControl.addTarget(self, action: #selector(pullToRefreshValueChanged), for: .valueChanged)
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        leftIcon.target = self
        leftIcon.action = nil
        rightIcon.target = self
        rightIcon.action = #selector(profileButtonTapped)
        tableView.register(NoteListCell.self,
                           forCellReuseIdentifier: NoteListCell.defaultReuseIdentifier)
        tableView.refreshControl = refreshControl
    }
    
    private func setLocalize() {
        addCustomButton.buttonTitle = L10n.NoteList.button
        searchBar.placeholder = L10n.NoteListTop.cancel
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
    
    @objc
    private func profileButtonTapped() {
        viewModel.showProfile()
    }
    
    @objc
    private func reloadData() {
        viewModel.page = 1
        viewModel.cellItems.removeAll(keepingCapacity: false)
        viewModel.getMyNotes()
    }
    
    private func subscribeViewModelEvents() {
         viewModel.didSuccessFetchRecipes = { [weak self] in
             guard let self = self else { return }
             DispatchQueue.main.async {
                self.tableView.tableFooterView = nil
             }
             self.tableView.reloadData()
    }
}
    
    private func filterContentForSearchText(_ searchText: String ) {
       filteredItems = viewModel.cellItems.filter { (item: NoteListCellProtocol) -> Bool in
           return item.titleText.lowercased().contains(searchText.lowercased())
       }
       tableView.reloadData()
   }
}

extension NotesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
                 return filteredItems.count
        }
        return viewModel.numberOfItemsAt(section: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NoteListCell = tableView.dequeueReusableCell(for: indexPath)
        let cellItem: NoteListCellProtocol
        if isFiltering {
            cellItem = filteredItems[indexPath.row]
        } else {
            cellItem = viewModel.cellItemAt(indexPath: indexPath)
        }
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
            completionHandler(true)
        }

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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y

        if position > tableView.contentSize.height - 100 - scrollView.frame.size.height && viewModel.isPagingEnabled && viewModel.isRequestEnabled {
            self.tableView.tableFooterView = createSpinnerFooter()
            viewModel.getMyNotes()
        }
    }
}

extension NotesListViewController {
    func notificationCenter() {
        let notificationCenter: NotificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(reloadData), name: .reloadDataNotification, object: nil)
    }
}

extension NotesListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterContentForSearchText(searchText)
        self.searchText = searchText
        self.tableView.reloadData()
    }
}
