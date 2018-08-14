//
//  UIControl+addAction.swift
//  Cingulo
//
//  Created by Cíngulo on 21/05/2018.
//  Copyright © 2018 Codigo da Mente Edicao E Comercio De Livros E Testes. All rights reserved.
//

import UIKit
extension UIControl {
    func addAction(for controlEvents: UIControlEvents = .primaryActionTriggered, action: @escaping () -> ()) {
        let sleeve = ClosureSleeve(attachTo: self, closure: action)
        addTarget(sleeve, action: #selector(ClosureSleeve.invoke), for: controlEvents)
    }
}
