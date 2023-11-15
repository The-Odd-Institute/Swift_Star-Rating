# Swift Star Rating Component

A reusable 5-star rating component for iOS applications with touch-based interaction and float value return.

## Overview

This project provides an interactive star rating view that allows users to rate items by touching and dragging across the rating bar. Returns precise float values with configurable decimal precision.

## Technologies

- **Language**: Swift
- **Framework**: UIKit
- **Platform**: iOS

## Features

- Interactive touch-based rating control
- Visual feedback with star mask overlay
- Delegate pattern for rating updates
- Float return value (1 decimal point precision)
- Read-only display mode available
- Easy integration into any project

## Usage

### Integration

1. Add `RatingCustomView.swift` to your project
2. Include `starRatingMask.png` from Assets.xcassets

### Implementation

```swift
override func viewDidLoad() {
    super.viewDidLoad()

    view.layoutIfNeeded()
    view.layoutSubviews()

    let ratingView = RatingCustomView(frame: ratingContainer.bounds)
    ratingContainer.addSubview(ratingView)
    ratingView.delegate = self
}

// Access the rating value
let currentRating = ratingView.rate
```

### Delegate Protocol

```swift
protocol PostRateDelegate {
    func postRate(rate: Float)
}
```

### Customize Precision

In `RatingCustomView`, modify the `rateAt` function:
- Default: 1 decimal point (values 50 and 10)
- 2 decimals: Change 50 to 500, 10 to 100

## Project Structure

```
Star Rating App/
├── RatingCustomView.swift    # Main rating component
├── PostRateProtocol.swift    # Delegate protocol
├── ViewController.swift      # Example usage
└── AppDelegate.swift
```

## Requirements

- Xcode
- iOS 10.0+

## License

MIT License (2018)

![Star Rating Demo](https://github.com/AmirJahan/Swift_Star-Rating/blob/master/Swift_Star-Rating.gif?raw=true)
