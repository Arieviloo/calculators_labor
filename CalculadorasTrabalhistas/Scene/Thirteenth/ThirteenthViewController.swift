import UIKit

class ThirteenthViewController: UIViewController {
	
	private let thirteenthView = ThirteenthView()
	private let thirteenVM = ThirteenthViewModel()
	private let listTypePayment = ["Parcela única", "Primeira parcela", "Segunda parcela"]
	var listItensCell = [ListTypePaymentTableViewCell()]
	
	init(calculator: Calculator) {
		super.init(nibName: nil, bundle: nil)
		thirteenVM.setCalculator(calculator: calculator)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		view = thirteenthView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		title = thirteenVM.getTitle()
		hideKeyboardWhenTappedAround()
		thirteenthView.protocolsTableView(delegate: self, dataSource: self)
		thirteenthView.configTextFieldDelegate(delegate: self)
		thirteenthView.delegate(delegate: self)
		
	}
}

extension ThirteenthViewController: UITextFieldDelegate {
	
}

extension ThirteenthViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		listTypePayment.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: ListTypePaymentTableViewCell.identifier, for: indexPath) as? ListTypePaymentTableViewCell else { return UITableViewCell()}
		listItensCell.append(cell)
		cell.typePaymentLabel.text = listTypePayment[indexPath.row]
		let backgroundCell = UIView()
		backgroundCell.backgroundColor = .none
		cell.selectedBackgroundView = backgroundCell
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		50
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		thirteenVM.setTypePayment(listTypePayment[indexPath.row])
		let selectedCell = listItensCell[indexPath.row + 1]
		selectedCell.typePaygmentView.backgroundColor = UIColor.appBlueLight
	}
	
	func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
		let selectedCell = listItensCell[indexPath.row + 1]
		selectedCell.typePaygmentView.backgroundColor = UIColor.white
	}
	
	
}

extension ThirteenthViewController: ThirteenthViewProtocol {
	func tappedCalculate() {
		let monthWorked = (NSString(string: thirteenthView.monthWorkedTextField.text ?? "0").integerValue)
		thirteenVM.setMonthWorked(monthWorked)
		guard let calculator = thirteenVM.calculator else { return }
		let resultCalulator = ThirteenthResultViewController(calculator: calculator)
		navigationController?.pushViewController(resultCalulator, animated: true)
	}
	
	
}


