import UIKit
import LightweightCharts

class RangeSwitcherViewController: UIViewController {
    
    enum Interval: CaseIterable {
        case day
        case week
        case month
        case year
        
        var title: String {
            switch self {
            case .day: return "1D"
            case .week: return "1W"
            case .month: return "1M"
            case .year: return "1Y"
            }
        }
        
        var data: [AreaData] {
            switch self {
            case .day: return Self.dayData
            case .week: return Self.weekData
            case .month: return Self.monthData
            case .year: return Self.yearData
            }
        }
    }
    
    private var chart: LightweightCharts!
    private var series: AreaSeries?
    
    private let intervals = ["1D", "1W", "1M", "1Y"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }
        
        setupUI()
        syncToInterval(.day)
    }
    
    private func setupUI() {
        let segmentedControl = UISegmentedControl(items: Interval.allCases.map { $0.title })
        segmentedControl.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
        view.addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                segmentedControl.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                segmentedControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
        } else {
            NSLayoutConstraint.activate([
                segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                segmentedControl.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        }
        
        let options = ChartOptions(
            layout: LayoutOptions(background: .solid(color: "#000000"), textColor: "#d1d4dc"),
            rightPriceScale: VisiblePriceScaleOptions(borderVisible: false),
            timeScale: TimeScaleOptions(borderVisible: false),
            crosshair: CrosshairOptions(horzLine: CrosshairLineOptions(visible: false)),
            grid: GridOptions(
                verticalLines: GridLineOptions(visible: false),
                horizontalLines: GridLineOptions(color: "rgba(42, 46, 57, 0.5)")
            )
        )
        let chart = LightweightCharts(options: options)
        view.addSubview(chart)
        chart.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                chart.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                chart.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                chart.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                chart.bottomAnchor.constraint(equalTo: segmentedControl.topAnchor, constant: -16)
            ])
        } else {
            NSLayoutConstraint.activate([
                chart.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                chart.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                chart.topAnchor.constraint(equalTo: view.topAnchor),
                chart.bottomAnchor.constraint(equalTo: segmentedControl.topAnchor, constant: -16)
            ])
        }
        self.chart = chart
        
        segmentedControl.selectedSegmentIndex = 0
    }
    
    private func syncToInterval(_ interval: Interval) {
        if let series = series {
            chart.removeSeries(seriesApi: series)
        }
        
        let options = AreaSeriesOptions(
            topColor: "rgba(76, 175, 80, 0.56)",
            bottomColor: "rgba(76, 175, 80, 0.04)",
            lineColor: "rgba(76, 175, 80, 1)",
            lineWidth: .two
        )
        series = chart.addAreaSeries(options: options)
        series?.setData(data: interval.data)
    }
    
    @objc private func valueChanged(_ sender: UISegmentedControl) {
        let interval = Interval.allCases[sender.selectedSegmentIndex]
        syncToInterval(interval)
    }
    
}

extension RangeSwitcherViewController.Interval {
    
    private static let dayData = [
        AreaData(time: .string("2018-10-19"), value: 26.19),
        AreaData(time: .string("2018-10-22"), value: 25.87),
        AreaData(time: .string("2018-10-23"), value: 25.83),
        AreaData(time: .string("2018-10-24"), value: 25.78),
        AreaData(time: .string("2018-10-25"), value: 25.82),
        AreaData(time: .string("2018-10-26"), value: 25.81),
        AreaData(time: .string("2018-10-29"), value: 25.82),
        AreaData(time: .string("2018-10-30"), value: 25.71),
        AreaData(time: .string("2018-10-31"), value: 25.82),
        AreaData(time: .string("2018-11-01"), value: 25.72),
        AreaData(time: .string("2018-11-02"), value: 25.74),
        AreaData(time: .string("2018-11-05"), value: 25.81),
        AreaData(time: .string("2018-11-06"), value: 25.75),
        AreaData(time: .string("2018-11-07"), value: 25.73),
        AreaData(time: .string("2018-11-08"), value: 25.75),
        AreaData(time: .string("2018-11-09"), value: 25.75),
        AreaData(time: .string("2018-11-12"), value: 25.76),
        AreaData(time: .string("2018-11-13"), value: 25.80),
        AreaData(time: .string("2018-11-14"), value: 25.77),
        AreaData(time: .string("2018-11-15"), value: 25.75),
        AreaData(time: .string("2018-11-16"), value: 25.75),
        AreaData(time: .string("2018-11-19"), value: 25.75),
        AreaData(time: .string("2018-11-20"), value: 25.72),
        AreaData(time: .string("2018-11-21"), value: 25.78),
        AreaData(time: .string("2018-11-23"), value: 25.72),
        AreaData(time: .string("2018-11-26"), value: 25.78),
        AreaData(time: .string("2018-11-27"), value: 25.85),
        AreaData(time: .string("2018-11-28"), value: 25.85),
        AreaData(time: .string("2018-11-29"), value: 25.55),
        AreaData(time: .string("2018-11-30"), value: 25.41),
        AreaData(time: .string("2018-12-03"), value: 25.41),
        AreaData(time: .string("2018-12-04"), value: 25.42),
        AreaData(time: .string("2018-12-06"), value: 25.33),
        AreaData(time: .string("2018-12-07"), value: 25.39),
        AreaData(time: .string("2018-12-10"), value: 25.32),
        AreaData(time: .string("2018-12-11"), value: 25.48),
        AreaData(time: .string("2018-12-12"), value: 25.39),
        AreaData(time: .string("2018-12-13"), value: 25.45),
        AreaData(time: .string("2018-12-14"), value: 25.52),
        AreaData(time: .string("2018-12-17"), value: 25.38),
        AreaData(time: .string("2018-12-18"), value: 25.36),
        AreaData(time: .string("2018-12-19"), value: 25.65),
        AreaData(time: .string("2018-12-20"), value: 25.70),
        AreaData(time: .string("2018-12-21"), value: 25.66),
        AreaData(time: .string("2018-12-24"), value: 25.66),
        AreaData(time: .string("2018-12-26"), value: 25.65),
        AreaData(time: .string("2018-12-27"), value: 25.66),
        AreaData(time: .string("2018-12-28"), value: 25.68),
        AreaData(time: .string("2018-12-31"), value: 25.77),
        AreaData(time: .string("2019-01-02"), value: 25.72),
        AreaData(time: .string("2019-01-03"), value: 25.69),
        AreaData(time: .string("2019-01-04"), value: 25.71),
        AreaData(time: .string("2019-01-07"), value: 25.72),
        AreaData(time: .string("2019-01-08"), value: 25.72),
        AreaData(time: .string("2019-01-09"), value: 25.66),
        AreaData(time: .string("2019-01-10"), value: 25.85),
        AreaData(time: .string("2019-01-11"), value: 25.92),
        AreaData(time: .string("2019-01-14"), value: 25.94),
        AreaData(time: .string("2019-01-15"), value: 25.95),
        AreaData(time: .string("2019-01-16"), value: 26.00),
        AreaData(time: .string("2019-01-17"), value: 25.99),
        AreaData(time: .string("2019-01-18"), value: 25.60),
        AreaData(time: .string("2019-01-22"), value: 25.81),
        AreaData(time: .string("2019-01-23"), value: 25.70),
        AreaData(time: .string("2019-01-24"), value: 25.74),
        AreaData(time: .string("2019-01-25"), value: 25.80),
        AreaData(time: .string("2019-01-28"), value: 25.83),
        AreaData(time: .string("2019-01-29"), value: 25.70),
        AreaData(time: .string("2019-01-30"), value: 25.78),
        AreaData(time: .string("2019-01-31"), value: 25.35),
        AreaData(time: .string("2019-02-01"), value: 25.60),
        AreaData(time: .string("2019-02-04"), value: 25.65),
        AreaData(time: .string("2019-02-05"), value: 25.73),
        AreaData(time: .string("2019-02-06"), value: 25.71),
        AreaData(time: .string("2019-02-07"), value: 25.71),
        AreaData(time: .string("2019-02-08"), value: 25.72),
        AreaData(time: .string("2019-02-11"), value: 25.76),
        AreaData(time: .string("2019-02-12"), value: 25.84),
        AreaData(time: .string("2019-02-13"), value: 25.85),
        AreaData(time: .string("2019-02-14"), value: 25.87),
        AreaData(time: .string("2019-02-15"), value: 25.89),
        AreaData(time: .string("2019-02-19"), value: 25.90),
        AreaData(time: .string("2019-02-20"), value: 25.92),
        AreaData(time: .string("2019-02-21"), value: 25.96),
        AreaData(time: .string("2019-02-22"), value: 26.00),
        AreaData(time: .string("2019-02-25"), value: 25.93),
        AreaData(time: .string("2019-02-26"), value: 25.92),
        AreaData(time: .string("2019-02-27"), value: 25.67),
        AreaData(time: .string("2019-02-28"), value: 25.79),
        AreaData(time: .string("2019-03-01"), value: 25.86),
        AreaData(time: .string("2019-03-04"), value: 25.94),
        AreaData(time: .string("2019-03-05"), value: 26.02),
        AreaData(time: .string("2019-03-06"), value: 25.95),
        AreaData(time: .string("2019-03-07"), value: 25.89),
        AreaData(time: .string("2019-03-08"), value: 25.94),
        AreaData(time: .string("2019-03-11"), value: 25.91),
        AreaData(time: .string("2019-03-12"), value: 25.92),
        AreaData(time: .string("2019-03-13"), value: 26.00),
        AreaData(time: .string("2019-03-14"), value: 26.05),
        AreaData(time: .string("2019-03-15"), value: 26.11),
        AreaData(time: .string("2019-03-18"), value: 26.10),
        AreaData(time: .string("2019-03-19"), value: 25.98),
        AreaData(time: .string("2019-03-20"), value: 26.11),
        AreaData(time: .string("2019-03-21"), value: 26.12),
        AreaData(time: .string("2019-03-22"), value: 25.88),
        AreaData(time: .string("2019-03-25"), value: 25.85),
        AreaData(time: .string("2019-03-26"), value: 25.72),
        AreaData(time: .string("2019-03-27"), value: 25.73),
        AreaData(time: .string("2019-03-28"), value: 25.80),
        AreaData(time: .string("2019-03-29"), value: 25.77),
        AreaData(time: .string("2019-04-01"), value: 26.06),
        AreaData(time: .string("2019-04-02"), value: 25.93),
        AreaData(time: .string("2019-04-03"), value: 25.95),
        AreaData(time: .string("2019-04-04"), value: 26.06),
        AreaData(time: .string("2019-04-05"), value: 26.16),
        AreaData(time: .string("2019-04-08"), value: 26.12),
        AreaData(time: .string("2019-04-09"), value: 26.07),
        AreaData(time: .string("2019-04-10"), value: 26.13),
        AreaData(time: .string("2019-04-11"), value: 26.04),
        AreaData(time: .string("2019-04-12"), value: 26.04),
        AreaData(time: .string("2019-04-15"), value: 26.05),
        AreaData(time: .string("2019-04-16"), value: 26.01),
        AreaData(time: .string("2019-04-17"), value: 26.09),
        AreaData(time: .string("2019-04-18"), value: 26.00),
        AreaData(time: .string("2019-04-22"), value: 26.00),
        AreaData(time: .string("2019-04-23"), value: 26.06),
        AreaData(time: .string("2019-04-24"), value: 26.00),
        AreaData(time: .string("2019-04-25"), value: 25.81),
        AreaData(time: .string("2019-04-26"), value: 25.88),
        AreaData(time: .string("2019-04-29"), value: 25.91),
        AreaData(time: .string("2019-04-30"), value: 25.90),
        AreaData(time: .string("2019-05-01"), value: 26.02),
        AreaData(time: .string("2019-05-02"), value: 25.97),
        AreaData(time: .string("2019-05-03"), value: 26.02),
        AreaData(time: .string("2019-05-06"), value: 26.03),
        AreaData(time: .string("2019-05-07"), value: 26.04),
        AreaData(time: .string("2019-05-08"), value: 26.05),
        AreaData(time: .string("2019-05-09"), value: 26.05),
        AreaData(time: .string("2019-05-10"), value: 26.08),
        AreaData(time: .string("2019-05-13"), value: 26.05),
        AreaData(time: .string("2019-05-14"), value: 26.01),
        AreaData(time: .string("2019-05-15"), value: 26.03),
        AreaData(time: .string("2019-05-16"), value: 26.14),
        AreaData(time: .string("2019-05-17"), value: 26.09),
        AreaData(time: .string("2019-05-20"), value: 26.01),
        AreaData(time: .string("2019-05-21"), value: 26.12),
        AreaData(time: .string("2019-05-22"), value: 26.15),
        AreaData(time: .string("2019-05-23"), value: 26.18),
        AreaData(time: .string("2019-05-24"), value: 26.16),
        AreaData(time: .string("2019-05-28"), value: 26.23)
    ]
    
    private static let weekData = [
        AreaData(time: .string("2016-07-18"), value: 26.10),
        AreaData(time: .string("2016-07-25"), value: 26.19),
        AreaData(time: .string("2016-08-01"), value: 26.24),
        AreaData(time: .string("2016-08-08"), value: 26.22),
        AreaData(time: .string("2016-08-15"), value: 25.98),
        AreaData(time: .string("2016-08-22"), value: 25.85),
        AreaData(time: .string("2016-08-29"), value: 25.98),
        AreaData(time: .string("2016-09-05"), value: 25.71),
        AreaData(time: .string("2016-09-12"), value: 25.84),
        AreaData(time: .string("2016-09-19"), value: 25.89),
        AreaData(time: .string("2016-09-26"), value: 25.65),
        AreaData(time: .string("2016-10-03"), value: 25.69),
        AreaData(time: .string("2016-10-10"), value: 25.67),
        AreaData(time: .string("2016-10-17"), value: 26.11),
        AreaData(time: .string("2016-10-24"), value: 25.80),
        AreaData(time: .string("2016-10-31"), value: 25.70),
        AreaData(time: .string("2016-11-07"), value: 25.40),
        AreaData(time: .string("2016-11-14"), value: 25.32),
        AreaData(time: .string("2016-11-21"), value: 25.48),
        AreaData(time: .string("2016-11-28"), value: 25.08),
        AreaData(time: .string("2016-12-05"), value: 25.06),
        AreaData(time: .string("2016-12-12"), value: 25.11),
        AreaData(time: .string("2016-12-19"), value: 25.34),
        AreaData(time: .string("2016-12-26"), value: 25.20),
        AreaData(time: .string("2017-01-02"), value: 25.33),
        AreaData(time: .string("2017-01-09"), value: 25.56),
        AreaData(time: .string("2017-01-16"), value: 25.32),
        AreaData(time: .string("2017-01-23"), value: 25.71),
        AreaData(time: .string("2017-01-30"), value: 25.85),
        AreaData(time: .string("2017-02-06"), value: 25.77),
        AreaData(time: .string("2017-02-13"), value: 25.94),
        AreaData(time: .string("2017-02-20"), value: 25.67),
        AreaData(time: .string("2017-02-27"), value: 25.60),
        AreaData(time: .string("2017-03-06"), value: 25.54),
        AreaData(time: .string("2017-03-13"), value: 25.84),
        AreaData(time: .string("2017-03-20"), value: 25.96),
        AreaData(time: .string("2017-03-27"), value: 25.90),
        AreaData(time: .string("2017-04-03"), value: 25.97),
        AreaData(time: .string("2017-04-10"), value: 26.00),
        AreaData(time: .string("2017-04-17"), value: 26.13),
        AreaData(time: .string("2017-04-24"), value: 26.02),
        AreaData(time: .string("2017-05-01"), value: 26.30),
        AreaData(time: .string("2017-05-08"), value: 26.27),
        AreaData(time: .string("2017-05-15"), value: 26.24),
        AreaData(time: .string("2017-05-22"), value: 26.02),
        AreaData(time: .string("2017-05-29"), value: 26.20),
        AreaData(time: .string("2017-06-05"), value: 26.12),
        AreaData(time: .string("2017-06-12"), value: 26.20),
        AreaData(time: .string("2017-06-19"), value: 26.46),
        AreaData(time: .string("2017-06-26"), value: 26.39),
        AreaData(time: .string("2017-07-03"), value: 26.52),
        AreaData(time: .string("2017-07-10"), value: 26.57),
        AreaData(time: .string("2017-07-17"), value: 26.65),
        AreaData(time: .string("2017-07-24"), value: 26.45),
        AreaData(time: .string("2017-07-31"), value: 26.37),
        AreaData(time: .string("2017-08-07"), value: 26.13),
        AreaData(time: .string("2017-08-14"), value: 26.21),
        AreaData(time: .string("2017-08-21"), value: 26.31),
        AreaData(time: .string("2017-08-28"), value: 26.33),
        AreaData(time: .string("2017-09-04"), value: 26.38),
        AreaData(time: .string("2017-09-11"), value: 26.38),
        AreaData(time: .string("2017-09-18"), value: 26.50),
        AreaData(time: .string("2017-09-25"), value: 26.39),
        AreaData(time: .string("2017-10-02"), value: 25.95),
        AreaData(time: .string("2017-10-09"), value: 26.15),
        AreaData(time: .string("2017-10-16"), value: 26.43),
        AreaData(time: .string("2017-10-23"), value: 26.22),
        AreaData(time: .string("2017-10-30"), value: 26.14),
        AreaData(time: .string("2017-11-06"), value: 26.08),
        AreaData(time: .string("2017-11-13"), value: 26.27),
        AreaData(time: .string("2017-11-20"), value: 26.30),
        AreaData(time: .string("2017-11-27"), value: 25.92),
        AreaData(time: .string("2017-12-04"), value: 26.10),
        AreaData(time: .string("2017-12-11"), value: 25.88),
        AreaData(time: .string("2017-12-18"), value: 25.82),
        AreaData(time: .string("2017-12-25"), value: 25.82),
        AreaData(time: .string("2018-01-01"), value: 25.81),
        AreaData(time: .string("2018-01-08"), value: 25.95),
        AreaData(time: .string("2018-01-15"), value: 26.03),
        AreaData(time: .string("2018-01-22"), value: 26.04),
        AreaData(time: .string("2018-01-29"), value: 25.96),
        AreaData(time: .string("2018-02-05"), value: 25.99),
        AreaData(time: .string("2018-02-12"), value: 26.00),
        AreaData(time: .string("2018-02-19"), value: 26.06),
        AreaData(time: .string("2018-02-26"), value: 25.77),
        AreaData(time: .string("2018-03-05"), value: 25.81),
        AreaData(time: .string("2018-03-12"), value: 25.88),
        AreaData(time: .string("2018-03-19"), value: 25.72),
        AreaData(time: .string("2018-03-26"), value: 25.75),
        AreaData(time: .string("2018-04-02"), value: 25.70),
        AreaData(time: .string("2018-04-09"), value: 25.73),
        AreaData(time: .string("2018-04-16"), value: 25.74),
        AreaData(time: .string("2018-04-23"), value: 25.69),
        AreaData(time: .string("2018-04-30"), value: 25.76),
        AreaData(time: .string("2018-05-07"), value: 25.89),
        AreaData(time: .string("2018-05-14"), value: 25.89),
        AreaData(time: .string("2018-05-21"), value: 26.00),
        AreaData(time: .string("2018-05-28"), value: 25.79),
        AreaData(time: .string("2018-06-04"), value: 26.11),
        AreaData(time: .string("2018-06-11"), value: 26.43),
        AreaData(time: .string("2018-06-18"), value: 26.30),
        AreaData(time: .string("2018-06-25"), value: 26.58),
        AreaData(time: .string("2018-07-02"), value: 26.33),
        AreaData(time: .string("2018-07-09"), value: 26.33),
        AreaData(time: .string("2018-07-16"), value: 26.32),
        AreaData(time: .string("2018-07-23"), value: 26.20),
        AreaData(time: .string("2018-07-30"), value: 26.03),
        AreaData(time: .string("2018-08-06"), value: 26.15),
        AreaData(time: .string("2018-08-13"), value: 26.17),
        AreaData(time: .string("2018-08-20"), value: 26.28),
        AreaData(time: .string("2018-08-27"), value: 25.86),
        AreaData(time: .string("2018-09-03"), value: 25.69),
        AreaData(time: .string("2018-09-10"), value: 25.69),
        AreaData(time: .string("2018-09-17"), value: 25.64),
        AreaData(time: .string("2018-09-24"), value: 25.67),
        AreaData(time: .string("2018-10-01"), value: 25.55),
        AreaData(time: .string("2018-10-08"), value: 25.59),
        AreaData(time: .string("2018-10-15"), value: 26.19),
        AreaData(time: .string("2018-10-22"), value: 25.81),
        AreaData(time: .string("2018-10-29"), value: 25.74),
        AreaData(time: .string("2018-11-05"), value: 25.75),
        AreaData(time: .string("2018-11-12"), value: 25.75),
        AreaData(time: .string("2018-11-19"), value: 25.72),
        AreaData(time: .string("2018-11-26"), value: 25.41),
        AreaData(time: .string("2018-12-03"), value: 25.39),
        AreaData(time: .string("2018-12-10"), value: 25.52),
        AreaData(time: .string("2018-12-17"), value: 25.66),
        AreaData(time: .string("2018-12-24"), value: 25.68),
        AreaData(time: .string("2018-12-31"), value: 25.71),
        AreaData(time: .string("2019-01-07"), value: 25.92),
        AreaData(time: .string("2019-01-14"), value: 25.60),
        AreaData(time: .string("2019-01-21"), value: 25.80),
        AreaData(time: .string("2019-01-28"), value: 25.60),
        AreaData(time: .string("2019-02-04"), value: 25.72),
        AreaData(time: .string("2019-02-11"), value: 25.89),
        AreaData(time: .string("2019-02-18"), value: 26.00),
        AreaData(time: .string("2019-02-25"), value: 25.86),
        AreaData(time: .string("2019-03-04"), value: 25.94),
        AreaData(time: .string("2019-03-11"), value: 26.11),
        AreaData(time: .string("2019-03-18"), value: 25.88),
        AreaData(time: .string("2019-03-25"), value: 25.77),
        AreaData(time: .string("2019-04-01"), value: 26.16),
        AreaData(time: .string("2019-04-08"), value: 26.04),
        AreaData(time: .string("2019-04-15"), value: 26.00),
        AreaData(time: .string("2019-04-22"), value: 25.88),
        AreaData(time: .string("2019-04-29"), value: 26.02),
        AreaData(time: .string("2019-05-06"), value: 26.08),
        AreaData(time: .string("2019-05-13"), value: 26.09),
        AreaData(time: .string("2019-05-20"), value: 26.16),
        AreaData(time: .string("2019-05-27"), value: 26.23)
    ]
    
    private static let monthData = [
        AreaData(time: .string("2006-12-01"), value: 25.40),
        AreaData(time: .string("2007-01-01"), value: 25.50),
        AreaData(time: .string("2007-02-01"), value: 25.11),
        AreaData(time: .string("2007-03-01"), value: 25.24),
        AreaData(time: .string("2007-04-02"), value: 25.34),
        AreaData(time: .string("2007-05-01"), value: 24.82),
        AreaData(time: .string("2007-06-01"), value: 23.85),
        AreaData(time: .string("2007-07-02"), value: 23.24),
        AreaData(time: .string("2007-08-01"), value: 23.05),
        AreaData(time: .string("2007-09-03"), value: 22.26),
        AreaData(time: .string("2007-10-01"), value: 22.52),
        AreaData(time: .string("2007-11-01"), value: 20.84),
        AreaData(time: .string("2007-12-03"), value: 20.37),
        AreaData(time: .string("2008-01-01"), value: 23.90),
        AreaData(time: .string("2008-02-01"), value: 22.58),
        AreaData(time: .string("2008-03-03"), value: 21.74),
        AreaData(time: .string("2008-04-01"), value: 22.50),
        AreaData(time: .string("2008-05-01"), value: 22.38),
        AreaData(time: .string("2008-06-02"), value: 20.58),
        AreaData(time: .string("2008-07-01"), value: 20.60),
        AreaData(time: .string("2008-08-01"), value: 20.82),
        AreaData(time: .string("2008-09-01"), value: 17.50),
        AreaData(time: .string("2008-10-01"), value: 17.70),
        AreaData(time: .string("2008-11-03"), value: 15.52),
        AreaData(time: .string("2008-12-01"), value: 18.58),
        AreaData(time: .string("2009-01-01"), value: 15.40),
        AreaData(time: .string("2009-02-02"), value: 11.68),
        AreaData(time: .string("2009-03-02"), value: 14.89),
        AreaData(time: .string("2009-04-01"), value: 16.24),
        AreaData(time: .string("2009-05-01"), value: 18.33),
        AreaData(time: .string("2009-06-01"), value: 18.08),
        AreaData(time: .string("2009-07-01"), value: 20.07),
        AreaData(time: .string("2009-08-03"), value: 20.35),
        AreaData(time: .string("2009-09-01"), value: 21.53),
        AreaData(time: .string("2009-10-01"), value: 21.48),
        AreaData(time: .string("2009-11-02"), value: 20.28),
        AreaData(time: .string("2009-12-01"), value: 21.39),
        AreaData(time: .string("2010-01-01"), value: 22.00),
        AreaData(time: .string("2010-02-01"), value: 22.31),
        AreaData(time: .string("2010-03-01"), value: 22.82),
        AreaData(time: .string("2010-04-01"), value: 22.58),
        AreaData(time: .string("2010-05-03"), value: 21.02),
        AreaData(time: .string("2010-06-01"), value: 21.45),
        AreaData(time: .string("2010-07-01"), value: 22.42),
        AreaData(time: .string("2010-08-02"), value: 23.61),
        AreaData(time: .string("2010-09-01"), value: 24.40),
        AreaData(time: .string("2010-10-01"), value: 24.46),
        AreaData(time: .string("2010-11-01"), value: 23.64),
        AreaData(time: .string("2010-12-01"), value: 22.90),
        AreaData(time: .string("2011-01-03"), value: 23.73),
        AreaData(time: .string("2011-02-01"), value: 23.52),
        AreaData(time: .string("2011-03-01"), value: 24.15),
        AreaData(time: .string("2011-04-01"), value: 24.37),
        AreaData(time: .string("2011-05-02"), value: 24.40),
        AreaData(time: .string("2011-06-01"), value: 24.45),
        AreaData(time: .string("2011-07-01"), value: 24.24),
        AreaData(time: .string("2011-08-01"), value: 24.00),
        AreaData(time: .string("2011-09-01"), value: 22.77),
        AreaData(time: .string("2011-10-03"), value: 24.21),
        AreaData(time: .string("2011-11-01"), value: 23.40),
        AreaData(time: .string("2011-12-01"), value: 23.90),
        AreaData(time: .string("2012-01-02"), value: 24.84),
        AreaData(time: .string("2012-02-01"), value: 25.04),
        AreaData(time: .string("2012-03-01"), value: 24.90),
        AreaData(time: .string("2012-04-02"), value: 25.06),
        AreaData(time: .string("2012-05-01"), value: 24.63),
        AreaData(time: .string("2012-06-01"), value: 25.07),
        AreaData(time: .string("2012-07-02"), value: 25.30),
        AreaData(time: .string("2012-08-01"), value: 25.08),
        AreaData(time: .string("2012-09-03"), value: 25.27),
        AreaData(time: .string("2012-10-01"), value: 25.39),
        AreaData(time: .string("2012-11-01"), value: 25.06),
        AreaData(time: .string("2012-12-03"), value: 25.03),
        AreaData(time: .string("2013-01-01"), value: 25.26),
        AreaData(time: .string("2013-02-01"), value: 25.20),
        AreaData(time: .string("2013-03-01"), value: 25.30),
        AreaData(time: .string("2013-04-01"), value: 25.38),
        AreaData(time: .string("2013-05-01"), value: 25.22),
        AreaData(time: .string("2013-06-03"), value: 24.88),
        AreaData(time: .string("2013-07-01"), value: 24.98),
        AreaData(time: .string("2013-08-01"), value: 24.60),
        AreaData(time: .string("2013-09-02"), value: 24.65),
        AreaData(time: .string("2013-10-01"), value: 24.62),
        AreaData(time: .string("2013-11-01"), value: 24.65),
        AreaData(time: .string("2013-12-02"), value: 24.70),
        AreaData(time: .string("2014-01-01"), value: 24.98),
        AreaData(time: .string("2014-02-03"), value: 24.95),
        AreaData(time: .string("2014-03-03"), value: 25.45),
        AreaData(time: .string("2014-04-01"), value: 25.40),
        AreaData(time: .string("2014-05-01"), value: 25.51),
        AreaData(time: .string("2014-06-02"), value: 25.34),
        AreaData(time: .string("2014-07-01"), value: 25.30),
        AreaData(time: .string("2014-08-01"), value: 25.36),
        AreaData(time: .string("2014-09-01"), value: 25.16),
        AreaData(time: .string("2014-10-01"), value: 25.53),
        AreaData(time: .string("2014-11-03"), value: 25.40),
        AreaData(time: .string("2014-12-01"), value: 25.70),
        AreaData(time: .string("2015-01-01"), value: 25.95),
        AreaData(time: .string("2015-02-02"), value: 25.81),
        AreaData(time: .string("2015-03-02"), value: 25.63),
        AreaData(time: .string("2015-04-01"), value: 25.39),
        AreaData(time: .string("2015-05-01"), value: 25.62),
        AreaData(time: .string("2015-06-01"), value: 25.23),
        AreaData(time: .string("2015-07-01"), value: 25.47),
        AreaData(time: .string("2015-08-03"), value: 25.18),
        AreaData(time: .string("2015-09-01"), value: 25.30),
        AreaData(time: .string("2015-10-01"), value: 25.68),
        AreaData(time: .string("2015-11-02"), value: 25.63),
        AreaData(time: .string("2015-12-01"), value: 25.57),
        AreaData(time: .string("2016-01-01"), value: 25.55),
        AreaData(time: .string("2016-02-01"), value: 25.05),
        AreaData(time: .string("2016-03-01"), value: 25.61),
        AreaData(time: .string("2016-04-01"), value: 25.91),
        AreaData(time: .string("2016-05-02"), value: 25.84),
        AreaData(time: .string("2016-06-01"), value: 25.94),
        AreaData(time: .string("2016-07-01"), value: 26.19),
        AreaData(time: .string("2016-08-01"), value: 26.06),
        AreaData(time: .string("2016-09-01"), value: 25.65),
        AreaData(time: .string("2016-10-03"), value: 25.80),
        AreaData(time: .string("2016-11-01"), value: 25.06),
        AreaData(time: .string("2016-12-01"), value: 25.20),
        AreaData(time: .string("2017-01-02"), value: 25.70),
        AreaData(time: .string("2017-02-01"), value: 25.78),
        AreaData(time: .string("2017-03-01"), value: 25.90),
        AreaData(time: .string("2017-04-03"), value: 26.02),
        AreaData(time: .string("2017-05-01"), value: 26.02),
        AreaData(time: .string("2017-06-01"), value: 26.39),
        AreaData(time: .string("2017-07-03"), value: 26.30),
        AreaData(time: .string("2017-08-01"), value: 26.14),
        AreaData(time: .string("2017-09-01"), value: 26.39),
        AreaData(time: .string("2017-10-02"), value: 26.12),
        AreaData(time: .string("2017-11-01"), value: 25.81),
        AreaData(time: .string("2017-12-01"), value: 25.82),
        AreaData(time: .string("2018-01-01"), value: 26.06),
        AreaData(time: .string("2018-02-01"), value: 25.78),
        AreaData(time: .string("2018-03-01"), value: 25.75),
        AreaData(time: .string("2018-04-02"), value: 25.72),
        AreaData(time: .string("2018-05-01"), value: 25.75),
        AreaData(time: .string("2018-06-01"), value: 26.58),
        AreaData(time: .string("2018-07-02"), value: 26.14),
        AreaData(time: .string("2018-08-01"), value: 25.86),
        AreaData(time: .string("2018-09-03"), value: 25.67),
        AreaData(time: .string("2018-10-01"), value: 25.82),
        AreaData(time: .string("2018-11-01"), value: 25.41),
        AreaData(time: .string("2018-12-03"), value: 25.77),
        AreaData(time: .string("2019-01-01"), value: 25.35),
        AreaData(time: .string("2019-02-01"), value: 25.79),
        AreaData(time: .string("2019-03-01"), value: 25.77),
        AreaData(time: .string("2019-04-01"), value: 25.90),
        AreaData(time: .string("2019-05-01"), value: 26.23)
    ]
    
    private static let yearData = [
        AreaData(time: .string("2006-01-02"), value: 24.89),
        AreaData(time: .string("2007-01-01"), value: 25.50),
        AreaData(time: .string("2008-01-01"), value: 23.90),
        AreaData(time: .string("2009-01-01"), value: 15.40),
        AreaData(time: .string("2010-01-01"), value: 22.00),
        AreaData(time: .string("2011-01-03"), value: 23.73),
        AreaData(time: .string("2012-01-02"), value: 24.84),
        AreaData(time: .string("2013-01-01"), value: 25.26),
        AreaData(time: .string("2014-01-01"), value: 24.98),
        AreaData(time: .string("2015-01-01"), value: 25.95),
        AreaData(time: .string("2016-01-01"), value: 25.55),
        AreaData(time: .string("2017-01-02"), value: 25.70),
        AreaData(time: .string("2018-01-01"), value: 26.06),
        AreaData(time: .string("2019-01-01"), value: 26.23)
    ]
    
}
