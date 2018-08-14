//
//  ClosureAttach.swift
//  Cingulo
//
//  Created by Cíngulo on 21/05/2018.
//  Copyright © 2018 Codigo da Mente Edicao E Comercio De Livros E Testes. All rights reserved.
//

import Foundation

class ClosureSleeve {
    let closure: () -> ()
    
    init(attachTo: AnyObject, closure: @escaping () -> ()) {
        self.closure = closure
        objc_setAssociatedObject(attachTo, "[\(arc4random())]", self, .OBJC_ASSOCIATION_RETAIN)
    }
    
    @objc func invoke() {
        closure()
    }
}
