import UIKit

class CTButton: UIButton {
	
	init(title: String, colorBackground: UIColor) {
		super.init(frame: .zero)
		self.setTitle(String(localizedKey: "\(title)").uppercased(), for: .normal)
		self.backgroundColor = colorBackground
		
		configure()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configure() {
		translatesAutoresizingMaskIntoConstraints = false
		titleLabel?.font = UIFont(name: "Montserrat-ExtraBold", size: 18)
		tintColor = .white
		clipsToBounds = true
		layer.cornerRadius = 10
	}
	
}
