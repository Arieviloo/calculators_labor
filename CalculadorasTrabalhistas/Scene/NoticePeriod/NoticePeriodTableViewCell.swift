import UIKit

class NoticePeriodTableViewCell: UITableViewCell {
	
	static let identifier = "NoticePeriodTableViewCell"
	
	lazy var noiticeButton: UIButton = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.clipsToBounds = true
		$0.layer.cornerRadius = 20
		$0.layer.borderColor = UIColor.black.cgColor
		$0.layer.borderWidth = 0.6
		$0.layer.masksToBounds = true
		$0.isUserInteractionEnabled = false
		return $0
	}(UIButton(type: .system))
	
	lazy var noticeLabel: UILabel = {
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
		contentView.addSubview(noiticeButton)
		noiticeButton.addSubview(noticeLabel)
	}
	
	private func configConstraints() {
		NSLayoutConstraint.activate([
			noiticeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
			noiticeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
			noiticeButton.heightAnchor.constraint(equalToConstant: 50),
			
			noticeLabel.centerXAnchor.constraint(equalTo: noiticeButton.centerXAnchor),
			noticeLabel.centerYAnchor.constraint(equalTo: noiticeButton.centerYAnchor)
			
			
		])
		
	}
	
}
