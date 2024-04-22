import UIKit

class RatingCustomView: UIView {

    var rate: Float = 0
    var ratingContainer5by1: UIView!
    var starsYellowView: UIView!
    var delegate: PostRateDelegate!

    override init(frame: CGRect) {
        super.init(frame: frame)

        let width = frame.size.height * 5.0
        let height = frame.size.height
        let size: CGSize = CGSize(width: width, height: height)
        ratingContainer5by1 = UIView(frame: CGRect(origin: CGPoint.zero, size: size))
        ratingContainer5by1.center = self.center
        ratingContainer5by1.backgroundColor = UIColor.lightGray
        self.addSubview(ratingContainer5by1)
        ratingContainer5by1.isUserInteractionEnabled = true

        starsYellowView = UIView(frame: CGRect.zero)
        starsYellowView.backgroundColor = UIColor.init(red: 255.0 / 255.0,
                                                       green: 210.0 / 255.0,
                                                       blue: 93.0 / 255.0,
                                                       alpha: 1.0)
        starsYellowView.isUserInteractionEnabled = false
        ratingContainer5by1.addSubview(starsYellowView)

        let maskImageView: UIImageView = UIImageView(frame: ratingContainer5by1.bounds)
        maskImageView.image = #imageLiteral(resourceName: "starRatingMask")
        maskImageView.isUserInteractionEnabled = false
        ratingContainer5by1.addSubview(maskImageView)
        ratingContainer5by1.isUserInteractionEnabled = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let myTouch: UITouch = touches.first!

        if myTouch.view != ratingContainer5by1 {
            return
        }
        rateAt(point: myTouch.location(in: ratingContainer5by1))
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let myTouch: UITouch = touches.first!

        if myTouch.view != ratingContainer5by1 {
            return
        }
        rateAt(point: myTouch.location(in: ratingContainer5by1))
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let myTouch: UITouch = touches.first!

        if myTouch.view != ratingContainer5by1 {
            return
        }
        rateAt(point: myTouch.location(in: ratingContainer5by1))
    }

    func rateAt(point: CGPoint) {
        let height: CGFloat = ratingContainer5by1.frame.size.height
        let width: CGFloat = point.x
        let minWidth: CGFloat = 0.0
        let maxWidth = ratingContainer5by1.frame.size.width
        let newSize: CGSize = CGSize(width: width, height: height)
        let newFrame: CGRect = CGRect(origin: CGPoint.zero, size: newSize)

        if width <= maxWidth && width >= minWidth {
            starsYellowView.frame = newFrame
            rate = Float(ceil(Float(width / maxWidth) * 50.0)) / 10.0

            self.delegate.rateIs(sentRate: rate)
        }
    }

    func setStarsAtRate(rating: Float) {
        ratingContainer5by1.isUserInteractionEnabled = false // for rating

        let height: CGFloat = ratingContainer5by1.frame.size.height
        let maxWidth = ratingContainer5by1.frame.size.width

        let width: CGFloat = (CGFloat(rating) / 5.0) * maxWidth
        let minWidth: CGFloat = 0.0
        let newSize: CGSize = CGSize(width: width, height: height)
        let newFrame: CGRect = CGRect(origin: CGPoint.zero, size: newSize)

        if width <= maxWidth && width >= minWidth {
            starsYellowView.frame = newFrame
        }
    }
}
