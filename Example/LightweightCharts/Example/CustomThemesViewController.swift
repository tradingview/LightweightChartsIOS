import UIKit
import LightweightCharts

class CustomThemesViewController: UIViewController {

    enum Theme: CaseIterable {
        case dark
        case light
        
        var title: String {
            switch self {
            case .dark: return "Dark"
            case .light: return "Light"
            }
        }
        
        var chartOptions: ChartOptions {
            switch self {
            case .dark:
                return ChartOptions(
                    watermark: WatermarkOptions(color: "rgba(0, 0, 0, 0)"),
                    // TODO: need lineColor
                    layout: LayoutOptions(background: .solid(color: "#2B2B43"), textColor: "#D9D9D9"),
                    crosshair: CrosshairOptions(
                        vertLine: CrosshairLineOptions(color: "#758696"),
                        horzLine: CrosshairLineOptions(color: "#758696")
                    ),
                    grid: GridOptions(
                        verticalLines: GridLineOptions(color: "#2B2B43"),
                        horizontalLines: GridLineOptions(color: "#363C4E")
                    )
                )
            case .light:
                return ChartOptions(
                    watermark: WatermarkOptions(color: "rgba(0, 0, 0, 0)"),
                    // TODO: need lineColor
                    layout: LayoutOptions(background: .solid(color: "#FFFFFF"), textColor: "#191919"),
                    crosshair: CrosshairOptions(
                        vertLine: CrosshairLineOptions(color: "#758696"),
                        horzLine: CrosshairLineOptions(color: "#758696")
                    ),
                    grid: GridOptions(
                        verticalLines: GridLineOptions(visible: false),
                        horizontalLines: GridLineOptions(color: "#f0f3fa")
                    )
                )
            }
        }
        
        var seriesOptions: AreaSeriesOptions {
            switch self {
            case .dark:
                return AreaSeriesOptions(
                    topColor: "rgba(32, 226, 47, 0.56)",
                    bottomColor: "rgba(32, 226, 47, 0.04)",
                    lineColor: "rgba(32, 226, 47, 1)"
                )
            case .light:
                return AreaSeriesOptions(
                    topColor: "rgba(33, 150, 243, 0.56)",
                    bottomColor: "rgba(33, 150, 243, 0.04)",
                    lineColor: "rgba(33, 150, 243, 1)"
                )
            }
        }
    }
    
    private var chart: LightweightCharts!
    private var series: AreaSeries!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }
        
        setupUI()
        setupData()
        syncToTheme(.dark)
    }
    
    private func setupUI() {
        let segmentedControl = UISegmentedControl(items: Theme.allCases.map { $0.title })
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
            rightPriceScale: VisiblePriceScaleOptions(borderVisible: false),
            timeScale: TimeScaleOptions(borderVisible: false)
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
    
    private func setupData() {
        let options = AreaSeriesOptions(
            topColor: "rgba(33, 150, 243, 0.56)",
            bottomColor: "rgba(33, 150, 243, 0.04)",
            lineColor: "rgba(33, 150, 243, 1)",
            lineWidth: .two
        )
        let series = chart.addAreaSeries(options: options)
        let data = [
            AreaData(time: .string("2018-10-19"), value: 35.98),
            AreaData(time: .string("2018-10-22"), value: 35.75),
            AreaData(time: .string("2018-10-23"), value: 35.65),
            AreaData(time: .string("2018-10-24"), value: 34.12),
            AreaData(time: .string("2018-10-25"), value: 35.84),
            AreaData(time: .string("2018-10-26"), value: 35.24),
            AreaData(time: .string("2018-10-29"), value: 35.99),
            AreaData(time: .string("2018-10-30"), value: 37.71),
            AreaData(time: .string("2018-10-31"), value: 38.14),
            AreaData(time: .string("2018-11-01"), value: 37.95),
            AreaData(time: .string("2018-11-02"), value: 37.66),
            AreaData(time: .string("2018-11-05"), value: 38.02),
            AreaData(time: .string("2018-11-06"), value: 37.73),
            AreaData(time: .string("2018-11-07"), value: 38.30),
            AreaData(time: .string("2018-11-08"), value: 38.30),
            AreaData(time: .string("2018-11-09"), value: 38.34),
            AreaData(time: .string("2018-11-12"), value: 38.00),
            AreaData(time: .string("2018-11-13"), value: 37.72),
            AreaData(time: .string("2018-11-14"), value: 38.29),
            AreaData(time: .string("2018-11-15"), value: 38.49),
            AreaData(time: .string("2018-11-16"), value: 38.59),
            AreaData(time: .string("2018-11-19"), value: 38.18),
            AreaData(time: .string("2018-11-20"), value: 36.76),
            AreaData(time: .string("2018-11-21"), value: 37.51),
            AreaData(time: .string("2018-11-23"), value: 37.39),
            AreaData(time: .string("2018-11-26"), value: 37.77),
            AreaData(time: .string("2018-11-27"), value: 38.36),
            AreaData(time: .string("2018-11-28"), value: 39.06),
            AreaData(time: .string("2018-11-29"), value: 39.42),
            AreaData(time: .string("2018-11-30"), value: 39.01),
            AreaData(time: .string("2018-12-03"), value: 39.15),
            AreaData(time: .string("2018-12-04"), value: 37.69),
            AreaData(time: .string("2018-12-06"), value: 37.88),
            AreaData(time: .string("2018-12-07"), value: 37.41),
            AreaData(time: .string("2018-12-10"), value: 37.35),
            AreaData(time: .string("2018-12-11"), value: 36.84),
            AreaData(time: .string("2018-12-12"), value: 36.98),
            AreaData(time: .string("2018-12-13"), value: 36.76),
            AreaData(time: .string("2018-12-14"), value: 36.34),
            AreaData(time: .string("2018-12-17"), value: 36.21),
            AreaData(time: .string("2018-12-18"), value: 35.65),
            AreaData(time: .string("2018-12-19"), value: 35.19),
            AreaData(time: .string("2018-12-20"), value: 34.62),
            AreaData(time: .string("2018-12-21"), value: 33.75),
            AreaData(time: .string("2018-12-24"), value: 33.07),
            AreaData(time: .string("2018-12-26"), value: 34.14),
            AreaData(time: .string("2018-12-27"), value: 34.47),
            AreaData(time: .string("2018-12-28"), value: 34.35),
            AreaData(time: .string("2018-12-31"), value: 34.05),
            AreaData(time: .string("2019-01-02"), value: 34.37),
            AreaData(time: .string("2019-01-03"), value: 34.64),
            AreaData(time: .string("2019-01-04"), value: 35.81),
            AreaData(time: .string("2019-01-07"), value: 35.43),
            AreaData(time: .string("2019-01-08"), value: 35.72),
            AreaData(time: .string("2019-01-09"), value: 36.06),
            AreaData(time: .string("2019-01-10"), value: 35.82),
            AreaData(time: .string("2019-01-11"), value: 35.63),
            AreaData(time: .string("2019-01-14"), value: 35.77),
            AreaData(time: .string("2019-01-15"), value: 35.83),
            AreaData(time: .string("2019-01-16"), value: 35.90),
            AreaData(time: .string("2019-01-17"), value: 35.91),
            AreaData(time: .string("2019-01-18"), value: 36.21),
            AreaData(time: .string("2019-01-22"), value: 34.97),
            AreaData(time: .string("2019-01-23"), value: 36.89),
            AreaData(time: .string("2019-01-24"), value: 36.24),
            AreaData(time: .string("2019-01-25"), value: 35.78),
            AreaData(time: .string("2019-01-28"), value: 35.37),
            AreaData(time: .string("2019-01-29"), value: 36.08),
            AreaData(time: .string("2019-01-30"), value: 35.43),
            AreaData(time: .string("2019-01-31"), value: 36.57),
            AreaData(time: .string("2019-02-01"), value: 36.79),
            AreaData(time: .string("2019-02-04"), value: 36.77),
            AreaData(time: .string("2019-02-05"), value: 37.15),
            AreaData(time: .string("2019-02-06"), value: 37.17),
            AreaData(time: .string("2019-02-07"), value: 37.68),
            AreaData(time: .string("2019-02-08"), value: 37.60),
            AreaData(time: .string("2019-02-11"), value: 37.00),
            AreaData(time: .string("2019-02-12"), value: 37.24),
            AreaData(time: .string("2019-02-13"), value: 37.03),
            AreaData(time: .string("2019-02-14"), value: 37.26),
            AreaData(time: .string("2019-02-15"), value: 37.77),
            AreaData(time: .string("2019-02-19"), value: 37.55),
            AreaData(time: .string("2019-02-20"), value: 37.79),
            AreaData(time: .string("2019-02-21"), value: 38.47),
            AreaData(time: .string("2019-02-22"), value: 38.61),
            AreaData(time: .string("2019-02-25"), value: 38.57),
            AreaData(time: .string("2019-02-26"), value: 38.80),
            AreaData(time: .string("2019-02-27"), value: 38.53),
            AreaData(time: .string("2019-02-28"), value: 38.67),
            AreaData(time: .string("2019-03-01"), value: 39.10),
            AreaData(time: .string("2019-03-04"), value: 38.73),
            AreaData(time: .string("2019-03-05"), value: 38.72),
            AreaData(time: .string("2019-03-06"), value: 38.61),
            AreaData(time: .string("2019-03-07"), value: 38.38),
            AreaData(time: .string("2019-03-08"), value: 38.19),
            AreaData(time: .string("2019-03-11"), value: 39.17),
            AreaData(time: .string("2019-03-12"), value: 39.49),
            AreaData(time: .string("2019-03-13"), value: 39.56),
            AreaData(time: .string("2019-03-14"), value: 39.87),
            AreaData(time: .string("2019-03-15"), value: 40.47),
            AreaData(time: .string("2019-03-18"), value: 39.92),
            AreaData(time: .string("2019-03-19"), value: 39.78),
            AreaData(time: .string("2019-03-20"), value: 39.47),
            AreaData(time: .string("2019-03-21"), value: 40.05),
            AreaData(time: .string("2019-03-22"), value: 39.46),
            AreaData(time: .string("2019-03-25"), value: 39.18),
            AreaData(time: .string("2019-03-26"), value: 39.63),
            AreaData(time: .string("2019-03-27"), value: 40.21),
            AreaData(time: .string("2019-03-28"), value: 40.42),
            AreaData(time: .string("2019-03-29"), value: 39.98),
            AreaData(time: .string("2019-04-01"), value: 40.31),
            AreaData(time: .string("2019-04-02"), value: 40.02),
            AreaData(time: .string("2019-04-03"), value: 40.27),
            AreaData(time: .string("2019-04-04"), value: 40.41),
            AreaData(time: .string("2019-04-05"), value: 40.42),
            AreaData(time: .string("2019-04-08"), value: 40.71),
            AreaData(time: .string("2019-04-09"), value: 41.04),
            AreaData(time: .string("2019-04-10"), value: 41.08),
            AreaData(time: .string("2019-04-11"), value: 41.04),
            AreaData(time: .string("2019-04-12"), value: 41.30),
            AreaData(time: .string("2019-04-15"), value: 41.78),
            AreaData(time: .string("2019-04-16"), value: 41.97),
            AreaData(time: .string("2019-04-17"), value: 42.57),
            AreaData(time: .string("2019-04-18"), value: 42.43),
            AreaData(time: .string("2019-04-22"), value: 42.00),
            AreaData(time: .string("2019-04-23"), value: 41.99),
            AreaData(time: .string("2019-04-24"), value: 41.85),
            AreaData(time: .string("2019-04-25"), value: 42.93),
            AreaData(time: .string("2019-04-26"), value: 43.08),
            AreaData(time: .string("2019-04-29"), value: 43.45),
            AreaData(time: .string("2019-04-30"), value: 43.53),
            AreaData(time: .string("2019-05-01"), value: 43.42),
            AreaData(time: .string("2019-05-02"), value: 42.65),
            AreaData(time: .string("2019-05-03"), value: 43.29),
            AreaData(time: .string("2019-05-06"), value: 43.30),
            AreaData(time: .string("2019-05-07"), value: 42.76),
            AreaData(time: .string("2019-05-08"), value: 42.55),
            AreaData(time: .string("2019-05-09"), value: 42.92),
            AreaData(time: .string("2019-05-10"), value: 43.15),
            AreaData(time: .string("2019-05-13"), value: 42.28),
            AreaData(time: .string("2019-05-14"), value: 42.91),
            AreaData(time: .string("2019-05-15"), value: 42.49),
            AreaData(time: .string("2019-05-16"), value: 43.19),
            AreaData(time: .string("2019-05-17"), value: 43.54),
            AreaData(time: .string("2019-05-20"), value: 42.78),
            AreaData(time: .string("2019-05-21"), value: 43.29),
            AreaData(time: .string("2019-05-22"), value: 43.30),
            AreaData(time: .string("2019-05-23"), value: 42.73),
            AreaData(time: .string("2019-05-24"), value: 42.67),
            AreaData(time: .string("2019-05-28"), value: 42.75)
        ]
        series.setData(data: data)
        self.series = series
    }

    private func syncToTheme(_ theme: Theme) {
        chart.applyOptions(options: theme.chartOptions)
        series.applyOptions(options: theme.seriesOptions)
    }
    
    @objc private func valueChanged(_ sender: UISegmentedControl) {
        syncToTheme(Theme.allCases[sender.selectedSegmentIndex])
    }
    
}
