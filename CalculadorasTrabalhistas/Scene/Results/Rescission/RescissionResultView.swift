import UIKit

enum Color: String {
	case red
	case green
	
	var create: UIColor {
		switch self {
		case .red:
			return UIColor.appRed
		case .green:
			return UIColor.appGreen
		}
	}
}

protocol RescissionResultViewProtocol: NSObject {
	func tappedSimulateAgainButton()
	func tappedOtherCalculationButton()
}

class RescissionResultView: UIView {
	
	private var delegate: RescissionResultViewProtocol?
	func delegate(delegate: RescissionResultViewProtocol) {
		self.delegate = delegate
	}
	
	lazy var scroolView: UIScrollView = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		return $0
	}(UIScrollView())
	
	lazy var contentStackView: UIView = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		return $0
	}(UIView())
	
	lazy var titleLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.text = "Rescisão"
		$0.font = UIFont(name: "Montserrat-light", size: 20)
		
		return $0
	}(UILabel())
	
	lazy var contentView:UIView = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.backgroundColor = UIColor.appBlueLight
		$0.clipsToBounds = true
		$0.layer.cornerRadius = 20
		return $0
	}(UIView())
	
	lazy var resultCalculationLabel: UILabel = {
		$0.setTextStrong(title: "resultCaculation", color:  UIColor.appGreen)
		return $0
	}(UILabel())
	
	lazy var verbsRescissionLabel: UILabel = {
		$0.setTextSmall(title: "verbsRescission")
		return $0
	}(UILabel())
	
	lazy var valueVerbsRescissionLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.font = UIFont(name: "Montserrat-light", size: 12)
		$0.text = "R$ 0.00"
		return $0
	}(UILabel())
	
	lazy var discountsLabel: UILabel = {
		$0.setTextSmall(title: "discounts")
		return $0
	}(UILabel())
	
	lazy var valueDiscountsLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.font = UIFont(name: "Montserrat-light", size: 12)
		$0.text = "R$ 0.00"
		return $0
	}(UILabel())
	
	lazy var totalFGTSLabel: UILabel = {
		$0.setTextSmall(title: "totalFGTS")
		return $0
	}(UILabel())
	
	lazy var valueTotalFGTSLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.font = UIFont(name: "Montserrat-light", size: 12)
		$0.text = "R$ 0.00"
		return $0
	}(UILabel())
	
	lazy var accruedVacationLabel: UILabel = {
		$0.setTextSmall(title: "accruedVacation")
		$0.textColor = UIColor.appGreen
		$0.isHidden = true
		return $0
	}(UILabel())
	
	lazy var valueAccruedVacationLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.font = UIFont(name: "Montserrat-light", size: 12)
		$0.textColor = UIColor.appGreen
		$0.isHidden = true
		$0.text = "R$ 0.00"
		return $0
	}(UILabel())
	
	lazy var noticePeriodLabel: UILabel = {
		$0.setTextSmall(title: "noticePeriod")
		$0.isHidden = true
		return $0
	}(UILabel())
	
	lazy var valueNoticePeriodLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.font = UIFont(name: "Montserrat-light", size: 12)
		$0.text = "R$ 0.00"
		$0.isHidden = true
		return $0
	}(UILabel())
	
	lazy var resultLabel: UILabel = {
		$0.setTextStrong(title: "O valor da rescisão será de", color: UIColor.appBlue)
		return $0
	}(UILabel())
	
	lazy var valueResultLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.font = UIFont(name: "Montserrat-ExtraBold", size: 20)
		$0.textColor = UIColor.appBlue
		$0.text = "R$ 0,00"
		return $0
	}(UILabel())
	
	lazy var simulateAgainButton: UIButton = {
		$0.setCustomButton(title: "simulateAgain", colorBackground: UIColor.appBlueLight)
		$0.addTarget(self, action: #selector(tappedSimulateAgainButton), for: .touchUpInside)
		return $0
	}(UIButton(type: .system))
	
	lazy var otherCalculationButton: UIButton = {
		$0.setCustomButton(title: "doAnotherCalculation", colorBackground: UIColor.appBlueHeavy)
		$0.addTarget(self, action: #selector(tappedOtherCalculationButton), for: .touchUpInside)
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
	
	@objc func tappedSimulateAgainButton() {
		self.delegate?.tappedSimulateAgainButton()
	}
	@objc func tappedOtherCalculationButton() {
		self.delegate?.tappedOtherCalculationButton()
	}
	
	public func setValueRescission(_ verbsRescision: String, _ discount: String, _ fgts: String, _ total: String) {
		valueVerbsRescissionLabel.text = verbsRescision
		valueDiscountsLabel.text = discount
		valueTotalFGTSLabel.text = fgts
		valueResultLabel.text = total
	}
	
	public func setValueNoticePeriod(_ value: String, _ color: String ) {
		let color = Color(rawValue: color)
		noticePeriodLabel.isHidden = false
		valueNoticePeriodLabel.isHidden = false
		valueNoticePeriodLabel.text = value
		valueNoticePeriodLabel.textColor = color?.create
		noticePeriodLabel.textColor = color?.create
	}
	
	public func setValueAccruedVacation(_ value: String) {
		
		accruedVacationLabel.isHidden = false
		valueAccruedVacationLabel.isHidden = false
		valueAccruedVacationLabel.text = value
		
	}
	
	private func configAddView() {
		addSubview(scroolView)
		scroolView.addSubview(contentStackView)
		contentStackView.addSubview(titleLabel)
		contentStackView.addSubview(contentView)
		contentView.addSubview(resultCalculationLabel)
		contentView.addSubview(verbsRescissionLabel)
		contentView.addSubview(valueVerbsRescissionLabel)
		contentView.addSubview(discountsLabel)
		contentView.addSubview(valueDiscountsLabel)
		contentView.addSubview(totalFGTSLabel)
		contentView.addSubview(valueTotalFGTSLabel)
		contentView.addSubview(resultLabel)
		contentView.addSubview(valueResultLabel)
		contentView.addSubview(noticePeriodLabel)
		contentView.addSubview(valueNoticePeriodLabel)
		contentView.addSubview(accruedVacationLabel)
		contentView.addSubview(valueAccruedVacationLabel)
		contentStackView.addSubview(simulateAgainButton)
		contentStackView.addSubview(otherCalculationButton)
	}
	
	private func configConstraints() {
		NSLayoutConstraint.activate([
			scroolView.topAnchor.constraint(equalTo: topAnchor),
			scroolView.bottomAnchor.constraint(equalTo: bottomAnchor),
			scroolView.leadingAnchor.constraint(equalTo: leadingAnchor),
			scroolView.trailingAnchor.constraint(equalTo: trailingAnchor),
			
			contentStackView.topAnchor.constraint(equalTo: scroolView.topAnchor),
			contentStackView.bottomAnchor.constraint(equalTo: scroolView.bottomAnchor),
			contentStackView.leadingAnchor.constraint(equalTo: scroolView.leadingAnchor),
			contentStackView.trailingAnchor.constraint(equalTo: scroolView.trailingAnchor),
			contentStackView.widthAnchor.constraint(equalTo: scroolView.widthAnchor),
			contentStackView.heightAnchor.constraint(equalTo: scroolView.heightAnchor),
			
			titleLabel.topAnchor.constraint(equalTo: contentStackView.topAnchor, constant: 40),
			titleLabel.leadingAnchor.constraint(equalTo: contentStackView.leadingAnchor, constant: 15),
			titleLabel.trailingAnchor.constraint(equalTo: contentStackView.trailingAnchor, constant: -15),
			
			contentView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
			contentView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
			contentView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
			contentView.heightAnchor.constraint(equalToConstant: 300),
			
			resultCalculationLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
			resultCalculationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
			resultCalculationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
			
			verbsRescissionLabel.topAnchor.constraint(equalTo: resultCalculationLabel.bottomAnchor, constant: 10),
			verbsRescissionLabel.leadingAnchor.constraint(equalTo: resultCalculationLabel.leadingAnchor),
			
			valueVerbsRescissionLabel.centerYAnchor.constraint(equalTo: verbsRescissionLabel.centerYAnchor),
			valueVerbsRescissionLabel.trailingAnchor.constraint(equalTo: resultCalculationLabel.trailingAnchor),
			
			discountsLabel.topAnchor.constraint(equalTo: verbsRescissionLabel.bottomAnchor, constant: 10),
			discountsLabel.leadingAnchor.constraint(equalTo: resultCalculationLabel.leadingAnchor),
			
			valueDiscountsLabel.centerYAnchor.constraint(equalTo: discountsLabel.centerYAnchor),
			valueDiscountsLabel.trailingAnchor.constraint(equalTo: resultCalculationLabel.trailingAnchor),
			
			totalFGTSLabel.topAnchor.constraint(equalTo: discountsLabel.bottomAnchor, constant: 10),
			totalFGTSLabel.leadingAnchor.constraint(equalTo: resultCalculationLabel.leadingAnchor),
			
			valueTotalFGTSLabel.centerYAnchor.constraint(equalTo: totalFGTSLabel.centerYAnchor),
			valueTotalFGTSLabel.trailingAnchor.constraint(equalTo: resultCalculationLabel.trailingAnchor),
			
			noticePeriodLabel.topAnchor.constraint(equalTo: totalFGTSLabel.bottomAnchor, constant: 10),
			noticePeriodLabel.leadingAnchor.constraint(equalTo: resultCalculationLabel.leadingAnchor),
			
			valueNoticePeriodLabel.centerYAnchor.constraint(equalTo: noticePeriodLabel.centerYAnchor),
			valueNoticePeriodLabel.trailingAnchor.constraint(equalTo: resultCalculationLabel.trailingAnchor),
			
			accruedVacationLabel.topAnchor.constraint(equalTo: noticePeriodLabel.bottomAnchor, constant: 10),
			accruedVacationLabel.leadingAnchor.constraint(equalTo: resultCalculationLabel.leadingAnchor),
			
			valueAccruedVacationLabel.centerYAnchor.constraint(equalTo: accruedVacationLabel.centerYAnchor),
			valueAccruedVacationLabel.trailingAnchor.constraint(equalTo: resultCalculationLabel.trailingAnchor),
					
			resultLabel.bottomAnchor.constraint(equalTo: valueResultLabel.topAnchor, constant: -10),
			resultLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
			
			valueResultLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
			valueResultLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
			
			simulateAgainButton.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 50),
			simulateAgainButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			simulateAgainButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			simulateAgainButton.heightAnchor.constraint(equalToConstant: 45),
			
			otherCalculationButton.topAnchor.constraint(equalTo: simulateAgainButton.bottomAnchor, constant: 10),
			otherCalculationButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			otherCalculationButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			otherCalculationButton.heightAnchor.constraint(equalToConstant: 45)
			
		])
	}
}
