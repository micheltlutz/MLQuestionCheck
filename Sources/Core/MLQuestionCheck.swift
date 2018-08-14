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

open class MLQuestionCheck: UIView {
    static let name = "MLQuestionCheck"
    private var checkButton = MLQuestionCheckButton()
    open let labelQuestion: UILabel = {
        let labelQuestion = UILabel(frame: .zero)
        labelQuestion.translatesAutoresizingMaskIntoConstraints = false
        labelQuestion.text = ""
        labelQuestion.textColor = UIColor(hex: "333333")
        return labelQuestion
    }()
    private var isChecked = false
    open var question: String!
    open var didChangeState: ((_ isChecked: Bool) -> Void)?
    open var uncheckedImageName: String?
    open var checkedImageName: String?
    convenience public init(question: String, checked: Bool? = false) {
        self.init(frame: .zero)
        self.question = question
        self.isChecked = checked!
        labelQuestion.text = self.question
        setupCheck()
        setupButtonActions()
        setupViewConfiguration()
    }
    open func setupCheck() {
        if let uncheckedImageName = uncheckedImageName {
            checkButton.uncheckedImageName = uncheckedImageName
        }
        
        if let checkedImageName = checkedImageName {
            checkButton.checkedImageName = checkedImageName
        }
    }
    private func setupButtonActions() {
        checkButton.didCheck = { [weak self] in
            self?.isChecked = true
            self?.checkButton.viewState = .checked
            self?.didChangeState?(true)
        }
        checkButton.didUnChack = { [weak self] in
            self?.isChecked = false
            self?.checkButton.viewState = .unChecked
            self?.didChangeState?(false)
        }
    }
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
extension MLQuestionCheck: ViewConfiguration {
    func setupConstraints() {
        heightAnchor.constraint(equalToConstant: 36).isActive = true
        checkButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        checkButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        labelQuestion.leadingAnchor.constraint(equalTo: checkButton.trailingAnchor, constant: 16).isActive = true
        labelQuestion.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16).isActive = true
        labelQuestion.centerYAnchor.constraint(equalTo: checkButton.centerYAnchor).isActive = true
    }
    
    func buildViewHierarchy() {
        addSubview(checkButton)
        addSubview(labelQuestion)
    }
    
    func configureViews() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
