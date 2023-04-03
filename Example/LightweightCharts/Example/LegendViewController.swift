import UIKit
import LightweightCharts

class LegendViewController: UIViewController {

    private var chart: LightweightCharts!
    private var series: AreaSeries!
    private let legendLabel = UILabel()
    private let legend = "ETC USD 7D VWAP"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }
        
        setupUI()
        setupData()
        setupSubscription()
    }
    
    private func setupUI() {
        let padding: CGFloat = 16
        legendLabel.text = legend
        legendLabel.font = .systemFont(ofSize: 18)
        view.addSubview(legendLabel)
        legendLabel.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                legendLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
                legendLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
                legendLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding)
            ])
        } else {
            NSLayoutConstraint.activate([
                legendLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
                legendLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
                legendLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: padding)
            ])
        }
        
        let options = ChartOptions(
            layout: LayoutOptions(background: .solid(color: "#000000"), textColor: "#d1d4dc"),
            rightPriceScale: VisiblePriceScaleOptions(scaleMargins: PriceScaleMargins(top: 0.3, bottom: 0.25)),
            crosshair: CrosshairOptions(
                vertLine: CrosshairLineOptions(color: "rgba(224, 227, 235, 0.1)", width: .four, style: .solid),
                horzLine: CrosshairLineOptions(visible: false, labelVisible: false)
            ),
            grid: GridOptions(
                verticalLines: GridLineOptions(color: "rgba(42, 46, 57, 0)"),
                horizontalLines: GridLineOptions(color: "rgba(42, 46, 57, 0)")
            )
        )
        let chart = LightweightCharts(options: options)
        view.addSubview(chart)
        chart.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                chart.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                chart.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                chart.topAnchor.constraint(equalTo: legendLabel.bottomAnchor, constant: padding),
                chart.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
        } else {
            NSLayoutConstraint.activate([
                chart.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                chart.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                chart.topAnchor.constraint(equalTo: legendLabel.bottomAnchor, constant: padding),
                chart.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        }
        self.chart = chart
    }
    
    private func setupData() {
        let options = AreaSeriesOptions(
            topColor: "rgba(38, 198, 218, 0.56)",
            bottomColor: "rgba(38, 198, 218, 0.04)",
            lineColor: "rgba(38, 198, 218, 1)",
            lineWidth: .two,
            crosshairMarkerVisible: false
        )
        let series = chart.addAreaSeries(options: options)
        let data = [
            SingleValueData(time: .string("2018-10-19"), value: 26.19),
            SingleValueData(time: .string("2018-10-22"), value: 25.87),
            SingleValueData(time: .string("2018-10-23"), value: 25.83),
            SingleValueData(time: .string("2018-10-24"), value: 25.78),
            SingleValueData(time: .string("2018-10-25"), value: 25.82),
            SingleValueData(time: .string("2018-10-26"), value: 25.81),
            SingleValueData(time: .string("2018-10-29"), value: 25.82),
            SingleValueData(time: .string("2018-10-30"), value: 25.71),
            SingleValueData(time: .string("2018-10-31"), value: 25.82),
            SingleValueData(time: .string("2018-11-01"), value: 25.72),
            SingleValueData(time: .string("2018-11-02"), value: 25.74),
            SingleValueData(time: .string("2018-11-05"), value: 25.81),
            SingleValueData(time: .string("2018-11-06"), value: 25.75),
            SingleValueData(time: .string("2018-11-07"), value: 25.73),
            SingleValueData(time: .string("2018-11-08"), value: 25.75),
            SingleValueData(time: .string("2018-11-09"), value: 25.75),
            SingleValueData(time: .string("2018-11-12"), value: 25.76),
            SingleValueData(time: .string("2018-11-13"), value: 25.80),
            SingleValueData(time: .string("2018-11-14"), value: 25.77),
            SingleValueData(time: .string("2018-11-15"), value: 25.75),
            SingleValueData(time: .string("2018-11-16"), value: 25.75),
            SingleValueData(time: .string("2018-11-19"), value: 25.75),
            SingleValueData(time: .string("2018-11-20"), value: 25.72),
            SingleValueData(time: .string("2018-11-21"), value: 25.78),
            SingleValueData(time: .string("2018-11-23"), value: 25.72),
            SingleValueData(time: .string("2018-11-26"), value: 25.78),
            SingleValueData(time: .string("2018-11-27"), value: 25.85),
            SingleValueData(time: .string("2018-11-28"), value: 25.85),
            SingleValueData(time: .string("2018-11-29"), value: 25.55),
            SingleValueData(time: .string("2018-11-30"), value: 25.41),
            SingleValueData(time: .string("2018-12-03"), value: 25.41),
            SingleValueData(time: .string("2018-12-04"), value: 25.42),
            SingleValueData(time: .string("2018-12-06"), value: 25.33),
            SingleValueData(time: .string("2018-12-07"), value: 25.39),
            SingleValueData(time: .string("2018-12-10"), value: 25.32),
            SingleValueData(time: .string("2018-12-11"), value: 25.48),
            SingleValueData(time: .string("2018-12-12"), value: 25.39),
            SingleValueData(time: .string("2018-12-13"), value: 25.45),
            SingleValueData(time: .string("2018-12-14"), value: 25.52),
            SingleValueData(time: .string("2018-12-17"), value: 25.38),
            SingleValueData(time: .string("2018-12-18"), value: 25.36),
            SingleValueData(time: .string("2018-12-19"), value: 25.65),
            SingleValueData(time: .string("2018-12-20"), value: 25.70),
            SingleValueData(time: .string("2018-12-21"), value: 25.66),
            SingleValueData(time: .string("2018-12-24"), value: 25.66),
            SingleValueData(time: .string("2018-12-26"), value: 25.65),
            SingleValueData(time: .string("2018-12-27"), value: 25.66),
            SingleValueData(time: .string("2018-12-28"), value: 25.68),
            SingleValueData(time: .string("2018-12-31"), value: 25.77),
            SingleValueData(time: .string("2019-01-02"), value: 25.72),
            SingleValueData(time: .string("2019-01-03"), value: 25.69),
            SingleValueData(time: .string("2019-01-04"), value: 25.71),
            SingleValueData(time: .string("2019-01-07"), value: 25.72),
            SingleValueData(time: .string("2019-01-08"), value: 25.72),
            SingleValueData(time: .string("2019-01-09"), value: 25.66),
            SingleValueData(time: .string("2019-01-10"), value: 25.85),
            SingleValueData(time: .string("2019-01-11"), value: 25.92),
            SingleValueData(time: .string("2019-01-14"), value: 25.94),
            SingleValueData(time: .string("2019-01-15"), value: 25.95),
            SingleValueData(time: .string("2019-01-16"), value: 26.00),
            SingleValueData(time: .string("2019-01-17"), value: 25.99),
            SingleValueData(time: .string("2019-01-18"), value: 25.60),
            SingleValueData(time: .string("2019-01-22"), value: 25.81),
            SingleValueData(time: .string("2019-01-23"), value: 25.70),
            SingleValueData(time: .string("2019-01-24"), value: 25.74),
            SingleValueData(time: .string("2019-01-25"), value: 25.80),
            SingleValueData(time: .string("2019-01-28"), value: 25.83),
            SingleValueData(time: .string("2019-01-29"), value: 25.70),
            SingleValueData(time: .string("2019-01-30"), value: 25.78),
            SingleValueData(time: .string("2019-01-31"), value: 25.35),
            SingleValueData(time: .string("2019-02-01"), value: 25.60),
            SingleValueData(time: .string("2019-02-04"), value: 25.65),
            SingleValueData(time: .string("2019-02-05"), value: 25.73),
            SingleValueData(time: .string("2019-02-06"), value: 25.71),
            SingleValueData(time: .string("2019-02-07"), value: 25.71),
            SingleValueData(time: .string("2019-02-08"), value: 25.72),
            SingleValueData(time: .string("2019-02-11"), value: 25.76),
            SingleValueData(time: .string("2019-02-12"), value: 25.84),
            SingleValueData(time: .string("2019-02-13"), value: 25.85),
            SingleValueData(time: .string("2019-02-14"), value: 25.87),
            SingleValueData(time: .string("2019-02-15"), value: 25.89),
            SingleValueData(time: .string("2019-02-19"), value: 25.90),
            SingleValueData(time: .string("2019-02-20"), value: 25.92),
            SingleValueData(time: .string("2019-02-21"), value: 25.96),
            SingleValueData(time: .string("2019-02-22"), value: 26.00),
            SingleValueData(time: .string("2019-02-25"), value: 25.93),
            SingleValueData(time: .string("2019-02-26"), value: 25.92),
            SingleValueData(time: .string("2019-02-27"), value: 25.67),
            SingleValueData(time: .string("2019-02-28"), value: 25.79),
            SingleValueData(time: .string("2019-03-01"), value: 25.86),
            SingleValueData(time: .string("2019-03-04"), value: 25.94),
            SingleValueData(time: .string("2019-03-05"), value: 26.02),
            SingleValueData(time: .string("2019-03-06"), value: 25.95),
            SingleValueData(time: .string("2019-03-07"), value: 25.89),
            SingleValueData(time: .string("2019-03-08"), value: 25.94),
            SingleValueData(time: .string("2019-03-11"), value: 25.91),
            SingleValueData(time: .string("2019-03-12"), value: 25.92),
            SingleValueData(time: .string("2019-03-13"), value: 26.00),
            SingleValueData(time: .string("2019-03-14"), value: 26.05),
            SingleValueData(time: .string("2019-03-15"), value: 26.11),
            SingleValueData(time: .string("2019-03-18"), value: 26.10),
            SingleValueData(time: .string("2019-03-19"), value: 25.98),
            SingleValueData(time: .string("2019-03-20"), value: 26.11),
            SingleValueData(time: .string("2019-03-21"), value: 26.12),
            SingleValueData(time: .string("2019-03-22"), value: 25.88),
            SingleValueData(time: .string("2019-03-25"), value: 25.85),
            SingleValueData(time: .string("2019-03-26"), value: 25.72),
            SingleValueData(time: .string("2019-03-27"), value: 25.73),
            SingleValueData(time: .string("2019-03-28"), value: 25.80),
            SingleValueData(time: .string("2019-03-29"), value: 25.77),
            SingleValueData(time: .string("2019-04-01"), value: 26.06),
            SingleValueData(time: .string("2019-04-02"), value: 25.93),
            SingleValueData(time: .string("2019-04-03"), value: 25.95),
            SingleValueData(time: .string("2019-04-04"), value: 26.06),
            SingleValueData(time: .string("2019-04-05"), value: 26.16),
            SingleValueData(time: .string("2019-04-08"), value: 26.12),
            SingleValueData(time: .string("2019-04-09"), value: 26.07),
            SingleValueData(time: .string("2019-04-10"), value: 26.13),
            SingleValueData(time: .string("2019-04-11"), value: 26.04),
            SingleValueData(time: .string("2019-04-12"), value: 26.04),
            SingleValueData(time: .string("2019-04-15"), value: 26.05),
            SingleValueData(time: .string("2019-04-16"), value: 26.01),
            SingleValueData(time: .string("2019-04-17"), value: 26.09),
            SingleValueData(time: .string("2019-04-18"), value: 26.00),
            SingleValueData(time: .string("2019-04-22"), value: 26.00),
            SingleValueData(time: .string("2019-04-23"), value: 26.06),
            SingleValueData(time: .string("2019-04-24"), value: 26.00),
            SingleValueData(time: .string("2019-04-25"), value: 25.81),
            SingleValueData(time: .string("2019-04-26"), value: 25.88),
            SingleValueData(time: .string("2019-04-29"), value: 25.91),
            SingleValueData(time: .string("2019-04-30"), value: 25.90),
            SingleValueData(time: .string("2019-05-01"), value: 26.02),
            SingleValueData(time: .string("2019-05-02"), value: 25.97),
            SingleValueData(time: .string("2019-05-03"), value: 26.02),
            SingleValueData(time: .string("2019-05-06"), value: 26.03),
            SingleValueData(time: .string("2019-05-07"), value: 26.04),
            SingleValueData(time: .string("2019-05-08"), value: 26.05),
            SingleValueData(time: .string("2019-05-09"), value: 26.05),
            SingleValueData(time: .string("2019-05-10"), value: 26.08),
            SingleValueData(time: .string("2019-05-13"), value: 26.05),
            SingleValueData(time: .string("2019-05-14"), value: 26.01),
            SingleValueData(time: .string("2019-05-15"), value: 26.03),
            SingleValueData(time: .string("2019-05-16"), value: 26.14),
            SingleValueData(time: .string("2019-05-17"), value: 26.09),
            SingleValueData(time: .string("2019-05-20"), value: 26.01),
            SingleValueData(time: .string("2019-05-21"), value: 26.12),
            SingleValueData(time: .string("2019-05-22"), value: 26.15),
            SingleValueData(time: .string("2019-05-23"), value: 26.18),
            SingleValueData(time: .string("2019-05-24"), value: 26.16),
            SingleValueData(time: .string("2019-05-28"), value: 26.23)
        ]
        series.setData(data: data)
        self.series = series
    }
    
    private func setupSubscription() {
        chart.delegate = self
        chart.subscribeCrosshairMove()
    }

}

// MARK: - ChartDelegate
extension LegendViewController: ChartDelegate {
    
    func didClick(onChart chart: ChartApi, parameters: MouseEventParams) {
        
    }
    
    func didCrosshairMove(onChart chart: ChartApi, parameters: MouseEventParams) {
        if case let .barPrice(price) = parameters.price(forSeries: series) {
            self.legendLabel.text = self.legend + " \((price * 100).rounded() / 100)"
        } else {
            self.legendLabel.text = self.legend
        }
    }
    
    func didVisibleTimeRangeChange(onChart chart: ChartApi, parameters: TimeRange?) {
        
    }
    
}
