////MIT License
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
 MLQuestionCheck Extends UIView
 */
open class MLQuestionCheck: UIView {
    /**
     :nodoc:
     */
    static let name = "MLQuestionCheck"

    /**
     labelQuestion as UILabel instance and pre configured
     */
    public let labelQuestion: UILabel = {
        let labelQuestion = UILabel(frame: .zero)
        labelQuestion.translatesAutoresizingMaskIntoConstraints = false
        labelQuestion.text = ""
        labelQuestion.textColor = UIColor(hex: "333333")
        labelQuestion.numberOfLines = 0
        labelQuestion.lineBreakMode = .byWordWrapping
        return labelQuestion
    }()
    /**
     Define a state component
     */
    open var isChecked = false {
        didSet {
            setupCheck()
        }
    }
    /**
     Define a string question.
     */
    open var question: String = "" {
        didSet {
            if question != "" {
                labelQuestion.text = question
                updateHeightContraint()
            }
        }
    }
    /**
     Define a font for Label question
     */
    open var font: UIFont = UIFont.systemFont(ofSize: 20, weight: .light) {
        didSet {
            labelQuestion.font = font
            updateHeightContraint()
        }
    }
    /**
     Handler called when check or uncheck component
     */
    open var didChangeState: ((_ isChecked: Bool) -> Void)?
    /**
     Image Name for unchecked state component
     */
    open var uncheckedImageName: String?
    /**
     Image Name for checked state component
     */
    open var checkedImageName: String?
    /**
     Define width for component default value UIScreen.main.bounds.width.
     */
    open var widthQuestion: CGFloat = UIScreen.main.bounds.width {
        didSet {
            updateWidthConstraints()
        }
    }
    /**
     Min height from component Default CGFloat(36) can you chenge when you swipe images and size images uncheckedImageName or checkedImageName

     - SeeAlso: `MLQuestionCheckButton`
     */
    open var minHeightQuestion: CGFloat = 36
    /**
     Dynamic heightQuestion this value change when you chenge font, question or width component, default value CGFloat(36)
     */
    open private(set) var heightQuestion: CGFloat = 36
    /**
     Contains NSLayoutConstraint self heightAnchor.constraint
     */
    open private(set) var heightConstraint: NSLayoutConstraint?
    /**
     Contains NSLayoutConstraint self widthAnchor.constraint
     */
    open private(set) var widthConstraint: NSLayoutConstraint?
    /**
     checkButton contains a object MLQuestionCheckButton

     - SeeAlso: `MLQuestionCheckButton`
     */
    public let checkButton = MLQuestionCheckButton()

    /**
     Create a simple Check component
     - Parameters:
     - question: String with a Question for component.
     - checked: Bool? if true component init checked Default value false

     ### Usage Example: ###
     ````
     let question1 = MLQuestionCheck(question: "You are ok?")
     question1.didChangeState = { checked in

     }
     ````
     */
    convenience public init(question: String, checked: Bool? = false) {
        self.init(frame: .zero)
        self.question = question
        self.labelQuestion.text = question
        self.labelQuestion.font = font
        self.isChecked = checked!
        self.setupButtonActions()
        self.setupViewConfiguration()
    }
    /**
     Call this function when you change the images names self uncheckedImageName or checkedImageName, this function chenge images on checkButton: MLQuestionCheckButton

     - SeeAlso: `MLQuestionCheckButton`
     */
    open func setupCheck() {
        if let uncheckedImageName = uncheckedImageName {
            checkButton.uncheckedImageName = uncheckedImageName
        }
        
        if let checkedImageName = checkedImageName {
            checkButton.checkedImageName = checkedImageName
        }
    }
    /**
     :nodoc:
     */
    private func setupButtonActions() {
        checkButton.didCheck = { [weak self] in
            self?.isChecked = true
            self?.checkButton.viewState = .checked
            self?.didChangeState?(true)
        }
        checkButton.didUncheck = { [weak self] in
            self?.isChecked = false
            self?.checkButton.viewState = .unChecked
            self?.didChangeState?(false)
        }
    }
    /**
     :nodoc:
     */
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    /**
     :nodoc:
     */
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
/**
 Implementing MLViewConfiguration
 
- SeeAlso: `MLViewConfiguration`
 */
extension MLQuestionCheck: MLViewConfiguration {
    /**
     :nodoc:
     */
    private func updateWidthConstraints() {
        if let unwrappedWidthConstraint = widthConstraint {
            unwrappedWidthConstraint.constant = widthQuestion
        }
        updateHeightContraint()
    }
    /**
     :nodoc:
     */
    private func updateHeightQuestion() {
        heightQuestion = question.heightWithConstrainedWidth(width: (widthQuestion - checkButton.sizeIcon - 16), font: font)
    }

    private func updateHeightContraint() {
        updateHeightQuestion()
        if heightQuestion < minHeightQuestion { heightQuestion = minHeightQuestion }
        if let unwrappedHeightConstraint = heightConstraint {
            unwrappedHeightConstraint.constant = heightQuestion
        }
    }
    /**
     :nodoc:
     */
    func setupConstraints() {
        updateHeightQuestion()
        if heightQuestion < minHeightQuestion { heightQuestion = minHeightQuestion }
        heightConstraint = heightAnchor.constraint(equalToConstant: heightQuestion)
        heightConstraint?.isActive = true
        widthConstraint = widthAnchor.constraint(equalToConstant: widthQuestion)
        widthConstraint?.isActive = true
        checkButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        checkButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        labelQuestion.leadingAnchor.constraint(equalTo: checkButton.trailingAnchor,
                                               constant: 0).isActive = true
        labelQuestion.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        labelQuestion.centerYAnchor.constraint(equalTo: checkButton.centerYAnchor).isActive = true
    }
    /**
     :nodoc:
     */
    func buildViewHierarchy() {
        addSubview(checkButton)
        addSubview(labelQuestion)
    }
    /**
     :nodoc:
     */
    func configureViews() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
