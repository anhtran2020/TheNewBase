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
        self.title = "Pixa Images"
        addObservers()
        setupTableViewCell()
        setupTableViewCellTapped()
        setupTableViewLoadData()
        tableView.triggerPullToRefresh()
    }
    
    private func addObservers() {
        viewModel?.images.subscribe(onNext: { [weak self] _ in
            self?.stopLoadDataAnimating()
        }).disposed(by: disposeBag)
        
        viewModel?.errorLoadImagesMessage.subscribe(onNext: { [weak self] message in
            self?.stopLoadDataAnimating()
        }).disposed(by: disposeBag)
    }
    
    //MARK: - Setup tableview
    
    private func setupTableViewLoadData() {
        tableView.addPullToRefresh { [weak self] in
            self?.viewModel?.refesh()
        }
        
        tableView.addInfiniteScrollingView { [weak self] in
            self?.viewModel?.loadMore()
        }
    }
    
    private func setupTableViewCell() {
        viewModel?.images.bind(to: tableView.rx.items(cellIdentifier: ImageInfoCell.identifier,
                                                          cellType: ImageInfoCell.self)) { row, model, cell in
            cell.configCell(with: model)
        }.disposed(by: disposeBag)
    }
    
    private func setupTableViewCellTapped() {
        tableView.rx.modelSelected(Imaging.self).subscribe(onNext: { [weak self] image in
            guard let self = self else { return }
            guard let indexPath = self.tableView.indexPathForSelectedRow else { return }
            self.tableView.deselectRow(at: indexPath, animated: true)
            self.showDetailImage(at: indexPath.row)
        }).disposed(by: disposeBag)
    }
    
    //MARK: - Navigations
    
    private func showDetailImage(at index: Int) {
        guard let images = viewModel?.images.value else { return }
        showImageDetailVC.onNext(images[index])
    }
    
    //MARK: - Utils
    
    private func stopLoadDataAnimating() {
        tableView.stopPullToRefreshAnimating()
        tableView.infiniteScrollingView?.stopAnimating()
    }
}
