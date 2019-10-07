//
//  PixaImagesViewController.swift
//  TheNewBase
//
//  Created by Anh Tran on 10/4/19.
//  Copyright © 2019 Anh Tran. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ImagesViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: ImagesViewModeling?
    var showImageDetailVC = PublishSubject<Imaging>()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewCell()
        setupTableViewCellTapped()
        viewModel?.fetchPixaImages()
    }
    
    private func setupTableViewCell() {
        viewModel?.images.bind(to: tableView.rx.items(cellIdentifier: PixaImagaCell.identifier,
                                                          cellType: PixaImagaCell.self)) { row, model, cell in
            cell.configCell(with: model)
        }.disposed(by: disposeBag)
    }
    
    private func setupTableViewCellTapped() {
        tableView.rx.modelSelected(PixaImage.self).subscribe(onNext: { [weak self] image in
            guard let self = self else { return }
            guard let indexPath = self.tableView.indexPathForSelectedRow else { return }
            self.tableView.deselectRow(at: indexPath, animated: true)
            self.showDetailImage(at: indexPath.row)
        }).disposed(by: disposeBag)
    }
    
    private func showDetailImage(at index: Int) {
        guard let images = try? viewModel?.images.value() else { return }
        showImageDetailVC.onNext(images[index])
    }
}
