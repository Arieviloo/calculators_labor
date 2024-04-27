import UIKit

class CTTextField: UITextField {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configure()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configure() {
		translatesAutoresizingMaskIntoConstraints = false
		leftViewMode = .always
		font = UIFont.systemFont(ofSize: 18)
		backgroundColor = UIColor.appGray
		clipsToBounds = true
		layer.cornerRadius = 10
		autocorrectionType = .no
		keyboardType = .numberPad
		borderStyle = .roundedRect
	}
}
