import UIKit

protocol SalaryViewProtocol: NSObject {
	func tappedNext()
}

class SalaryView: UIView {
	
	private weak var delegate: SalaryViewProtocol?
	public func delegate(delegate: SalaryViewProtocol) {
		self.delegate = delegate
	}
	
	lazy var salaryLabel = CTLabel(titleLabel: "whichValueSalary", fontSize: 16, nameFont: "Montserrat-light")
	lazy var salaryValueTextField = CTTextField()
	lazy var subtitleSalaryLabel = CTLabel(titleLabel: "subTitleValueSalary", fontSize: 10, nameFont: "Montserrat-Medium")

	lazy var dependentLabel = CTLabel(titleLabel: "howMuchDependents", fontSize: 16, nameFont: "Montserrat-light")
	lazy var dependentValueTextField = CTTextField()
	lazy var subtitleDependentLabel = CTLabel(titleLabel: "subTitleValueDependents", fontSize: 10, nameFont: "Montserrat-Medium")
	
	lazy var nextButton: UIButton = {
		$0.setCustomButton(title: "next", colorBackground: UIColor.appBlue)
		$0.addTarget(self, action: #selector(tappedNext), for: .touchUpInside)
		return $0
	}(UIButton(type: .system))
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = .white
		configAddView()
		configConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
		salaryValueTextField.delegate = delegate
		dependentValueTextField.delegate = delegate
	}
	
	public func disableNextButton() {
		nextButton.isEnabled = false
		nextButton.backgroundColor = UIColor.appGray
	}
	
	public func enableNextButton() {
		nextButton.isEnabled = true
		nextButton.backgroundColor = UIColor.appBlue
	}
	
	@objc func tappedNext() {
		self.delegate?.tappedNext()
	}
	
	private func configAddView() {
		addSubview(salaryLabel)
		addSubview(salaryValueTextField)
		addSubview(subtitleSalaryLabel)
		addSubview(dependentLabel)
		addSubview(subtitleDependentLabel)
		addSubview(dependentValueTextField)
		addSubview(nextButton)
	}
	
	private func configConstraints() {
		NSLayoutConstraint.activate([
			salaryLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
			salaryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
			salaryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
			
			salaryValueTextField.topAnchor.constraint(equalTo: salaryLabel.bottomAnchor, constant: 10),
			salaryValueTextField.leadingAnchor.constraint(equalTo: salaryLabel.leadingAnchor),
			salaryValueTextField.trailingAnchor.constraint(equalTo: salaryLabel.trailingAnchor),
			salaryValueTextField.heightAnchor.constraint(equalToConstant: 40),
			
			subtitleSalaryLabel.topAnchor.constraint(equalTo: salaryValueTextField.bottomAnchor, constant: 10),
			subtitleSalaryLabel.leadingAnchor.constraint(equalTo: salaryLabel.leadingAnchor),
			subtitleSalaryLabel.trailingAnchor.constraint(equalTo: salaryLabel.trailingAnchor),
			
			dependentLabel.topAnchor.constraint(equalTo: subtitleSalaryLabel.bottomAnchor, constant: 40),
			dependentLabel.leadingAnchor.constraint(equalTo: salaryLabel.leadingAnchor),
			dependentLabel.trailingAnchor.constraint(equalTo: salaryLabel.trailingAnchor),
			
			dependentValueTextField.topAnchor.constraint(equalTo: dependentLabel.bottomAnchor, constant: 10),
			dependentValueTextField.leadingAnchor.constraint(equalTo: salaryLabel.leadingAnchor),
			dependentValueTextField.trailingAnchor.constraint(equalTo: salaryLabel.trailingAnchor),
			dependentValueTextField.heightAnchor.constraint(equalToConstant: 40),
			
			subtitleDependentLabel.topAnchor.constraint(equalTo: dependentValueTextField.bottomAnchor, constant: 10),
			subtitleDependentLabel.leadingAnchor.constraint(equalTo: salaryLabel.leadingAnchor),
			subtitleDependentLabel.trailingAnchor.constraint(equalTo: salaryLabel.trailingAnchor),
			
			nextButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -200),
			nextButton.centerXAnchor.constraint(equalTo: centerXAnchor),
			nextButton.widthAnchor.constraint(equalToConstant: 160),
			nextButton.heightAnchor.constraint(equalToConstant: 45),
			
		])
	}
}
