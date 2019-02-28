/////MIT License
////
////Copyright (c) 2018 Michel Anderson Lüz Teixeira
////
////Permission is hereby granted, free of charge, to any person obtaining a copy
////of this software and associated documentation files (the "Software"), to deal
////in the Software without restriction, including without limitation the rights
////to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
////copies of the Software, and to permit persons to whom the Software is
////furnished to do so, subject to the following conditions:
////
////The above copyright notice and this permission notice shall be included in all
////copies or substantial portions of the Software.
////
////THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
////IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
////FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
////AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
////LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
////OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
////SOFTWARE.

import UIKit

/**
 Enum: String define a Button states checked, unChecked
 */
public enum MLQuestionButtonState: String {
    case checked, unChecked
}

open class MLQuestionCheckButton: UIButton {
    /**
    Handler called when check component
    */
    open var didCheck: (() -> Void)?
    /**
     Handler called when uncheck component
     */
    open var didUncheck: (() -> Void)?
    /**
     This var contains the images names uncheckedImageName default value ***questionUnchecked*** just have a file in Assets with this name
     */
    open var uncheckedImageName = "questionUnchecked" {
        didSet {
            setupImages()
        }
    }
    /**
     This var contains the images names checkedImageName default value ***questionChecked*** just have a file in Assets with this name
     */
    open var checkedImageName = "questionChecked" {
        didSet {
            setupImages()
        }
    }
    /**
     Contains a Size Icon default value CGFloat(36)
     */
    open var sizeIcon = CGFloat(36)
    /**
     Contains a viewState

     - SeeAlso: `MLQuestionButtonState`
     */
    open var viewState: MLQuestionButtonState = .unChecked {
        didSet {
            setupImages()
        }
    }
    /**
     Init Component
     */
    convenience init() {
        self.init(frame: .zero)
        addTarget(self, action: #selector(touchUpInsideButton), for: .touchUpInside)
        setImage(UIImage(named: uncheckedImageName), for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: sizeIcon).isActive = true
        heightAnchor.constraint(equalToConstant: sizeIcon).isActive = true
    }
    /**
     Setup images setting image names
     */
    internal func setupImages() {
        if viewState == .unChecked {
            setImage(UIImage(named: uncheckedImageName), for: .normal)
        } else {
            setImage(UIImage(named: checkedImageName), for: .normal)
        }
    }
    /**
     Default public initializer
     */
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    /**
     Default required initializer
     */
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension MLQuestionCheckButton {
    /**
     Target #selector for Button
     */
    @objc fileprivate func touchUpInsideButton() {
        if viewState == .checked {
            didUncheck?()
        } else {
            didCheck?()
        }
    }
}

