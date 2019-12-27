import UIKit
import LightweightCharts

class CustomPriceFormatterViewController: UIViewController {

    enum SourceType: CaseIterable {
        case js
        case native
        
        var title: String {
            switch self {
            case .js:
                return "JavaScript"
            case .native:
                return "Swift"
            }
        }
    }
    
    enum FormatterType: CaseIterable {
        case dollar
        case pound
        
        var formatterString: String {
            switch self {
            case .dollar: return "function(price) { return '$' + price.toFixed(2); }"
            case .pound: return "function(price) { return '\u{00A3}' + price.toFixed(2); }"
            }
        }
        
        var formatterClosure: (BarPrice) -> String {
            switch self {
            case .dollar: return { "🦄$\(($0 * 100).rounded() / 100)" }
            case .pound: return { "☁️\u{00A3}\(($0 * 100).rounded() / 100)" }
            }
        }
        
        var title: String {
            switch self {
            case .dollar: return "Dollar"
            case .pound: return "Pound"
            }
        }
        
    }
    
    private var chart: LightweightCharts!
    private var series: AreaSeries!
    
    private var selectedFormat: FormatterType = .dollar {
        didSet {
            updateFormatter()
        }
    }
    private var selectedSource: SourceType = .js {
        didSet {
            updateFormatter()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }
        
        setupUI()
        setupData()
    }
    
    private func setupUI() {
        let sourceSegmentedControl = UISegmentedControl(items: SourceType.allCases.map { $0.title })
        sourceSegmentedControl.addTarget(self, action: #selector(sourceValueChanged), for: .valueChanged)
        view.addSubview(sourceSegmentedControl)
        sourceSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                sourceSegmentedControl.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                sourceSegmentedControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
        } else {
            NSLayoutConstraint.activate([
                sourceSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                sourceSegmentedControl.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        }
        sourceSegmentedControl.selectedSegmentIndex = 0
        
        let formatterSegmentedControl = UISegmentedControl(items: FormatterType.allCases.map { $0.title })
        formatterSegmentedControl.addTarget(self, action: #selector(formatterValueChanged), for: .valueChanged)
        view.addSubview(formatterSegmentedControl)
        formatterSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                formatterSegmentedControl.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                formatterSegmentedControl.bottomAnchor.constraint(equalTo: sourceSegmentedControl.topAnchor, constant: -8)
            ])
        } else {
            NSLayoutConstraint.activate([
                formatterSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                formatterSegmentedControl.bottomAnchor.constraint(equalTo: sourceSegmentedControl.topAnchor, constant: -8)
            ])
        }
        formatterSegmentedControl.selectedSegmentIndex = 0
        
        
        let options = ChartOptions(
            layout: LayoutOptions(backgroundColor: "#000", textColor: "rgba(255, 255, 255, 0.8)"),
            priceScale: PriceScaleOptions(borderColor: "rgba(255, 255, 255, 0.8)"),
            timeScale: TimeScaleOptions(borderColor: "rgba(255, 255, 255, 0.8)"),
            crosshair: CrosshairOptions(mode: .normal),
            grid: GridOptions(
                verticalLines: GridLineOptions(color: "rgba(255, 255, 255, 0.2)"),
                horizontalLines: GridLineOptions(color: "rgba(255, 255, 255, 0.2)")
            ),
            localization: LocalizationOptions(priceFormatter: .javaScript(FormatterType.allCases[0].formatterString))
        )
        let chart = LightweightCharts(options: options)
        view.addSubview(chart)
        chart.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                chart.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                chart.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                chart.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                chart.bottomAnchor.constraint(equalTo: formatterSegmentedControl.topAnchor, constant: -8)
            ])
        } else {
            NSLayoutConstraint.activate([
                chart.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                chart.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                chart.topAnchor.constraint(equalTo: view.topAnchor),
                chart.bottomAnchor.constraint(equalTo: formatterSegmentedControl.topAnchor, constant: -8)
            ])
        }
        self.chart = chart
    }
    
    private func setupData() {
        let options = AreaSeriesOptions(
            topColor: "rgba(21, 101, 192, 0.5)",
            bottomColor: "rgba(21, 101, 192, 0.5)",
            lineColor: "rgba(255, 255, 255, 0.8)",
            lineWidth: .two
        )
        let series = chart.addAreaSeries(options: options)
        let data = [
            LineData(time: .string("2018-10-19"), value: 72.35),
            LineData(time: .string("2018-10-22"), value: 72.57),
            LineData(time: .string("2018-10-23"), value: 72.10),
            LineData(time: .string("2018-10-24"), value: 70.54),
            LineData(time: .string("2018-10-25"), value: 69.96),
            LineData(time: .string("2018-10-26"), value: 70.40),
            LineData(time: .string("2018-10-29"), value: 71.45),
            LineData(time: .string("2018-10-30"), value: 72.87),
            LineData(time: .string("2018-10-31"), value: 73.61),
            LineData(time: .string("2018-11-01"), value: 73.12),
            LineData(time: .string("2018-11-02"), value: 72.27),
            LineData(time: .string("2018-11-05"), value: 73.12),
            LineData(time: .string("2018-11-06"), value: 73.31),
            LineData(time: .string("2018-11-07"), value: 75.08),
            LineData(time: .string("2018-11-08"), value: 75.48),
            LineData(time: .string("2018-11-09"), value: 74.86),
            LineData(time: .string("2018-11-12"), value: 74.69),
            LineData(time: .string("2018-11-13"), value: 74.61),
            LineData(time: .string("2018-11-14"), value: 74.09),
            LineData(time: .string("2018-11-15"), value: 74.84),
            LineData(time: .string("2018-11-16"), value: 76.06),
            LineData(time: .string("2018-11-19"), value: 76.35),
            LineData(time: .string("2018-11-20"), value: 74.78),
            LineData(time: .string("2018-11-21"), value: 74.79),
            LineData(time: .string("2018-11-23"), value: 74.67),
            LineData(time: .string("2018-11-26"), value: 75.44),
            LineData(time: .string("2018-11-27"), value: 76.34),
            LineData(time: .string("2018-11-28"), value: 77.23),
            LineData(time: .string("2018-11-29"), value: 77.91),
            LineData(time: .string("2018-11-30"), value: 79.34),
            LineData(time: .string("2018-12-03"), value: 79.22),
            LineData(time: .string("2018-12-04"), value: 78.21),
            LineData(time: .string("2018-12-06"), value: 78.37),
            LineData(time: .string("2018-12-07"), value: 76.72),
            LineData(time: .string("2018-12-10"), value: 77.42),
            LineData(time: .string("2018-12-11"), value: 77.11),
            LineData(time: .string("2018-12-12"), value: 78.01),
            LineData(time: .string("2018-12-13"), value: 79.01),
            LineData(time: .string("2018-12-14"), value: 76.48),
            LineData(time: .string("2018-12-17"), value: 75.23),
            LineData(time: .string("2018-12-18"), value: 74.33),
            LineData(time: .string("2018-12-19"), value: 73.77),
            LineData(time: .string("2018-12-20"), value: 73.49),
            LineData(time: .string("2018-12-21"), value: 72.90),
            LineData(time: .string("2018-12-24"), value: 71.15),
            LineData(time: .string("2018-12-26"), value: 74.00),
            LineData(time: .string("2018-12-27"), value: 75.38),
            LineData(time: .string("2018-12-28"), value: 75.37),
            LineData(time: .string("2018-12-31"), value: 76.41),
            LineData(time: .string("2019-01-02"), value: 75.59),
            LineData(time: .string("2019-01-03"), value: 74.04),
            LineData(time: .string("2019-01-04"), value: 76.27),
            LineData(time: .string("2019-01-07"), value: 75.43),
            LineData(time: .string("2019-01-08"), value: 75.99),
            LineData(time: .string("2019-01-09"), value: 75.41),
            LineData(time: .string("2019-01-10"), value: 74.48),
            LineData(time: .string("2019-01-11"), value: 74.90),
            LineData(time: .string("2019-01-14"), value: 73.37),
            LineData(time: .string("2019-01-15"), value: 74.50),
            LineData(time: .string("2019-01-16"), value: 74.61),
            LineData(time: .string("2019-01-17"), value: 75.60),
            LineData(time: .string("2019-01-18"), value: 75.87),
            LineData(time: .string("2019-01-22"), value: 75.83),
            LineData(time: .string("2019-01-23"), value: 75.44),
            LineData(time: .string("2019-01-24"), value: 73.17),
            LineData(time: .string("2019-01-25"), value: 72.95),
            LineData(time: .string("2019-01-28"), value: 72.92),
            LineData(time: .string("2019-01-29"), value: 73.23),
            LineData(time: .string("2019-01-30"), value: 73.37),
            LineData(time: .string("2019-01-31"), value: 74.43),
            LineData(time: .string("2019-02-01"), value: 76.45),
            LineData(time: .string("2019-02-04"), value: 76.87),
            LineData(time: .string("2019-02-05"), value: 77.15),
            LineData(time: .string("2019-02-06"), value: 77.39),
            LineData(time: .string("2019-02-07"), value: 76.82),
            LineData(time: .string("2019-02-08"), value: 77.52),
            LineData(time: .string("2019-02-11"), value: 76.71),
            LineData(time: .string("2019-02-12"), value: 78.52),
            LineData(time: .string("2019-02-13"), value: 79.02),
            LineData(time: .string("2019-02-14"), value: 78.94),
            LineData(time: .string("2019-02-15"), value: 79.81),
            LineData(time: .string("2019-02-19"), value: 79.24),
            LineData(time: .string("2019-02-20"), value: 79.43),
            LineData(time: .string("2019-02-21"), value: 79.83),
            LineData(time: .string("2019-02-22"), value: 80.77),
            LineData(time: .string("2019-02-25"), value: 80.38),
            LineData(time: .string("2019-02-26"), value: 80.74),
            LineData(time: .string("2019-02-27"), value: 80.62),
            LineData(time: .string("2019-02-28"), value: 81.29),
            LineData(time: .string("2019-03-01"), value: 81.65),
            LineData(time: .string("2019-03-04"), value: 81.37),
            LineData(time: .string("2019-03-05"), value: 81.70),
            LineData(time: .string("2019-03-06"), value: 80.76),
            LineData(time: .string("2019-03-07"), value: 80.45),
            LineData(time: .string("2019-03-08"), value: 79.80),
            LineData(time: .string("2019-03-11"), value: 80.87),
            LineData(time: .string("2019-03-12"), value: 81.23),
            LineData(time: .string("2019-03-13"), value: 81.60),
            LineData(time: .string("2019-03-14"), value: 81.49),
            LineData(time: .string("2019-03-15"), value: 81.57),
            LineData(time: .string("2019-03-18"), value: 81.35),
            LineData(time: .string("2019-03-19"), value: 81.91),
            LineData(time: .string("2019-03-20"), value: 82.08),
            LineData(time: .string("2019-03-21"), value: 82.95),
            LineData(time: .string("2019-03-22"), value: 82.29),
            LineData(time: .string("2019-03-25"), value: 82.35),
            LineData(time: .string("2019-03-26"), value: 82.92),
            LineData(time: .string("2019-03-27"), value: 82.29),
            LineData(time: .string("2019-03-28"), value: 82.63),
            LineData(time: .string("2019-03-29"), value: 83.17),
            LineData(time: .string("2019-04-01"), value: 83.30),
            LineData(time: .string("2019-04-02"), value: 83.21),
            LineData(time: .string("2019-04-03"), value: 83.18),
            LineData(time: .string("2019-04-04"), value: 81.85),
            LineData(time: .string("2019-04-05"), value: 81.15),
            LineData(time: .string("2019-04-08"), value: 80.95),
            LineData(time: .string("2019-04-09"), value: 80.80),
            LineData(time: .string("2019-04-10"), value: 80.82),
            LineData(time: .string("2019-04-11"), value: 79.84),
            LineData(time: .string("2019-04-12"), value: 79.43),
            LineData(time: .string("2019-04-15"), value: 78.53),
            LineData(time: .string("2019-04-16"), value: 77.56),
            LineData(time: .string("2019-04-17"), value: 73.92),
            LineData(time: .string("2019-04-18"), value: 73.19),
            LineData(time: .string("2019-04-22"), value: 73.46),
            LineData(time: .string("2019-04-23"), value: 74.60),
            LineData(time: .string("2019-04-24"), value: 74.73),
            LineData(time: .string("2019-04-25"), value: 76.34),
            LineData(time: .string("2019-04-26"), value: 76.63),
            LineData(time: .string("2019-04-29"), value: 76.78),
            LineData(time: .string("2019-04-30"), value: 78.71),
            LineData(time: .string("2019-05-01"), value: 78.72),
            LineData(time: .string("2019-05-02"), value: 79.52),
            LineData(time: .string("2019-05-03"), value: 80.00),
            LineData(time: .string("2019-05-06"), value: 79.48),
            LineData(time: .string("2019-05-07"), value: 77.90),
            LineData(time: .string("2019-05-08"), value: 78.18),
            LineData(time: .string("2019-05-09"), value: 78.33),
            LineData(time: .string("2019-05-10"), value: 78.19),
            LineData(time: .string("2019-05-13"), value: 77.17),
            LineData(time: .string("2019-05-14"), value: 77.42),
            LineData(time: .string("2019-05-15"), value: 77.55),
            LineData(time: .string("2019-05-16"), value: 79.13),
            LineData(time: .string("2019-05-17"), value: 78.72),
            LineData(time: .string("2019-05-20"), value: 78.88),
            LineData(time: .string("2019-05-21"), value: 79.50),
            LineData(time: .string("2019-05-22"), value: 80.98),
            LineData(time: .string("2019-05-23"), value: 81.02),
            LineData(time: .string("2019-05-24"), value: 81.17),
            LineData(time: .string("2019-05-28"), value: 81.10)
        ]
        series.setData(data: data)
        self.series = series
    }

    private func updateFormatter() {
        let method: JavaScriptMethod<BarPrice>
        switch selectedSource {
        case .js:
            method = .javaScript(selectedFormat.formatterString)
        case .native:
            method = .closure(selectedFormat.formatterClosure)
        }
        
        let options = ChartOptions(localization: LocalizationOptions(priceFormatter: method))
        chart.applyOptions(options: options)
    }
    
    @objc private func formatterValueChanged(_ sender: UISegmentedControl) {
        selectedFormat = FormatterType.allCases[sender.selectedSegmentIndex]
    }
    
    @objc private func sourceValueChanged(_ sender: UISegmentedControl) {
        selectedSource = SourceType.allCases[sender.selectedSegmentIndex]
    }
    
}
