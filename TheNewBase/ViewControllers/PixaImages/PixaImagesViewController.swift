//
//  PixaImagesViewController.swift
//  TheNewBase
//
//  Created by Anh Tran on 10/4/19.
//  Copyright © 2019 Anh Tran. All rights reserved.
//

import UIKit

class PixaImagesViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: PixaImagesViewModeling?

    override func viewDidLoad() {
        super.viewDidLoad()
        addObservers()
        viewModel?.fetchPixaImages()
    }

    private func addObservers() {
        viewModel?.pixaImages.asObservable().subscribe(onNext: { [weak self] bitcoin in
            self?.tableView.reloadData()
        }).disposed(by: disposeBag)
    }
}

extension PixaImagesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
