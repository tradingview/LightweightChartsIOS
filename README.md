# iOS LightweightCharts

[![Version](https://img.shields.io/cocoapods/v/LightweightCharts.svg?style=flat)](https://cocoapods.org/pods/LightweightCharts)
[![License](https://img.shields.io/cocoapods/l/LightweightCharts.svg?style=flat)](https://cocoapods.org/pods/LightweightCharts)
[![Platform](https://img.shields.io/cocoapods/p/LightweightCharts.svg?style=flat)](https://cocoapods.org/pods/LightweightCharts)

The iOS LightweightCharts is an iOS wrapper of the [TradingView Lightweight Charts](https://github.com/tradingview/lightweight-charts) library.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- iOS 10.0+

## Installation

LightweightCharts is available through [CocoaPods](https://cocoapods.org). To install
it, just simply add the following line to your Podfile:

```ruby
pod 'LightweightCharts', '~> 3.7.1'
```
## Usage

```swift
import LightweightCharts
```

Create instance of LightweightCharts, which is a subclass of UIView, and add it to your view.
```swift
var chart: LightweightCharts!

// ...
chart = LightweightCharts()
view.addSubview(chart)
// ... setup layout
```

Add any series to the chart and store a reference to it.
```swift
var series: BarSeries!

// ...
series = chart.addBarSeries(options: nil)
```

Add data to the series.
```swift
let data = [
    BarData(time: .string("2018-10-19"), open: 180.34, high: 180.99, low: 178.57, close: 179.85),
    BarData(time: .string("2018-10-22"), open: 180.82, high: 181.40, low: 177.56, close: 178.75),
    BarData(time: .string("2018-10-23"), open: 175.77, high: 179.49, low: 175.44, close: 178.53),
    BarData(time: .string("2018-10-24"), open: 178.58, high: 182.37, low: 176.31, close: 176.97),
    BarData(time: .string("2018-10-25"), open: 177.52, high: 180.50, low: 176.83, close: 179.07)
]

// ...
series.setData(data: data)
```

## License

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this software except in compliance with the License. You may obtain a copy of the License at LICENSE file. Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

This software incorporates several parts of tslib (https://github.com/Microsoft/tslib, (c) Microsoft Corporation) that are covered by the Apache License, Version 2.0.

This license requires specifying TradingView as the product creator. You shall add the "attribution notice" from the NOTICE file and a link to https://www.tradingview.com/ to the page of your website or mobile application that is available to your users. As thanks for creating this product, we'd be grateful if you add it in a prominent place.
