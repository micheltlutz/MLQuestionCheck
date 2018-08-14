//
//  ViewConfiguration.swift
//  Cingulo
//
//  Created by Michel Anderson Lutz Teixeira on 23/06/2018.
//  Copyright © 2018 Codigo da Mente Edicao E Comercio De Livros E Testes. All rights reserved.
//

import Foundation

protocol ViewConfiguration: class {
    func setupConstraints()
    func buildViewHierarchy()
    func configureViews()
    func setupViewConfiguration()
}

extension ViewConfiguration {
    func setupViewConfiguration() {
        buildViewHierarchy()
        setupConstraints()
        configureViews()
    }
    
    func configureViews() {
    }
}
