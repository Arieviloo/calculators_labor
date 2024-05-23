import UIKit

class ListTypePaymentTableViewCell: UITableViewCell {
	
	static let identifier = "ListTypePaymentTableViewCell"
	
	lazy var typePaygmentView: UIButton = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.clipsToBounds = true
		$0.layer.cornerRadius = 20
		$0.layer.borderColor = UIColor.black.cgColor
		$0.layer.borderWidth = 0.6
		$0.layer.masksToBounds = true
		$0.isUserInteractionEnabled = false
		return $0
	}(UIButton(type: .system))
	
	lazy var typePaymentLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		return $0
	}(UILabel())
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		configAddView()
		configConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configAddView() {
		contentView.addSubview(typePaygmentView)
		typePaygmentView.addSubview(typePaymentLabel)
	}
	
	private func configConstraints() {
		NSLayoutConstraint.activate([
			typePaygmentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
			typePaygmentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
			typePaygmentView.heightAnchor.constraint(equalToConstant: 40),
			
			typePaymentLabel.centerXAnchor.constraint(equalTo: typePaygmentView.centerXAnchor),
			typePaymentLabel.centerYAnchor.constraint(equalTo: typePaygmentView.centerYAnchor)
			
			
		])
		
	}
	
}
