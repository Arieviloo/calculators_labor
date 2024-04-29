import UIKit

extension UIViewController {
	func lockOrientation(_ orientation: UIInterfaceOrientationMask) {
		if let delegate = UIApplication.shared.delegate as? AppDelegate {
			delegate.orientationLock = orientation
		}
	}
	
	func getCalculatorViewController(calculator: Calculator) -> UIViewController {
		let nameCalculator = calculator.nameViewController
		
		switch nameCalculator {
		case "NetSalaryViewController" :
			return OtherAdditionalViewController(calculator: calculator)
		case "VacationViewController" :
			return VacationViewController(calculator: calculator)
		case "RescissionViewController" :
			return RescissionViewController(calculator: calculator)
		case "ThirteenthViewController" :
			return ThirteenthViewController(calculator: calculator)
		default:
			return UIViewController()
		}
	}
	
	func hideKeyboardWhenTappedAround() {
		let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
		tap.cancelsTouchesInView = false
		view.addGestureRecognizer(tap)
	}
	
	func currencyInputFormatting(string: String, textField: UITextField) {
		let formatter = NumberFormatter()
		formatter.numberStyle = NumberFormatter.Style.currency
		formatter.locale = NSLocale(localeIdentifier: "pt_BR") as Locale
		let numberFromField = (NSString(string: string).doubleValue)/100
		textField.text = formatter.string(from: numberFromField as NSNumber)
	}
	
	func formatCurrency(value: Double) -> String {
		let formatter = NumberFormatter()
		formatter.numberStyle = NumberFormatter.Style.currency
		formatter.locale = NSLocale(localeIdentifier: "pt_BR") as Locale
		guard let numberFormat = formatter.string(from: value as NSNumber) else { return "0"}
		return numberFormat
	}
	
	func getResultViewController(calculator: Calculator) -> UIViewController {
		let nameCalculator = calculator.nameViewController
		
		switch nameCalculator {
		case "VacationViewController" :
			return VacationResultViewController(calculator: calculator)
		default:
			return ResultViewController(calculator: calculator)
		}
	}
	
}
