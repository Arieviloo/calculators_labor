import UIKit

class ListReasonTableViewCell: UITableViewCell {
	
	static let identifier = "ListReasonTableViewCell"
	
	lazy var motiveButton: UIButton = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.clipsToBounds = true
		$0.layer.cornerRadius = 20
		$0.layer.borderColor = UIColor.black.cgColor
		$0.layer.borderWidth = 0.6
		$0.layer.masksToBounds = true
		$0.isUserInteractionEnabled = false
		return $0
	}(UIButton(type: .system))
	
	lazy var motiveLabel: UILabel = {
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
	
	
	override func layoutSubviews() {
		super.layoutSubviews()

		contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
	}
	
	private func configAddView() {
		contentView.addSubview(motiveButton)
		motiveButton.addSubview(motiveLabel)
	}
	
	private func configConstraints() {
		NSLayoutConstraint.activate([
			motiveButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
			motiveButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
			motiveButton.heightAnchor.constraint(equalToConstant: 40),
			
			motiveLabel.centerXAnchor.constraint(equalTo: motiveButton.centerXAnchor),
			motiveLabel.centerYAnchor.constraint(equalTo: motiveButton.centerYAnchor)
		])
		
	}
	
}
