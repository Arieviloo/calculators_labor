import UIKit

class CTLabel: UILabel {
	override init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	init(titleLabel: String, fontSize: CGFloat, nameFont: String) {
		super.init(frame: .zero)
		self.text = String(localizedKey: titleLabel)
		self.font = UIFont(name: nameFont, size: fontSize)
		configure()
	}
	
	private func configure() {
		translatesAutoresizingMaskIntoConstraints = false
		textColor = .label
		adjustsFontSizeToFitWidth = true
		minimumScaleFactor = 0.9
		lineBreakMode = .byTruncatingTail
		numberOfLines = 0
	}
}
