import UIKit

protocol ResultViewProtocol: NSObject {
	func tappedSimulateAgainButton()
	func tappedOtherCalculationButton()
}

class ResultView: UIView {
	
	private var delegate: ResultViewProtocol?
	func delegate(delegate: ResultViewProtocol) {
		self.delegate = delegate
	}
	
	lazy var titleLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.text = "Salário Líquido"
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
	
	lazy var yourEarningsLabel: UILabel = {
		$0.setTextStrong(title: "yourEarnings", color:  UIColor.appGreen)
		return $0
	}(UILabel())
	
	
	lazy var grossSalaryLabel: UILabel = {
		$0.setTextSmall(title: "grossSalary")
		return $0
	}(UILabel())
	
	lazy var valueGrossSalaryLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.font = UIFont(name: "Montserrat-light", size: 12)
		return $0
	}(UILabel())
	
	lazy var additionalDangeroussLabel: UILabel = {
		$0.setTextSmall(title: "additionalDangerouss")
		return $0
	}(UILabel())
	
	lazy var valueAdditionalDangeroussLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.font = UIFont(name: "Montserrat-light", size: 12)
		return $0
	}(UILabel())
	
	lazy var additionalInsalubrityLabel: UILabel = {
		$0.setTextSmall(title: "additionalInsalubrity")
		return $0
	}(UILabel())
	
	lazy var valueAdditionalInsalubrityLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.font = UIFont(name: "Montserrat-light", size: 12)
		return $0
	}(UILabel())
	
	lazy var otherAdditionalLabel: UILabel = {
		$0.setTextSmall(title: "otherAdditional")
		return $0
	}(UILabel())
	
	lazy var valueOtherAdditionalLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.font = UIFont(name: "Montserrat-light", size: 12)
		return $0
	}(UILabel())
	
	lazy var yourDiscountsLabel: UILabel = {
		$0.setTextStrong(title: "yourDiscounts", color: UIColor.appRed)
		return $0
	}(UILabel())
	
	lazy var inssLabel: UILabel = {
		$0.setTextSmall(title: "inss")
		return $0
	}(UILabel())
	
	lazy var valueInssLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.font = UIFont(name: "Montserrat-light", size: 12)
		return $0
	}(UILabel())
	
	lazy var irrfLabel: UILabel = {
		$0.setTextSmall(title: "irrf")
		return $0
	}(UILabel())
	
	lazy var valueIrrfLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.font = UIFont(name: "Montserrat-light", size: 12)
		return $0
	}(UILabel())
	
	lazy var otherDiscountsLabel: UILabel = {
		$0.setTextSmall(title: "otherDiscounts")
		return $0
	}(UILabel())
	
	lazy var valueOtherDiscountsLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.font = UIFont(name: "Montserrat-light", size: 12)
		return $0
	}(UILabel())
	
	lazy var resultLabel: UILabel = {
		$0.setTextStrong(title: "Seu salário líquido será de", color: UIColor.appBlue)
		return $0
	}(UILabel())
	
	lazy var valueResultLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.font = UIFont(name: "Montserrat-ExtraBold", size: 20)
		$0.textColor = UIColor.appBlue
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
	
	@objc func tappedSimulateAgainButton() {
		self.delegate?.tappedSimulateAgainButton()
	}
	@objc func tappedOtherCalculationButton() {
		self.delegate?.tappedOtherCalculationButton()
	}
	
	public func setValueEarning(grossSalary: String, dangerouss: String, insalubrity: String, otherAdditional: String) {
		valueGrossSalaryLabel.text = grossSalary
		valueAdditionalDangeroussLabel.text = dangerouss
		valueAdditionalInsalubrityLabel.text = insalubrity
		valueOtherAdditionalLabel.text = otherAdditional
	}
	
	public func setValueDiscount(inss: String, irrf: String, otherDiscount: String) {
		valueInssLabel.text = inss
		valueIrrfLabel.text = irrf
		valueOtherDiscountsLabel.text = otherDiscount
	}
	
	public func setValueResult(result: String) {
		valueResultLabel.text = result
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = .white
		configAddView()
		configConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configAddView() {
		addSubview(titleLabel)
		addSubview(contentView)
		contentView.addSubview(yourEarningsLabel)
		contentView.addSubview(grossSalaryLabel)
		contentView.addSubview(valueGrossSalaryLabel)
		contentView.addSubview(additionalDangeroussLabel)
		contentView.addSubview(valueAdditionalDangeroussLabel)
		contentView.addSubview(additionalInsalubrityLabel)
		contentView.addSubview(valueAdditionalInsalubrityLabel)
		contentView.addSubview(otherAdditionalLabel)
		contentView.addSubview(valueOtherAdditionalLabel)
		contentView.addSubview(yourDiscountsLabel)
		contentView.addSubview(inssLabel)
		contentView.addSubview(valueInssLabel)
		contentView.addSubview(irrfLabel)
		contentView.addSubview(valueIrrfLabel)
		contentView.addSubview(otherDiscountsLabel)
		contentView.addSubview(valueOtherDiscountsLabel)
		contentView.addSubview(resultLabel)
		contentView.addSubview(valueResultLabel)
		addSubview(simulateAgainButton)
		addSubview(otherCalculationButton)
	}
	
	private func configConstraints() {
		NSLayoutConstraint.activate([
			titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
			titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
			titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
			
			contentView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
			contentView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
			contentView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
			contentView.heightAnchor.constraint(equalToConstant: 400),
			
			yourEarningsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
			yourEarningsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
			yourEarningsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
			
			grossSalaryLabel.topAnchor.constraint(equalTo: yourEarningsLabel.bottomAnchor, constant: 10),
			grossSalaryLabel.leadingAnchor.constraint(equalTo: yourEarningsLabel.leadingAnchor),
		
			valueGrossSalaryLabel.centerYAnchor.constraint(equalTo: grossSalaryLabel.centerYAnchor),
			valueGrossSalaryLabel.trailingAnchor.constraint(equalTo: yourEarningsLabel.trailingAnchor),
			
			additionalDangeroussLabel.topAnchor.constraint(equalTo: grossSalaryLabel.bottomAnchor, constant: 10),
			additionalDangeroussLabel.leadingAnchor.constraint(equalTo: yourEarningsLabel.leadingAnchor),
			
			valueAdditionalDangeroussLabel.centerYAnchor.constraint(equalTo: additionalDangeroussLabel.centerYAnchor),
			valueAdditionalDangeroussLabel.trailingAnchor.constraint(equalTo: yourEarningsLabel.trailingAnchor),
			
			additionalInsalubrityLabel.topAnchor.constraint(equalTo: additionalDangeroussLabel.bottomAnchor, constant: 10),
			additionalInsalubrityLabel.leadingAnchor.constraint(equalTo: yourEarningsLabel.leadingAnchor),
			
			valueAdditionalInsalubrityLabel.topAnchor.constraint(equalTo: additionalInsalubrityLabel.topAnchor),
			valueAdditionalInsalubrityLabel.trailingAnchor.constraint(equalTo: yourEarningsLabel.trailingAnchor),
			
			otherAdditionalLabel.topAnchor.constraint(equalTo: additionalInsalubrityLabel.bottomAnchor, constant: 10),
			otherAdditionalLabel.leadingAnchor.constraint(equalTo: yourEarningsLabel.leadingAnchor),
			
			valueOtherAdditionalLabel.topAnchor.constraint(equalTo: otherAdditionalLabel.topAnchor),
			valueOtherAdditionalLabel.trailingAnchor.constraint(equalTo: yourEarningsLabel.trailingAnchor),
			
			yourDiscountsLabel.topAnchor.constraint(equalTo: otherAdditionalLabel.bottomAnchor, constant: 50),
			yourDiscountsLabel.leadingAnchor.constraint(equalTo: yourEarningsLabel.leadingAnchor),
			yourDiscountsLabel.trailingAnchor.constraint(equalTo: yourEarningsLabel.trailingAnchor),
			
			inssLabel.topAnchor.constraint(equalTo: yourDiscountsLabel.bottomAnchor, constant: 10),
			inssLabel.leadingAnchor.constraint(equalTo: yourEarningsLabel.leadingAnchor),
			
			valueInssLabel.centerYAnchor.constraint(equalTo: inssLabel.centerYAnchor),
			valueInssLabel.trailingAnchor.constraint(equalTo: yourEarningsLabel.trailingAnchor),
			
			irrfLabel.topAnchor.constraint(equalTo: inssLabel.bottomAnchor, constant: 10),
			irrfLabel.leadingAnchor.constraint(equalTo: yourEarningsLabel.leadingAnchor),
			
			valueIrrfLabel.centerYAnchor.constraint(equalTo: irrfLabel.centerYAnchor),
			valueIrrfLabel.trailingAnchor.constraint(equalTo: yourEarningsLabel.trailingAnchor),
			
			otherDiscountsLabel.topAnchor.constraint(equalTo: irrfLabel.bottomAnchor, constant: 10),
			otherDiscountsLabel.leadingAnchor.constraint(equalTo: yourEarningsLabel.leadingAnchor),
			
			valueOtherDiscountsLabel.centerYAnchor.constraint(equalTo: otherDiscountsLabel.centerYAnchor),
			valueOtherDiscountsLabel.trailingAnchor.constraint(equalTo: yourEarningsLabel.trailingAnchor),
			
			resultLabel.topAnchor.constraint(equalTo: valueOtherDiscountsLabel.bottomAnchor, constant: 30),
			resultLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
			
			valueResultLabel.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 5),
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
