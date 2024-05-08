import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
	
	static let identifier = "HomeCollectionViewCell"
	
	lazy var calculatorButton: UIView = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.backgroundColor = UIColor.appGray
		$0.layer.cornerRadius = 15
		$0.layer.shadowOffset = CGSize(width: 3, height: 6)
		$0.layer.shadowRadius = 5
		$0.layer.shadowOpacity = 0.2
		$0.layer.shouldRasterize = true
		return $0
	}(UIView())
	
	lazy var iconCalculatorImage: UIImageView = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.contentMode = .scaleAspectFill
		return $0
	}(UIImageView())
	
	lazy var nameCalculatorLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.font = UIFont(name: "Montserrat-Medium", size: 16)
		return $0
	}(UILabel())
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configAddView()
		configConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	public func setDataCalculator(_ name: String, _ icon: String) {
		self.nameCalculatorLabel.text = name
		self.iconCalculatorImage.image = UIImage(named: icon)
	}
	
	private func configAddView() {
		contentView.addSubview(calculatorButton)
		calculatorButton.addSubview(nameCalculatorLabel)
		calculatorButton.addSubview(iconCalculatorImage)
	}
	
	private func configConstraints() {
		NSLayoutConstraint.activate([
			calculatorButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
			calculatorButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
			calculatorButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
			calculatorButton.heightAnchor.constraint(equalToConstant: 150),
			
			
			
			iconCalculatorImage.topAnchor.constraint(equalTo: calculatorButton.topAnchor, constant: 20),
			iconCalculatorImage.centerXAnchor.constraint(equalTo: calculatorButton.centerXAnchor),
			iconCalculatorImage.heightAnchor.constraint(equalToConstant: 70),
			
			nameCalculatorLabel.topAnchor.constraint(equalTo: iconCalculatorImage.bottomAnchor, constant: 20),
			nameCalculatorLabel.centerXAnchor.constraint(equalTo: calculatorButton.centerXAnchor)
	
		])
	}
}
