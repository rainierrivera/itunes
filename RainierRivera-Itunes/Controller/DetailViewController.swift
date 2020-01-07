//
//  DetailViewController.swift
//  RainierRivera-Itunes
//
//  Created by Rainier Rivera on 07/01/2020.
//  Copyright © 2020 Rainier Rivera. All rights reserved.
//


import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak private var descriptionLabel: UILabel!
    
    // Make sure to create viewModel when using this controller
    // or else this will crash.
    var viewModel: DetailViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let _ = viewModel {
            bindViewModel()
        }
    }
    private func bindViewModel() {
        descriptionLabel.text = viewModel.description
        navigationItem.title = viewModel.navigationTitle
    }
}
