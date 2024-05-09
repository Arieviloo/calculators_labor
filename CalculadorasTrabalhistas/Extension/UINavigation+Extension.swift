import UIKit

extension UINavigationController {
	func popToViewController(ofClass: AnyClass, animated: Bool = true) {
		if let vc = viewControllers.filter({$0.isKind(of: ofClass)}).last {
			popToViewController(vc, animated: animated)
		}
	}
}
