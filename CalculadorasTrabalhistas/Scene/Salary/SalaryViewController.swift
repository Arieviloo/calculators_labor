import UIKit

class SalaryViewController: UIViewController {
	
	private let salaryView = SalaryView()
	private let salaryVM = SalaryViewModel()
	private var currentString = ""
	
	init(calculator: Calculator) {
		super.init(nibName: nil, bundle: nil)
		salaryVM.setCalculator(calculator: calculator)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		view = salaryView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.hideKeyboardWhenTappedAround()
		configView()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		currentString = ""
		salaryView.salaryValueTextField.text = ""
	}
	
	private func configView() {
		title = salaryVM.getTitle()
		self.salaryView.configTextFieldDelegate(delegate: self)
		self.salaryView.delegate(delegate: self)
		salaryView.isEnableNextButton(false)
	}
	
	
}

extension SalaryViewController: UITextFieldDelegate {
	
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		
		if salaryView.salaryValueTextField.isEditing {
			switch string {
			case "0"..."9":
				if currentString.count < 9 {
					currentString += string
					currencyInputFormatting(string: currentString, textField: salaryView.salaryValueTextField)
				}
				salaryView.isEnableNextButton(true)
			default:
				let array = Array(string)
				var currentStringArray = Array(currentString)
				
				if array.count == 0 && currentStringArray.count != 0 {
					currentStringArray.removeLast()
					if currentStringArray.count == 0 {
						salaryView.isEnableNextButton(false)
					}
					currentString = ""
					for character in currentStringArray {
						currentString += String(character)
					}
					currencyInputFormatting(string: currentString, textField: salaryView.salaryValueTextField)
				}
			}
		}
		
		if salaryView.dependentValueTextField.isEditing {
			let currentText = textField.text ?? ""
			guard let stringRange = Range(range, in: currentText) else { return false }
			let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
			return updatedText.count <= 3
		}
		
		return false
	}
}

extension SalaryViewController: SalaryViewProtocol {
	func tappedNext() {
		let valueSalary = (NSString(string: currentString).doubleValue)/100
		let valueDependent = (NSString(string: salaryView.dependentValueTextField.text ?? "0").integerValue)
		salaryVM.setSalaryAndDependent(salary: valueSalary, numberDependent: valueDependent)
		
		guard let calculator = salaryVM.calculator else { return }
		let additionalVC = AdditionalViewController(calculator: calculator)
		navigationController?.pushViewController(additionalVC, animated: true)
	}
	
}
