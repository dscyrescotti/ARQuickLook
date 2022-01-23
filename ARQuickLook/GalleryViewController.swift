//
//  GalleryViewController.swift
//  ARQuickLook
//
//  Created by Aye Chan on 1/23/22.
//

import UIKit
import SnapKit
import QuickLook

class GalleryViewController: UIViewController {
    private let tableView = UITableView()
    private var selectedIndex = 0
    
    private var dataSource: [GalleryViewModel] = [.teapot, .gramophone, .pig]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTableView()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(GalleryCell.self, forCellReuseIdentifier: String(describing: GalleryCell.self))
        tableView.showsVerticalScrollIndicator = false
    }
}

// MARK: - tableView delegate & datasource
extension GalleryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: GalleryCell.self), for: indexPath) as! GalleryCell
        cell.configure(dataSource[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedIndex = indexPath.row
        let vc = QLPreviewController()
        vc.delegate = self
        vc.dataSource = self
        present(vc, animated: true, completion: nil)
    }
}

// MARK: - quicklook delegate & datasource
extension GalleryViewController: QLPreviewControllerDelegate, QLPreviewControllerDataSource {
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        1
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        let url = Bundle.main.url(forResource: dataSource[selectedIndex].fileName, withExtension: "usdz")
        return url! as QLPreviewItem
    }
}
