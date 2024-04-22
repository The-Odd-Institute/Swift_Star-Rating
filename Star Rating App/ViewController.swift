import UIKit

class ViewController: UIViewController, PostRateDelegate {

    @IBOutlet weak var ratingContainer: UIView!
    @IBOutlet weak var currentRateLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.layoutIfNeeded()
        self.view.layoutSubviews()

        let ratingContentView = RatingCustomView(frame: ratingContainer.bounds)
        ratingContainer.addSubview(ratingContentView)
        ratingContentView.delegate = self
    }

    func rateIs(sentRate: Float) {
        currentRateLabel.text = String(sentRate)
    }
}
