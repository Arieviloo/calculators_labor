import UIKit

class ListReasonViewController: UIViewController {
	
	private var listReasonView = ListReasonView()
	private var listReasonVM = ListReasonViewModel()
	let listReason = ["Dispensa sem justa causa", "Dispensa com justa causa", "Pedido de demissão"]
	var listCell = [ListReasonTableViewCell()]
	
	init(calculator: Calculator) {
		super.init(nibName: nil, bundle: nil)
		listReasonVM.setCalculator(calculator: calculator)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		view = listReasonView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configView()
	}
	
	
	
	private func configView() {
		title = listReasonVM.getTitle()
		listReasonView.protocolsTableView(delegate: self, dataSource: self)
		listReasonView.delegate(delegate: self)
	}
}

extension ListReasonViewController: UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegateFlowLayout {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return listReason.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: ListReasonTableViewCell.identifier, for: indexPath) as? ListReasonTableViewCell else { return UITableViewCell() }
		listCell.append(cell)
		cell.motiveLabel.text = listReason[indexPath.row]
		let backgroundCell = UIView()
		backgroundCell.backgroundColor = .none
		cell.selectedBackgroundView = backgroundCell
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
	 70
	}
	
	func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
		let selectedCell = listCell[indexPath.row + 1]
		selectedCell.motiveButton.backgroundColor = UIColor.white
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		listReasonVM.setReasonResignation(reason: listReason[indexPath.row])
		let selectedCell = listCell[indexPath.row + 1]
		selectedCell.motiveButton.backgroundColor = UIColor.appBlueLight
	}
	
}

extension ListReasonViewController: ListReasonViewProtocol {
	func tappedNext() {
		guard let calculator = listReasonVM.calculator else { return }
		let nextVC =  NoticePeriodViewController(calculator: calculator)
		navigationController?.pushViewController(nextVC, animated: true)
	}
}
