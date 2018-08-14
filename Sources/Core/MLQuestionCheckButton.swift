//
//  QuestionCheckButton.swift
//  CinguloAudioPlayer
//
//  Created by Michel Anderson Lutz Teixeira on 10/08/2018.
//  Copyright © 2018 Michel Lutz. All rights reserved.
//

import UIKit

public enum MLQuestionButtonState: String {
    case checked, unChecked
}

open class MLQuestionCheckButton: UIButton {
    open var didCheck: (() -> Void)?
    open var didUnChack: (() -> Void)?
    open var uncheckedImageName = "questionUnchecked" {
        didSet {
            setupImages()
        }
    }
    open var checkedImageName = "questionChecked" {
        didSet {
            setupImages()
        }
    }
    private let sizeIcon = CGFloat(36)
    open var viewState: MLQuestionButtonState = .unChecked {
        didSet {
            setupImages()
        }
    }
    convenience init() {
        self.init(frame: .zero)
        addTarget(self, action: #selector(touchUpInsideButton), for: .touchUpInside)
        setImage(UIImage(named: uncheckedImageName), for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: sizeIcon).isActive = true
        heightAnchor.constraint(equalToConstant: sizeIcon).isActive = true
    }
    internal func setupImages() {
        if viewState == .unChecked {
            setImage(UIImage(named: uncheckedImageName), for: .normal)
        } else {
            setImage(UIImage(named: checkedImageName), for: .normal)
        }
    }
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension MLQuestionCheckButton {
    @objc fileprivate func touchUpInsideButton() {
        if viewState == .checked {
            didUnChack?()
            //viewState = .unChecked
        } else {
            //viewState = .checked
            didCheck?()
        }
    }
}

