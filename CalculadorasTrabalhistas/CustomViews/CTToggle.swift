import UIKit

class CTToggle: UISwitch {
	init() {
		super.init(frame: .zero)
		configure()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configure() {
		translatesAutoresizingMaskIntoConstraints = false
		transform = CGAffineTransform(scaleX: 0.80, y: 0.80)
		onTintColor = UIColor.appGreenLight
		isEnabled = true
	}
}
