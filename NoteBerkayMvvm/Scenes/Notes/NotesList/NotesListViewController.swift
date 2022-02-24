//
//  NotesListViewController.swift
//  NoteBerkayMvvm
//
//  Created by Mustafa Berkay Kaya on 23.02.2022.
//

import TinyConstraints
import MobilliumBuilders

final class NotesListViewController: BaseViewController<NotesListViewModel> {
    
    let tableView = UITableViewBuilder().build()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()

   }
}

// MARK: - UILayout

extension NotesListViewController {
    func addSubViews() {
        addTableView()
    }
    
    func addTableView() {
        view.addSubview(tableView)
        tableView.edgesToSuperview()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NoteListCell.self, forCellReuseIdentifier: NoteListCell.defaultReuseIdentifier)
    }
}

// MARK: - Configure & Set Localize
extension NotesListViewController {
    
}

// MARK: - Actions
extension NotesListViewController {
    
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
    
}
